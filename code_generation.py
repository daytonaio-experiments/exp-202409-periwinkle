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

def save_code_to_files(project_name, feature_name, code):
    feature_folder = f'Projects/{project_name}/code_{feature_name}'
    os.makedirs(feature_folder, exist_ok=True)
    
    backend_code = re.findall(r'### Backend \(Django\)(.*?)### Frontend', code, re.DOTALL)
    frontend_code = re.findall(r'### Frontend \(React\)(.*)', code, re.DOTALL)
    
    if backend_code:
        backend_parts = re.findall(r'```python(.*?)```', backend_code[0], re.DOTALL)
        for i, part in enumerate(backend_parts, start=1):
            part_filename = f'{feature_folder}/backend_part_{i}.py'
            print(f"Saving backend code part {i} to '{part_filename}'")
            with open(part_filename, 'w') as file:
                file.write(part.strip())
                print(f"Backend code part {i} saved to '{part_filename}'")
    
    if frontend_code:
        frontend_parts = re.findall(r'```javascript(.*?)```', frontend_code[0], re.DOTALL)
        for i, part in enumerate(frontend_parts, start=1):
            part_filename = f'{feature_folder}/frontend_part_{i}.js'
            print(f"Saving frontend code part {i} to '{part_filename}'")
            with open(part_filename, 'w') as file:
                file.write(part.strip())
                print(f"Frontend code part {i} saved to '{part_filename}'")

def main():
    project_name = input("Enter the project name: ")
    feature_filename = input("Enter the Gherkin feature filename (e.g., user_story.feature): ")
    
    gherkin_scenarios = load_gherkin_scenarios(project_name, feature_filename)
    
    if gherkin_scenarios:
        tech_stack = input("Enter tech stack:\n") # Only entered: Technology stack: Backend Language: Python, Backend Framework: Django, Frontend Language: JavaScript, Frontend Framework: React
        
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

if __name__ == "__main__":
    main()
