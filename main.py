from azure_openai_conversion import convert_to_gherkin

if __name__ == "__main__":
    input_text = input("Enter text to convert to Gherkin: ")
    gherkin_output = convert_to_gherkin(input_text)
    if gherkin_output:
        print("Generated Gherkin:\n", gherkin_output)
    else:
        print("Failed to generate Gherkin.")
