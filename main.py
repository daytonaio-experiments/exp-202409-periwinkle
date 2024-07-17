from azure_openai_conversion import convert_user_input_text_to_gherkin
from scenario_operations import save_gherkin_scenarios_to_markdown, edit_scenarios

if __name__ == "__main__":
    input_text = input("Enter user story to convert to BDD scenarios (Gherkin): ")
    gherkin_output_scenarios = convert_user_input_text_to_gherkin(input_text)
    
    if gherkin_output_scenarios:
        print("Generated Gherkin:\n", gherkin_output_scenarios)

        edit_choice = input("Do you want to edit the scenarios? (yes/no): ").lower()
        if edit_choice == "yes":
            scenarios = gherkin_output_scenarios
            while True:
                modified_scenarios = edit_scenarios(scenarios)
                if modified_scenarios:
                    print("\nModified scenarios:\n", modified_scenarios)
                    save_choice = input("Do you want to save the modified scenarios? (yes/no): ").lower()
                    if save_choice == "yes":
                        filename = input("Enter the filename to save the modified Gherkin scenario (e.g., scenario1.feature): ")
                        save_gherkin_scenarios_to_markdown(modified_scenarios, filename, directory="gherkin_scenarios")
                        print(f"Modified scenarios saved to 'gherkin_scenarios/{filename}'")
                        break
                    else:
                        print("Continuing with scenario modification...")
                        scenarios = modified_scenarios
                else:
                    print("Failed to modify the scenarios.")
                    break
        else:
            filename = input("Enter the filename to save the Gherkin scenario (e.g., scenario1.feature): ")
            save_gherkin_scenarios_to_markdown(gherkin_output_scenarios, filename)
            print(f"Scenarios saved to 'gherkin_scenarios/{filename}'")
    else:
        print("Failed to generate Gherkin.")
