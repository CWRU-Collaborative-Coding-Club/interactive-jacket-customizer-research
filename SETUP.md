# Environment Setup Guide for Students

This guide will help you complete the Week 1 environment setup tasks for the Interactive Jacket Customizer Research project. The project structure has been initialized, but there are several tasks that need to be completed to have a fully functional development environment.

## Task 1: Environment Setup

### 1. Clone the Repository

```bash
git clone https://github.com/CWRU-Collaborative-Coding-Club/interactive-jacket-customizer-research.git
cd interactive-jacket-customizer-research
```

### 2. Install Dependencies

The project already has package.json with the main dependencies. Install them by running:

```bash
npm install
```

### 3. Verify the Project Structure

Ensure that your project has the following structure:

```
interactive-jacket-customizer-research/
├── public/
│   ├── assets/
│   │   └── images/
│   ├── index.html
│   └── manifest.json
├── src/
│   ├── components/
│   │   ├── Canvas/
│   │   ├── Controls/
│   │   ├── Items/
│   │   └── Layout/
│   ├── store/
│   ├── utils/
│   ├── App.tsx
│   └── index.tsx
├── server/
│   ├── app.py
│   └── requirements.txt
├── README.md
└── SETUP.md (this file)
```

## Task 2: Add Jacket Images

1. Create two jacket images (front and back views) and save them in the `/public/assets/images/` directory:
   - `jacket-front.png`
   - `jacket-back.png`

You can either design your own jacket images or use placeholder images for now.

## Task 3: Set Up the GitHub Repository

1. Initialize Git (if not already done):
   ```bash
   git init
   ```

2. Add all files to Git:
   ```bash
   git add .
   ```

3. Commit your changes:
   ```bash
   git commit -m "Initial project setup"
   ```

4. Create a GitHub repository for your project.

5. Add the remote repository:
   ```bash
   git remote add origin YOUR_GITHUB_REPO_URL
   ```

6. Push your code to GitHub:
   ```bash
   git push -u origin main
   ```

7. Create the following branches for your development workflow:
   ```bash
   git checkout -b develop
   git push -u origin develop
   ```

## Task 4: Set Up the Flask Server

1. Create a Python virtual environment:
   ```bash
   python -m venv venv
   ```

2. Activate the virtual environment:
   - Windows: `venv\Scripts\activate`
   - macOS/Linux: `source venv/bin/activate`

3. Install Flask dependencies:
   ```bash
   cd server
   pip install -r requirements.txt
   ```

4. Test the Flask server:
   ```bash
   python app.py
   ```

5. Verify that you can access `http://localhost:5001/api/health` and receive a "healthy" response.

## Task 5: Start the React Development Server

1. Run the React development server:
   ```bash
   npm start
   ```

2. Open your browser to `http://localhost:3000` to see the application.

## Task 6: Complete the Basic Interface

Now that the environment is set up, you should implement the basic interface:

1. Add styling to the SCSS files that have been created
2. Implement the placeholder components
3. Create the drag-and-drop functionality

## Learning Resources

### React and TypeScript
- [React Documentation](https://reactjs.org/docs)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)
- [React TypeScript Cheatsheet](https://github.com/typescript-cheatsheets/react)

### dnd-kit (Drag and Drop)
- [dnd-kit Documentation](https://docs.dndkit.com/)
- [dnd-kit Examples](https://docs.dndkit.com/introduction/examples)

### Zustand (State Management)
- [Zustand Documentation](https://github.com/pmndrs/zustand)
- [Zustand Tutorial](https://docs.pmnd.rs/zustand/getting-started/introduction)

### Flask (Backend)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Flask-CORS Documentation](https://flask-cors.readthedocs.io/)

## Team Organization Suggestions

Consider dividing your team into the following groups:

1. **Frontend Structure Team**
   - Focus on layout components and styling
   - Implement responsive design

2. **Drag and Drop Team**
   - Implement draggable items
   - Create drop targets on the jacket canvas

3. **State Management Team**
   - Set up Zustand store
   - Implement state updates

4. **Backend Team**
   - Expand Flask API endpoints
   - Implement data storage

Each team should document their work and contribute to the overall project documentation.

## Submission

When you've completed the environment setup tasks, create a pull request from your `develop` branch to the `main` branch with all your changes. Include screenshots of your working application in the pull request description.