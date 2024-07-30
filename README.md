### AI-Enhanced Behavior Driven Development (BDD) Environment

**When** everyone in a team, regardless of technical skill, needs to contribute to software development through Behavior Driven Development (BDD).

**We want to** create an AI-enhanced environment that converts user-story into Gherkin scenarios, finds similar scenarios and generates code implementations for them.

**So that** all team members can actively participate in the development process, reducing the complexity of writing scenarios and code, and ensuring the software meets business requirements.

## Features

1. **Generate Gherkin Scenarios:**

   - Users start by selecting their project and entering a user story.
   - The AI converts the user story into Gherkin scenarios.
   - Users can modify these scenarios as needed and search for similar scenarios from the Quadrant vector database for inspiration.
   - Once satisfied, users save the scenarios in the `.feature` file within the project folder.

2. **Generate Code:**

   - After saving scenarios, users can request code generation for those scenarios.
   - Generated code is organized into backend and frontend files within a new project folder.
   - Users can also generate code later from existing scenarios without immediate generation.

3. **Streamlit UI:**

   - A Streamlit-based demo UI showcases the basic functionalities.
   - Users can download their project files after the code is generated.

   - **Note:** The flow in the Streamlit demo UI differs slightly from the standard application flow. The demo is designed to showcase basic functionalities and allows users to download project files after code generation
