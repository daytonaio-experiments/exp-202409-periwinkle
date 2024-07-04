from azure_openai_conversion import convert_to_gherkin
from save_to_markdown import save_gherkin_to_markdown

if __name__ == "__main__":
    input_text = input("Enter text to convert to Gherkin: ")
    gherkin_output = convert_to_gherkin(input_text)
    if gherkin_output:
        print("Generated Gherkin:\n", gherkin_output)
        filename = input("Enter the filename to save the Gherkin scenario (e.g., scenario1.md): ")
        save_gherkin_to_markdown(gherkin_output, filename)
    else:
        print("Failed to generate Gherkin.")
