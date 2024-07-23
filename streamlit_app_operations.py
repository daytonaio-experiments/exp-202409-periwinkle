import streamlit as st
import os
from azure_openai_conversion import modify_gherkin_scenario
from qdrant_operations import search_similar_scenarios

def save_gherkin_scenarios_to_markdown(gherkin_text, filename, project_name):
    try:
        base_directory = "./Projects"

        if not os.path.exists(base_directory):
            os.makedirs(base_directory)
        
        project_directory = os.path.join(base_directory, project_name)
        
        if not os.path.exists(project_directory):
            os.makedirs(project_directory)

        gherkin_text = gherkin_text.replace("```gherkin", "").replace("```", "").strip()

        lines = gherkin_text.split("\n")
        md_lines = []
        feature_added = False

        for line in lines:
            if line.startswith("Certainly!") or line.startswith("Sure,"):
                continue

            if line.startswith("Feature:"):
                if feature_added:
                    md_lines.append("")
                md_lines.append(f"# {line}")
                feature_added = True
            elif line.startswith("Scenario:") or line.startswith("Scenario Outline:"):
                md_lines.append("")
                md_lines.append(f"## {line}")
            elif line.startswith("Given") or line.startswith("When") or line.startswith("Then") or line.startswith("And") or line.startswith("But"):
                md_lines.append(f"* {line}")
            else:
                md_lines.append(line)

        md_content = "\n".join(md_lines).strip()

        markdown_file = os.path.join(project_directory, filename)
        with open(markdown_file, 'w') as file:
            file.write(md_content)

        st.success(f"Gherkin scenario saved to {markdown_file}")

    except Exception as ex:
        st.error(f"Error in saving Gherkin to Markdown: {ex}")

def edit_scenarios(project_name, input_text):
    similar_scenarios = search_similar_scenarios(input_text)
    found_similar_scenario = False

    for hit in similar_scenarios:
        if hit.score >= 0.70:
            gherkin_scenario = hit.payload['gherkin_scenario']
            formatted_scenario = format_gherkin_scenario(gherkin_scenario)
            st.write(f"Similarity Score: {hit.score}")
            st.text_area("Similar Scenario:", value=formatted_scenario, height=300)
            found_similar_scenario = True

    if not found_similar_scenario:
        st.write("There are no similar scenarios.")

    edit_instructions = st.text_area("Enter editing instructions:", height=100)

    if st.button("Edit"):
        modified_gherkin_scenario = modify_gherkin_scenario(st.session_state['gherkin_output_scenarios'], edit_instructions)
        if modified_gherkin_scenario:
            st.session_state['modified_gherkin_scenario'] = modified_gherkin_scenario
            st.success("Modified Scenarios:")
            st.text_area("Modified Gherkin Scenarios:", value=modified_gherkin_scenario, height=300)
        else:
            st.error("Failed to modify scenarios.")
    else:
        modified_gherkin_scenario = st.session_state.get('modified_gherkin_scenario', None)

    return modified_gherkin_scenario

def format_gherkin_scenario(gherkin_scenario):
    formatted_lines = []
    lines = gherkin_scenario.splitlines()
    for line in lines:
        if line.startswith("Given"):
            if formatted_lines:
                formatted_lines.append("")
        formatted_lines.append(line)
    return "\n".join(formatted_lines)
