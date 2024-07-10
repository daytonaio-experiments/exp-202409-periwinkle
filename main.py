from azure_openai_conversion import convert_to_gherkin
from markdown_operations import save_gherkin_to_markdown, edit_scenarios_in_md

if __name__ == "__main__":
    input_text = input("Enter text to convert to Gherkin: ")
    gherkin_output = convert_to_gherkin(input_text)
    
    if gherkin_output:
        print("Generated Gherkin:\n", gherkin_output)

        edit_choice = input("Do you want to edit the scenarios? (yes/no): ").lower()
        if edit_choice == "yes":
            scenarios = gherkin_output
            while True:
                modified_scenarios = edit_scenarios_in_md(scenarios)
                if modified_scenarios:
                    print("\nModified scenarios:\n", modified_scenarios)
                    save_choice = input("Do you want to save the modified scenarios? (yes/no): ").lower()
                    if save_choice == "yes":
                        filename = input("Enter the filename to save the modified Gherkin scenario (e.g., scenario1.md): ")
                        save_gherkin_to_markdown(modified_scenarios, filename, directory="gherkin_scenarios/updated_scenarios")
                        print(f"Modified scenarios saved to 'gherkin_scenarios/updated_scenarios/{filename}'")
                        break
                    else:
                        scenarios = modified_scenarios
                else:
                    print("Failed to modify the scenarios.")
                    break
        else:
            filename = input("Enter the filename to save the Gherkin scenario (e.g., scenario1.md): ")
            save_gherkin_to_markdown(gherkin_output, filename)
            print(f"Scenarios saved to 'gherkin_scenarios/new_scenarios/{filename}'")
    else:
        print("Failed to generate Gherkin.")
