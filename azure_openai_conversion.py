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
            "Convert the following text to Gherkin syntax:\n"
            f"Text: {text}\n"
            "Gherkin:"
        )

        response = client.chat.completions.create(
            model=deployment,
            messages=[
                {"role": "system", "content": "You are an AI assistant that converts text to Gherkin syntax."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.7,
            max_tokens=250,
            stop=["\n"] 
        )

        gherkin_text = response.choices[0].message.content.strip()
        return gherkin_text

    except Exception as ex:
        print(f"Error in converting text to Gherkin: {ex}")
        return None
