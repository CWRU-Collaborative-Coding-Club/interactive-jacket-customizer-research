# Interactive Jacket Customizer Research

A research platform for studying emotional expression through interactive digital wearable design. Users can customize virtual jackets with draggable components, animations, and visual elements while the application tracks interaction data for research analysis.

## Project Overview

This platform enables users to express emotions through digital wearable design via a drag-and-drop interface. Users can place components on a virtual jacket and customize their properties including colors, animations, and text. The application captures comprehensive interaction data for research purposes while providing a smooth user experience with undo/redo functionality and multi-user support.

## Key Features

- **Interactive Drag-and-Drop**: Intuitive interface for placing components on a digital jacket
- **Comprehensive Customization**: Color, animation, text, and other property controls
- **Front/Back Toggle**: View and customize both sides of the jacket
- **Detailed Interaction Tracking**: Records all user actions for research analysis
- **Local Data Storage**: Secure data management using IndexedDB
- **Undo/Redo Functionality**: Seamless design iteration
- **Multi-User Support**: Manage multiple research participants
- **Works Offline**: Full functionality without internet connection
- **Research Data Export**: Export interaction data in structured format

## Technology Stack

- **Frontend**: React with modern Hooks and functional components
- **Drag & Drop**: dnd-kit library for accessible drag-and-drop functionality
- **State Management**: Zustand for simplified state handling
- **Color Selection**: @react-spectrum/color for color picking
- **Local Storage**: IndexedDB for structured data with higher storage limits
- **Backend**: Flask for lightweight API needs (optional)

## Installation

```bash
# Clone the repository
git clone https://github.com/your-organization/interactive-jacket-customizer-research.git
cd interactive-jacket-customizer-research

# Install dependencies
npm install

# Start development server
npm start
```

## Usage

1. Enter participant information to begin a research session
2. Drag components from the left sidebar onto the jacket
3. Use the right sidebar to customize component properties
4. Toggle between front and back views
5. Modify placement with drag-and-drop
6. Use undo/redo for design iterations
7. Submit design to save research data

## Project Structure

```
interactive-jacket-customizer-research/
├── public/
│   ├── assets/               # Static assets (jacket images, etc.)
│   └── index.html
├── src/
│   ├── components/           # React components
│   │   ├── Canvas/           # Jacket canvas and related components
│   │   ├── Controls/         # UI controls (color picker, sliders, etc.)
│   │   ├── Items/            # Draggable items
│   │   └── Layout/           # App layout components
│   ├── store/                # Zustand store setup
│   │   ├── historyStore.ts   # Undo/redo functionality
│   │   ├── itemsStore.ts     # Item management
│   │   └── userStore.ts      # User/participant data
│   ├── utils/
│   │   ├── database.ts       # IndexedDB setup and operations
│   │   └── tracking.ts       # Interaction tracking utilities
│   └── App.tsx                # Main application component
├── server/                   # Optional Flask server (if needed)
│   ├── app.py
│   └── requirements.txt
└── README.md
```

## Development Roadmap

See the implementation plan in the project documentation for a detailed week-by-week breakdown of development tasks.

## Data Collection

This application collects the following data for research purposes:
- Item placement coordinates and timestamps
- Customization selections
- User interaction patterns
- Design iterations (via undo/redo history)

All data is stored locally and can be exported in JSON format for research analysis.

## Contributing

Please refer to the project documentation for contribution guidelines.

## License

© 2025 Case Western Reserve University, SaPHaRI Lab - All rights reserved.

This project is currently under active research development prior to publication.
Following publication, this project will be released under the MIT License.
