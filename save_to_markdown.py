import os

def save_gherkin_to_markdown(gherkin_text, filename, directory="gherkin_scenarios"):
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
