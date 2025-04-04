# Contributing to the Interactive Jacket Customizer Research Project

This document provides guidelines and instructions for contributing to the Interactive Jacket Customizer Research project. Please follow these guidelines to maintain consistency and quality throughout the codebase.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Development Workflow](#development-workflow)
3. [Code Style Guidelines](#code-style-guidelines)
4. [Commit Message Conventions](#commit-message-conventions)
5. [Pull Request Process](#pull-request-process)
6. [Development Tasks](#development-tasks)
7. [Team Organization](#team-organization)

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/CWRU-Collaborative-Coding-Club/interactive-jacket-customizer-research.git
   cd interactive-jacket-customizer-research
   ```

2. **Set up the development environment**
   ```bash
   # Run the setup script
   ./setup.sh
   ```

3. **Create a new branch for your work**
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Workflow

We follow a simplified Git Flow workflow:

- `main` - Production-ready code
- `develop` - Integration branch for new features
- `feature/*` - Feature branches for new development
- `bugfix/*` - Bug fix branches
- `docs/*` - Documentation updates

### Basic Workflow

1. Create a new branch from `develop` for your feature or bugfix
2. Make your changes and commit them
3. Push your branch to GitHub
4. Create a pull request to merge your branch into `develop`
5. After review, your code will be merged
6. Periodically, `develop` will be merged into `main` for releases

## Code Style Guidelines

### TypeScript/React

- Use functional components with hooks
- Use TypeScript interfaces for props and state
- Follow the ESLint and Prettier configurations
- Document complex functions and components
- Use meaningful variable and function names
- Group related functions and constants

### SCSS/CSS

- Use BEM (Block Element Modifier) naming convention
- Use variables for colors, spacing, and other repeated values
- Organize styles by component
- Use nesting sparingly to avoid specificity issues

### Python/Flask

- Follow PEP 8 style guide
- Use meaningful function and variable names
- Document functions with docstrings
- Handle errors gracefully
- Log meaningful information

## Commit Message Conventions

```
<type>(<scope>): <subject>

<body>
```

### Types
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (formatting, etc.)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools

### Examples
```
feat(canvas): add item selection functionality

Implement the ability to select items on the jacket canvas by clicking.
This change adds a visual indicator and updates the store on selection.
```

```
fix(customization): correct color picker not updating

Fix bug where changing colors in the color picker did not update 
the selected item's color property in the store.
```

## Pull Request Process

1. **Update your branch** with the latest changes from `develop`:
   ```bash
   git checkout develop
   git pull
   git checkout your-feature-branch
   git rebase develop
   ```

2. **Create a pull request** through the GitHub interface
   - Use a clear and descriptive title
   - Provide a detailed description of the changes
   - Reference any related issues using the GitHub issue number (#123)

3. **Code review**
   - At least one team member must review and approve your PR
   - Address any feedback from reviewers
   - Make additional commits to address feedback

4. **Merge**
   - Once approved, your code will be merged into `develop`
   - Delete your feature branch after merging

## Development Tasks

The project is divided into several key areas, each with specific tasks:

### Frontend Structure
- Layout components and styling
- Responsive design implementation
- Component architecture

### Drag and Drop System
- Implement draggable items
- Set up drop zones on the jacket canvas
- Handle item positioning and selection

### State Management
- Configure Zustand stores
- Implement undo/redo functionality
- Set up data persistence

### Backend API
- Develop Flask API endpoints
- Implement data storage and retrieval
- Set up authentication and security

### Testing and Quality Assurance
- Write unit tests for critical components
- Implement integration tests
- Conduct usability testing

## Team Organization

The project is organized into teams, each responsible for specific areas:

### Team 1: UI/UX and Components
- Layout structure
- Component design
- Visual feedback and user interaction
- Accessibility

### Team 2: State Management and Data
- Zustand store implementation
- Data persistence with IndexedDB
- History tracking
- User session management

### Team 3: Backend and APIs
- Flask server implementation
- API endpoint development
- Data export and security
- Server integration

### Team 4: Testing and Documentation
- Unit and integration testing
- Documentation
- User guides
- Research data collection

## Communication

- Use GitHub Issues for bug reports and feature requests
- Use GitHub Discussions for design decisions and technical questions
- Schedule regular team meetings for progress updates
- Document important decisions in the project wiki

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

## Research Considerations

As this is a research project, keep in mind:
- All code should support the research goals outlined in the project documentation
- Interaction tracking should be comprehensive but unobtrusive
- Data privacy and security must be maintained
- Document any design decisions that could impact research outcomes
- Consider the user experience while collecting research data

## Questions and Support

If you have questions about contributing to the project:
1. Check the existing documentation
2. Look for related issues on GitHub
3. Ask in the GitHub Discussions
4. Contact the project maintainers

Thank you for contributing to the Interactive Jacket Customizer Research project!
