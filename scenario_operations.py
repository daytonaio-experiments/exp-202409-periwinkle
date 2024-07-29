import os
from azure_openai_conversion import modify_gherkin_scenario
from qdrant_operations import search_similar_scenarios

def save_gherkin_scenarios_to_markdown(gherkin_text, filename, project_name):
    try:
        base_directory = "./Projects"     
        project_directory = os.path.join(base_directory, project_name)
        
        os.makedirs(project_directory, exist_ok=True)

        gherkin_text = gherkin_text.replace("```gherkin", "").replace("```", "").strip()
       
        md_content = convert_gherkin_to_markdown(gherkin_text)

        markdown_file = os.path.join(project_directory, filename)
        with open(markdown_file, 'w') as file:
            file.write(md_content)

        print(f"Gherkin scenario saved to {markdown_file}")

    except Exception as ex:
        print(f"Error in saving Gherkin to Markdown: {ex}")

def convert_gherkin_to_markdown(gherkin_text):
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
        elif line.startswith(("Given", "When", "Then", "And", "But")):
            md_lines.append(f"* {line}")
        else:
            md_lines.append(line)

    return "\n".join(md_lines).strip()

def edit_scenarios(scenarios, user_input):
    try:
        if not scenarios:
            print("No scenarios to edit.")
            return None
        
        edit_choice = input("Do you want to search for similar scenarios? (yes/no): ").lower()
        if edit_choice == "yes":
            similar_scenarios = search_similar_scenarios(user_input)
            found_similar_scenario = False

            for hit in similar_scenarios:
                if hit.score >= 0.70:
                    gherkin_scenario = hit.payload['gherkin_scenario']
                    formatted_scenario = format_gherkin_scenario(gherkin_scenario)
                    print(f"Similarity Score: {hit.score}\nScenario:\n{formatted_scenario}")
                    found_similar_scenario = True

            if not found_similar_scenario:
                print("There are no similar scenarios.")

        edit_instructions = input("Enter editing instructions in plain text (e.g., 'Keep scenarios 1 and 2. Delete scenarios 3 and 4. Modify scenario 5 to ...'): ").strip()
        modified_scenarios = modify_gherkin_scenario(scenarios, edit_instructions)

        if not modified_scenarios:
            print("Failed to modify scenarios.")

        return modified_scenarios
    
    except Exception as ex:
        print(f"Error editing scenarios: {ex}")
        return None
    
def format_gherkin_scenario(gherkin_scenario):
    formatted_lines = []
    lines = gherkin_scenario.splitlines()
    for line in lines:
        if line.startswith("Given"):
                formatted_lines.append("")
        formatted_lines.append(line)
    return "\n".join(formatted_lines)
