import os
from azure_openai_conversion import modify_gherkin_scenario

def save_gherkin_scenarios_to_markdown(gherkin_text, filename, directory="gherkin_scenarios"):
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)

        gherkin_text = gherkin_text.replace("```gherkin", "").replace("```", "").strip()

        lines = gherkin_text.split("\n")
        md_lines = []
        feature_added = False

        for line in lines:
            # Ignore lines that are not part of Gherkin syntax
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

        markdown_file = os.path.join(directory, filename)
        with open(markdown_file, 'w') as file:
            file.write(md_content)

        print(f"Gherkin scenario saved to {markdown_file}")

    except Exception as ex:
        print(f"Error in saving Gherkin to Markdown: {ex}")

def edit_scenarios(scenarios):
    try:
        if scenarios:

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