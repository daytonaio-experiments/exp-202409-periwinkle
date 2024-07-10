import os
from azure_openai_conversion import modify_gherkin_scenario

def save_gherkin_to_markdown(gherkin_text, filename, directory="gherkin_scenarios/new_scenarios"):
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)

        gherkin_text = gherkin_text.replace("```gherkin", "").replace("```", "").strip()

        mdg_text = "# Feature\n\n" + gherkin_text.replace("\n", "\n* ")

        markdown_file = os.path.join(directory, filename)
        with open(markdown_file, 'w') as file:
            file.write(mdg_text)

        print(f"Gherkin scenario saved to {markdown_file}")

    except Exception as ex:
        print(f"Error in saving Gherkin to Markdown: {ex}")

def read_scenarios_from_md(filename, directory="gherkin_scenarios/new_scenarios"):
    try:
        file_path = os.path.join(directory, filename)
        print(f"Attempting to read file from: {file_path}")
        
        with open(file_path, 'r') as file:
            return file.read()
    except FileNotFoundError:
        print(f"File '{filename}' not found at path: {file_path}")
        return None
    except Exception as ex:
        print(f"Error reading file '{filename}': {ex}")
        return None

def update_md_file(filename, content, directory="gherkin_scenarios/updated_scenarios"):
    try:
        updated_filename = f"updated_{filename}"
        file_path = os.path.join(directory, updated_filename)
        
        with open(file_path, 'w') as file:
            file.write(content)
        print(f"MD file '{updated_filename}' updated successfully.")
        return True
    except Exception as ex:
        print(f"Error updating MD file '{updated_filename}': {ex}")
        return False

def edit_scenarios_in_md(scenarios):
    try:
        if scenarios:
            print("Current scenarios:\n", scenarios)

            edit_instructions = input("Enter editing instructions in plain text (e.g., 'Keep scenarios 1 and 2. Delete scenarios 3 and 4. Modify scenario 5 to ...'): ").strip()

            modified_scenarios = modify_gherkin_scenario(scenarios, edit_instructions)
            
            if modified_scenarios:
                return modified_scenarios
            else:
                print("Failed to modify scenarios.")
                return scenarios
        else:
            print("No scenarios to edit.")
            return None
    
    except Exception as ex:
        print(f"Error editing scenarios: {ex}")
        return None