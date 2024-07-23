import streamlit as st
import os
from azure_openai_conversion import convert_user_input_text_to_gherkin
from scenario_operations import save_gherkin_scenarios_to_markdown
from qdrant_operations import save_scenario_to_qdrant
from streamlit_app_operations import edit_scenarios

def get_existing_projects(base_path="./Projects"):
    if not os.path.exists(base_path):
        os.makedirs(base_path)
    return [f for f in os.listdir(base_path) if os.path.isdir(os.path.join(base_path, f))]

def get_files_for_project(base_path, project_name):
    project_path = os.path.join(base_path, project_name)
    if os.path.exists(project_path):
        return [os.path.join(project_name, f) for f in os.listdir(project_path) if os.path.isfile(os.path.join(project_path, f))]
    return []

if 'created_files' not in st.session_state:
    st.session_state['created_files'] = []
if 'projects' not in st.session_state:
    st.session_state['projects'] = get_existing_projects()
if 'gherkin_output_scenarios' not in st.session_state:
    st.session_state['gherkin_output_scenarios'] = ""
if 'modified_gherkin_scenario' not in st.session_state:
    st.session_state['modified_gherkin_scenario'] = ""

if __name__ == "__main__":
    st.title("Gherkin Scenario Generator")

    st.header("Step 1: Project Selection")
    project_options = st.session_state['projects'] + ["Create new project"]
    project_choice = st.selectbox("Select an existing project or create a new one:", project_options)

    if project_choice == "Create new project":
        project_name = st.text_input("Enter the new project name:")
        if project_name and st.button("Create Project"):
            if project_name not in st.session_state['projects']:
                st.session_state['projects'].append(project_name)
                os.makedirs(os.path.join("Projects", project_name))
                st.success(f"Project '{project_name}' created.")
    else:
        project_name = project_choice

    st.header("Step 2: User Story Input")
    st.write("Enter text to convert to BDD scenarios (Gherkin):")
    st.write("Examples:")
    st.write("  - As a [type of user], I want [an action] so that [a benefit/a value]")
    st.write("  - As a user, I want to log in to my account so that I can access personalized content.")
    
    input_text = st.text_area("User Story:", height=100)

    if st.button("Generate Gherkin Scenarios"):
        if input_text:
            gherkin_output_scenarios = convert_user_input_text_to_gherkin(input_text)
            if gherkin_output_scenarios:
                st.success("Generated Gherkin Scenarios:")
                st.text_area("Gherkin Scenarios:", value=gherkin_output_scenarios, height=300)
                st.session_state['gherkin_output_scenarios'] = gherkin_output_scenarios
            else:
                st.error("Failed to generate Gherkin.")
        else:
            st.warning("Please enter a user story.")

    if st.session_state['gherkin_output_scenarios']:
        edit_choice = st.radio("Do you want to edit the scenarios?", ("No", "Yes"))

        if edit_choice == "Yes":
            st.header("Step 3: Edit Scenarios")
            st.write("Current Scenarios:")
            st.text_area("Current Gherkin Scenarios:", value=st.session_state['gherkin_output_scenarios'], height=300)
            modified_gherkin_scenario = edit_scenarios(project_name, input_text)
            if modified_gherkin_scenario:
                st.session_state['modified_gherkin_scenario'] = modified_gherkin_scenario
            else:
                st.error("Failed to modify scenarios.")
        else:
            modified_gherkin_scenario = st.session_state.get('modified_gherkin_scenario', None)

        st.subheader("Step 4: Save Scenarios")
        filename = st.text_input("Enter the filename to save the Gherkin scenario (e.g., user_story.feature):")

        if filename:
            if st.button("Save"):
                st.write(f"Saving scenarios to '{project_name}/{filename}'")
                if st.session_state['modified_gherkin_scenario']:
                    st.write(f"Modified Gherkin Scenarios:\n{st.session_state['modified_gherkin_scenario']}")
                    save_gherkin_scenarios_to_markdown(st.session_state['modified_gherkin_scenario'], filename, project_name)
                    save_scenario_to_qdrant(project_name, input_text, st.session_state['modified_gherkin_scenario'])
                    st.session_state['created_files'].append(f"{project_name}/{filename}")
                    st.success(f"Scenarios saved to '{project_name}/{filename}'")
                else:
                    st.write(f"Gherkin Scenarios:\n{st.session_state['gherkin_output_scenarios']}")
                    save_gherkin_scenarios_to_markdown(st.session_state['gherkin_output_scenarios'], filename, project_name)
                    save_scenario_to_qdrant(project_name, input_text, st.session_state['gherkin_output_scenarios'])
                    st.session_state['created_files'].append(f"{project_name}/{filename}")
                    st.success(f"Scenarios saved to '{project_name}/{filename}'")
        else:
            st.warning("Please enter a filename.")

    st.sidebar.header("Projects")
    for project in st.session_state['projects']:
        files = get_files_for_project("./Projects", project)
        with st.sidebar.expander(f"{project}"):
            if files:
                for file_path in files:
                    st.write(os.path.basename(file_path))
            else:
                st.write("No files in this project.")
