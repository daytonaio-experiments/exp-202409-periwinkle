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

def convert_user_input_text_to_gherkin(text):
    try:

        prompt = (
            "Generate multiple BDD scenarios in Gherkin syntax in `.feature` format based on the following text:\n"
            f"Text: {text}\n"
            "Each scenario should include Feature, Scenario, Given, When, Then, and optionally And/But statements. "
            "Ensure scenarios are numbered and formatted properly in `.feature` style. "
            "Avoid any additional explanatory text or sentences, and do not include the `feature` keyword or any other headers."
            )

        response = client.chat.completions.create(
        model=deployment,
        messages=[
            {"role": "system", "content": "You are an AI assistant specialized in generating BDD scenarios. "
            "Your task is to convert business requirements into BDD Given-When-Then scenarios using Gherkin syntax in `.feature` format. "
            "Ensure each scenario includes Feature, Scenario, Given, When, Then, and optionally And/But statements. "
            "Output should be in plain Gherkin syntax, formatted as `.feature` content but without the `feature` keyword or any other headers, and contain only the BDD scenarios without any additional explanatory text or sentences."},
            {"role": "user", "content": prompt}
            ],
        temperature=0.6,
        max_tokens=2000,
    )

        gherkin_scenarios = response.choices[0].message.content.strip()
        return gherkin_scenarios

    except Exception as ex:
        print(f"Error in converting text to Gherkin: {ex}")
        return None

def modify_gherkin_scenario(scenarios, edit_instructions):
    try:
        prompt = (
            f"Modify the following Gherkin scenarios:\n{scenarios}\n"
        f"Based on these instructions:\n{edit_instructions}\n"
        "After modifying, removing, or keeping scenarios, number each scenario. "
        "Ensure that the output contains only the modified scenarios in Gherkin syntax without any additional comments or explanations."
        )

        response = client.chat.completions.create(
            model=deployment,
            messages=[
                {"role": "system", "content": "You are an AI assistant specialized in editing BDD scenarios. "
                    "Your task is to modify the provided Gherkin scenarios based on the given instructions. "
                    "Ensure that each scenario is numbered and that the output includes only the modified scenarios in Gherkin syntax. "
                    "Do not include any additional comments, explanations, or headers."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.6,
            max_tokens=2000,
        )

        modified_scenarios = response.choices[0].message.content.strip()
        return modified_scenarios

    except Exception as ex:
        print(f"Error in modifying scenarios: {ex}")
        return None
    
def code_generation_assistant(tech_stack, scenarios):
    try:
        prompt = (
            "You are an expert in generating code based on Gherkin scenarios. Your task is to generate code that implements "
            "the functionality described in the following Gherkin scenarios. The generated code should be compatible with the provided technology stack."
            "Please ensure that the generated code is complete and is ready to be integrated into a project.\n\n"
            "Here are the Gherkin scenarios:\n"
            f"{scenarios}\n\n"
            "Technology stack:\n"
            f"{tech_stack}\n\n"
            "Please generate the code based on the above scenarios and technology stack."
        )

        response = client.chat.completions.create(
            model=deployment,
            messages=[
                {"role": "system", "content": "You are an AI assistant specialized in code generation from Gherkin scenarios. "
                                              "Your task is to generate code based on the provided Gherkin scenarios and technology "
                                              "stack. Ensure that the code is structured well and is compatible "
                                              "with the specified technology stack."},
                {"role": "user", "content": prompt}
            ],
            temperature=0.6,
            max_tokens=4096,
        )

        project_code = response.choices[0].message.content.strip()
        return project_code


    except Exception as ex:
        print(f"Error in generating code: {ex}")
        return None
