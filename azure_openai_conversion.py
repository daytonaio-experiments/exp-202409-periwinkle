import os
from dotenv import load_dotenv
from openai import AzureOpenAI

load_dotenv()

api_key = os.getenv("AZURE_OPENAI_API_KEY")
endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
deployment = os.getenv("AZURE_OPENAI_DEPLOYMENT")

client = AzureOpenAI(
    api_key=api_key,
    azure_endpoint=endpoint,
    azure_deployment=deployment,
    api_version="2024-05-01-preview"
)

def convert_to_gherkin(text):
    try:

        prompt = (
            "Generate multiple BDD scenarios in Gherkin syntax based on the following text.\n"
            f"Text: {text}\n"
            "Ensure each scenario includes clear Feature, Scenario, Given, When, Then, and "
            "optionally And/But statements."
            "To enhance readability, please number each scenario."
        )

        response = client.chat.completions.create(
            model=deployment,
            messages=[
                {"role": "system", "content": "You are an AI assistant specialized in "
                  "generating BDD scenarios. Your task is to convert given business requirements, "
                  "often presented as User Stories, into multiple BDD Given-When-Then scenarios. "
                  "Ensure each scenario includes clear Feature, Scenario, Given, When, Then, and "
                  "optionally And/But statements to accurately represent the user's intent."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.6,
            max_tokens=2000,
        )

        gherkin_text = response.choices[0].message.content.strip()
        return gherkin_text

    except Exception as ex:
        print(f"Error in converting text to Gherkin: {ex}")
        return None
