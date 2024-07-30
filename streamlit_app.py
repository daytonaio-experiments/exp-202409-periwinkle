import streamlit as st
import os
from azure_openai_conversion import convert_user_input_text_to_gherkin
from scenario_operations import save_gherkin_scenarios_to_markdown
from qdrant_operations import save_scenario_to_qdrant
from streamlit_app_operations import edit_scenarios
from streamlit_code_generation import generate_code

def get_existing_projects(base_path="./Projects"):
    if not os.path.exists(base_path):
        os.makedirs(base_path)
    return [f for f in os.listdir(base_path) if os.path.isdir(os.path.join(base_path, f))]

def get_files_for_project(base_path, project_name):
    project_path = os.path.join(base_path, project_name)
    if os.path.exists(project_path):
        return [os.path.join(project_name, f) for f in os.listdir(project_path) if os.path.isfile(os.path.join(project_path, f))]
    return []

def initialize_session_state():
    default_state = {
        'created_files': [],
        'projects': get_existing_projects(),
        'project_name': "",
        'input_text': "",
        'gherkin_output_scenarios': "",
        'modified_gherkin_scenario': "",
        'filename': "",
        'step': 1,
        'saved': False
    }

    for key, value in default_state.items():
        if key not in st.session_state:
            st.session_state[key] = value

def next_step():
    st.session_state['step'] += 1

def previous_step():
    st.session_state['step'] -= 1

def next_button(step):
    if st.button("Next", key=f"next_{step}"):
        st.session_state['step'] += 1

def step1():

    st.header("Step 1: Project Selection")
    project_options = st.session_state['projects'] + ["Create new project"]
    project_choice = st.selectbox("Select an existing project or create a new one:", project_options, key="project_selectbox")

    if project_choice == "Create new project":
        project_name = st.text_input("Enter the new project name:")
        if project_name and st.button("Create Project"):
            if project_name not in st.session_state['projects']:
                st.session_state['projects'].append(project_name)
                os.makedirs(os.path.join("Projects", project_name))
                st.session_state['project_name'] = project_name
                st.success(f"Project '{project_name}' created.")
                next_step()
    else:
        if st.button("Next", key="next"):
            st.session_state['project_name'] = project_choice
            next_step()

def step2():
    st.header("Step 2: User Story Input")
    st.write("Enter text to convert to BDD scenarios (Gherkin):")
    st.write("Examples:")
    st.write("  - As a [type of user], I want [an action] so that [a benefit/a value]")
    st.write("  - As a user, I want to log in to my account so that I can access personalized content.")
    
    input_text = st.text_area("User Story:", height=100)
    st.session_state['input_text'] = input_text

    if st.button("Generate Gherkin Scenarios"):
        if input_text:
            with st.spinner("Generating Gherkin Scenarios... Please wait."):
                gherkin_output_scenarios = convert_user_input_text_to_gherkin(input_text)
                if gherkin_output_scenarios:
                    st.success("Generated Gherkin Scenarios:")
                    st.text_area("Gherkin Scenarios:", value=gherkin_output_scenarios, height=300)
                    st.session_state['gherkin_output_scenarios'] = gherkin_output_scenarios
                else:
                    st.error("Failed to generate Gherkin.")
        else:
            st.warning("Please enter a user story.")

    if 'gherkin_output_scenarios' in st.session_state and st.session_state['gherkin_output_scenarios']:   
        next_button(2)

def step3():
    input_text = st.session_state['input_text']
    st.header("Step 3: Edit Scenarios")
    st.write("Current Scenarios:")
    st.text_area("Current Gherkin Scenarios:", value=st.session_state['gherkin_output_scenarios'], height=300)
    edit_choice = st.radio("Do you want to edit the scenarios?", ("No", "Yes"))

    if edit_choice == "Yes":         
        modified_gherkin_scenario = edit_scenarios(st.session_state['gherkin_output_scenarios'], input_text)
        if modified_gherkin_scenario:
            st.success("Modified Scenarios:")
            st.text_area("Modified Gherkin Scenarios:", value=modified_gherkin_scenario, height=300)
            st.session_state['modified_gherkin_scenario'] = modified_gherkin_scenario

    else:
        modified_gherkin_scenario = st.session_state.get('modified_gherkin_scenario', None)
        
    next_button(3)

def step4():
    project_name = st.session_state['project_name']
    input_text = st.session_state['input_text']
    st.subheader("Step 4: Save Scenarios")
    filename = st.text_input("Enter the filename to save the Gherkin scenario (e.g., user_story.feature):")
    st.session_state['filename'] = filename

    if filename:
        if st.button("Save"):
            st.write(f"Saving scenarios to '{project_name}/{filename}'")

            if st.session_state['modified_gherkin_scenario']:
                scenarios_to_save = st.session_state['modified_gherkin_scenario']
                st.write(f"Modified Gherkin Scenarios:\n{scenarios_to_save}")
            else:
                scenarios_to_save = st.session_state['gherkin_output_scenarios']
                st.write(f"Original Gherkin Scenarios:\n{scenarios_to_save}")

            save_gherkin_scenarios_to_markdown(scenarios_to_save, filename, project_name)
            save_scenario_to_qdrant(project_name, input_text, scenarios_to_save)
            st.session_state['created_files'].append(f"{project_name}/{filename}")
            st.success(f"Scenarios saved to '{project_name}/{filename}'")
            st.session_state['saved'] = True
    else:
        st.warning("Please enter a filename and click ENTER")

    if st.button("Next", key="next3"):
        if st.session_state['saved']:
            next_step()
    else:
        st.warning("You must save the scenarios before proceeding.")

def step5():
    project_name = st.session_state['project_name']
    filename = st.session_state['filename']
    st.subheader("Step 5: Generate Code")
    generate_code_choice = st.radio("Do you want to generate code from the scenarios?", ("No", "Yes"))

    if generate_code_choice == "Yes":
        feature_filename = filename
        if feature_filename:
            generate_code(project_name, feature_filename)
        else:
            st.warning("Gherkin scenarios saved to file but no filename provided for code generation.")
    else:
        st.write("No code generation requested.")

def main():
    initialize_session_state()
    st.title("BBD AI Code Generator")

    steps = {
        1: step1,
        2: step2,
        3: step3,
        4: step4,
        5: step5
    }

    current_step = st.session_state['step']
    if current_step in steps:
        steps[current_step]()

    st.sidebar.header("Projects")
    for project in st.session_state['projects']:
        files = get_files_for_project("./Projects", project)
        with st.sidebar.expander(f"{project}"):
            if files:
                for file_path in files:
                    st.write(os.path.basename(file_path))
            else:
                st.write("No files in this project.")

if __name__ == "__main__":
    main()