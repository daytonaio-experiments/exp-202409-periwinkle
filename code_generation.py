import os
import re
from azure_openai_conversion import code_generation_assistant

def load_gherkin_scenarios(project_name, feature_filename):
    gherkin_file_path = f'Projects/{project_name}/{feature_filename}'
    
    if os.path.exists(gherkin_file_path):
        with open(gherkin_file_path, 'r') as file:
            return file.read()
    else:
        print(f"Gherkin scenarios file not found: {gherkin_file_path}")
        return None

def save_code_parts(parts, folder_path, extension, code_type):
    os.makedirs(folder_path, exist_ok=True)
    for i, part in enumerate(parts, start=1):
        part_filename = f'{folder_path}/{code_type}_part_{i}.{extension}'
        print(f"Saving {code_type} code part {i} to '{part_filename}'")
        with open(part_filename, 'w') as file:
            file.write(part.strip())
            print(f"{code_type.capitalize()} code part {i} saved to '{part_filename}'")


def save_code_to_files(project_name, feature_name, code):
    feature_folder = f'Projects/{project_name}/code_{feature_name}'
    
    backend_code = re.findall(r'### Backend \(Django\)(.*?)### Frontend', code, re.DOTALL)
    frontend_code = re.findall(r'### Frontend \(React\)(.*)', code, re.DOTALL)
    
    if backend_code:
        backend_parts = re.findall(r'```python(.*?)```', backend_code[0], re.DOTALL)
        save_code_parts(backend_parts, feature_folder, 'py', 'backend')
      
    if frontend_code:
        frontend_parts = re.findall(r'```javascript(.*?)```', frontend_code[0], re.DOTALL)
        save_code_parts(frontend_parts, feature_folder, 'js', 'frontend')

def generate_code(project_name, feature_filename):
    
    gherkin_scenarios = load_gherkin_scenarios(project_name, feature_filename)
    
    if gherkin_scenarios:
        tech_stack = "Backend Language: Python, Backend Framework: Django, Frontend Language: JavaScript, Frontend Framework: React"
        
        try:
            code = code_generation_assistant(tech_stack, gherkin_scenarios)
            
            if code:
                feature_name = os.path.splitext(feature_filename)[0]
                save_code_to_files(project_name, feature_name, code)
            else:
                print("Failed to generate code.")
        except Exception as ex:
            print(f"Error in generating code: {ex}")
    else:
        print("Failed to load Gherkin scenarios.")

