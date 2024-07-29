from azure_openai_conversion import convert_user_input_text_to_gherkin
from scenario_operations import save_gherkin_scenarios_to_markdown, edit_scenarios
from qdrant_operations import save_scenario_to_qdrant
from code_generation import generate_code

def handle_scenario_generation():

    project_name = input("Enter the project name: ")

    print("Enter text to convert to BDD scenarios (Gherkin):")
    print("Examples:")
    print("  - As a [type of user], I want [an action] so that [a benefit/a value]")
    print("  - As a user, I want to log in to my account so that I can access personalized content.")
    input_text = input("> ")

    gherkin_output_scenarios = convert_user_input_text_to_gherkin(input_text)
    print("Generated Gherkin:\n", gherkin_output_scenarios)

    edit_choice = input("Do you want to edit the scenarios? (yes/no): ").lower()

    if edit_choice == "yes":
        handle_scenario_editing(gherkin_output_scenarios, project_name, input_text)
    else:
        save_and_generate_code(gherkin_output_scenarios, project_name, input_text)

def handle_scenario_editing(scenarios, project_name, input_text):
    while True:
        modified_scenarios = edit_scenarios(scenarios, input_text)
        
        if not modified_scenarios:
            print("Failed to modify the scenarios.")
            break
        
        print("\nModified scenarios:\n", modified_scenarios)
        save_choice = input("Do you want to save the modified scenarios? (yes/no): ").lower()
        if save_choice == "yes":
            save_and_generate_code(modified_scenarios, project_name, input_text)
            break
        else:
            print("Continuing with scenario modification...")
            scenarios = modified_scenarios

def save_and_generate_code(gherkin_output_scenarios, project_name, input_text):
    filename = input("Enter the filename to save the Gherkin scenario (e.g., user_story.feature): ")
    save_gherkin_scenarios_to_markdown(gherkin_output_scenarios, filename, project_name)
    print(f"Scenarios saved to 'Projects/{project_name}/{filename}'")
    save_scenario_to_qdrant(project_name, input_text, gherkin_output_scenarios)

    generate_code_choice = input("\nDo you want to generate code from these scenarios? (yes/no): ").lower()
    if generate_code_choice == "yes":
        generate_code(project_name, filename)

def handle_code_generation():
    project_name = input("Enter the project name: ")
    feature_filename = input("Enter the Gherkin feature filename (e.g., user_story.feature): ")
    generate_code(project_name, feature_filename)

def main():
    while True:
        print("Choose an option:")
        print("1. Generate Gherkin scenarios")
        print("2. Process existing scenarios")
        print("3. Exit")
        choice = input("Enter your choice (1/2/3): ").strip()

        if choice == "1":
            handle_scenario_generation()
            break
        elif choice == "2":
            handle_code_generation()
            break
        elif choice == "3":
            print("Exiting the program.")
            break
        else:
            print("Invalid choice. Please select 1, 2, or 3.\n")

if __name__ == "__main__":
    main()