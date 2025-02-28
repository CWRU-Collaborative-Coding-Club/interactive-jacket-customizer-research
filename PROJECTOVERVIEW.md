# Interactive Jacket Customization Platform Plan

## Project Overview
The Interactive Jacket Customization Platform enables users to express emotions through digital wearable design via a drag-and-drop interface. Users can place components on a virtual jacket and customize their properties including colors, animations, and text. The application captures comprehensive interaction data for research purposes while providing a smooth user experience with undo/redo functionality and multi-user support. Designed for implementation by entry-level college programmers within 1.5 months.

## Project Goals
1. Create an intuitive drag-and-drop interface for customizing a digital jacket
2. Implement robust customization tools for item properties
3. Develop comprehensive interaction tracking for research analysis
4. Build a secure local data storage solution
5. Provide undo/redo functionality for design iterations
6. Enable multi-user management for research participants
7. Ensure the platform works both online and offline
8. Create portfolio-worthy demonstration materials

## Updated Technology Choices

| Feature | Previous Choice | Updated Choice | Rationale |
|---------|----------------|---------------|-----------|
| Drag & Drop | React DnD | dnd-kit | Simpler API, better for beginners, more active maintenance |
| Color Picker | react-color | @react-spectrum/color | More modern, better maintained |
| State Management | React Context | Zustand | Simpler state updates, better for complex state |
| Local Storage | localStorage | IndexedDB | Better for structured data, higher storage limits |
| Backend | Flask | Flask (unchanged) | Still appropriate for small-scale API needs |

## Key Deliverables
1. **Functional Application**
   - Interactive drag-and-drop jacket customization interface
   - Comprehensive item customization controls
   - Front/back toggle view with persistent item placement
   - Working undo/redo functionality
   - Multi-user session management

2. **Data Collection System**
   - Complete interaction tracking (timing, placement, customization)
   - JSON-based data storage with export functionality
   - Flask backend with basic security measures
   - Secure participant identification system

3. **Documentation & Portfolio Materials**
   - Technical documentation for future maintenance
   - Usage guide for researchers
   - Demo mode with sample designs
   - Portfolio case study materials

## Revised Implementation Plan (6 Weeks)

### Week 1: Project Setup & Basic Interface
#### Days 1-2: Environment Setup
- [ ] Create React project structure
- [ ] Set up GitHub repository with branching strategy
- [ ] Install core dependencies (dnd-kit, @react-spectrum/color, Zustand)
- [ ] Set up basic Flask server environment

#### Days 3-5: Basic Application Shell
- [ ] Implement layout with sidebars and central canvas
- [ ] Create static jacket visualization (front/back)
- [ ] Set up Zustand store for state management
- [ ] Create view toggle functionality

**Weekly Milestone**: Working application shell with navigation

### Week 2: Core Drag-and-Drop Functionality
#### Days 1-3: Item Components & Drag Sources
- [ ] Create draggable item components using dnd-kit
- [ ] Design visual representations for all item types
- [ ] Implement drag sensors and preview
- [ ] Create droppable areas on jacket canvas

#### Days 3-5: Drop Target & Item Placement
- [ ] Implement drop handling with position calculation
- [ ] Set up Zustand state for placed items
- [ ] Build item selection mechanism
- [ ] Add delete functionality for placed items

**Weekly Milestone**: Working drag-and-drop with item placement

### Week 3: Customization Panel & Zustand State
#### Days 1-3: Customization Controls
- [ ] Create right sidebar customization panel
- [ ] Implement color picker with @react-spectrum/color
- [ ] Build animation speed and pattern controls
- [ ] Add text input for customizable text elements

#### Days 3-5: State Management & Undo/Redo
- [ ] Implement Zustand store with history tracking
- [ ] Create state slices for different features
- [ ] Build undo/redo functionality
- [ ] Test state updates and history navigation
- [ ] **Buffer Day**: Extra time for debugging state management

**Weekly Milestone**: Working customization controls and undo/redo

### Week 4: Data Storage & User Management
#### Days 1-3: IndexedDB Implementation
- [ ] Set up IndexedDB for local storage
- [ ] Create data models for designs and interactions
- [ ] Implement auto-save functionality
- [ ] Build data export capabilities

#### Days 3-5: Multi-User System
- [ ] Create user identification and switching interface
- [ ] Implement data segregation by user
- [ ] Build session management utilities
- [ ] Test multi-user scenarios

**Weekly Milestone**: Working data system with multi-user support

### Week 5: Interaction Tracking & Backend Security
#### Days 1-3: Interaction Tracking
- [ ] Implement event tracking system using Zustand
- [ ] Create throttled mouse movement tracking
- [ ] Add customization action recording
- [ ] Build timing and sequence capturing

#### Days 3-5: Flask Backend & Security
- [ ] Set up Flask application with proper structure
- [ ] Implement file-based JSON storage
- [ ] Add input validation for all API endpoints
- [ ] Implement basic request authentication
- [ ] **Buffer Day**: Extra time for security testing

**Weekly Milestone**: Complete tracking system with secure backend

### Week 6: Refinement & Portfolio Elements
#### Days 1-2: Application Polishing
- [ ] Fix any remaining bugs in core functionality
- [ ] Optimize performance for multiple animations
- [ ] Ensure consistent behavior across browsers
- [ ] Add final visual polish

#### Days 3-4: Portfolio Features
- [ ] Create demo mode with sample designs
- [ ] Build simple showcase gallery
- [ ] Implement guided tour functionality
- [ ] Add explanatory overlays for portfolio viewers

#### Day 5: Documentation & Finalization
- [ ] Complete technical documentation
- [ ] Create researcher usage guide
- [ ] Prepare portfolio case study materials
- [ ] Final testing and project submission

**Final Deliverable**: Complete application with documentation and portfolio materials

## Technical Implementation Details

### Zustand Store Structure
```javascript
// store.js
import create from 'zustand';
import { v4 as uuidv4 } from 'uuid';

const useStore = create((set, get) => ({
  // Items placed on jacket
  items: {},
  
  // Currently selected item
  selectedItemId: null,
  
  // Current view (front/back)
  currentView: 'front',
  
  // History for undo/redo
  history: {
    past: [],
    present: null,
    future: []
  },
  
  // User management
  currentUser: null,
  users: {},
  
  // Actions
  addItem: (type, position) => {
    const id = uuidv4();
    set(state => {
      // Store current state in history
      const newHistory = {
        past: [...state.history.past, { ...state.items }],
        present: { ...state.items },
        future: []
      };
      
      // Add new item
      return {
        items: {
          ...state.items,
          [id]: {
            id,
            type,
            position,
            properties: {
              color: '#FFFFFF',
              speed: 5,
              pattern: 'solid',
              text: ''
            }
          }
        },
        history: newHistory
      };
    });
    return id;
  },
  
  // Other actions: updateItem, removeItem, selectItem, etc.
  
  // Undo/Redo
  undo: () => set(state => {
    if (state.history.past.length === 0) return state;
    
    const previous = state.history.past[state.history.past.length - 1];
    const newPast = state.history.past.slice(0, -1);
    
    return {
      items: previous,
      history: {
        past: newPast,
        present: previous,
        future: [state.items, ...state.history.future]
      }
    };
  }),
  
  redo: () => set(state => {
    if (state.history.future.length === 0) return state;
    
    const next = state.history.future[0];
    const newFuture = state.history.future.slice(1);
    
    return {
      items: next,
      history: {
        past: [...state.history.past, state.items],
        present: next,
        future: newFuture
      }
    };
  })
}));
```

### IndexedDB Structure
```javascript
// db.js
const DB_NAME = 'jacket_customizer';
const DB_VERSION = 1;

export const initDB = () => {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open(DB_NAME, DB_VERSION);
    
    request.onupgradeneeded = (event) => {
      const db = event.target.result;
      
      // Store for designs
      if (!db.objectStoreNames.contains('designs')) {
        const designStore = db.createObjectStore('designs', { keyPath: 'id' });
        designStore.createIndex('userId', 'userId', { unique: false });
      }
      
      // Store for interactions
      if (!db.objectStoreNames.contains('interactions')) {
        const interactionStore = db.createObjectStore('interactions', { keyPath: 'id' });
        interactionStore.createIndex('sessionId', 'sessionId', { unique: false });
      }
      
      // Store for users
      if (!db.objectStoreNames.contains('users')) {
        db.createObjectStore('users', { keyPath: 'id' });
      }
    };
    
    request.onsuccess = (event) => resolve(event.target.result);
    request.onerror = (event) => reject('Error opening database');
  });
};

// Functions for saving/loading data from IndexedDB
```

### Flask Security Improvements
```python
# app.py
from flask import Flask, request, jsonify, abort
from flask_cors import CORS
import json
import os
import time
import hashlib
import secrets

app = Flask(__name__)
CORS(app)

# Simple API key validation
API_KEYS = {'research_app': 'your-secret-key-here'}

def validate_api_key():
    api_key = request.headers.get('X-API-Key')
    if not api_key or api_key not in API_KEYS.values():
        abort(401)  # Unauthorized

@app.route('/api/save', methods=['POST'])
def save_session():
    validate_api_key()
    
    try:
        # Input validation
        if not request.is_json:
            return jsonify({'error': 'Invalid content type'}), 400
            
        data = request.json
        required_fields = ['sessionId', 'userId', 'items']
        
        for field in required_fields:
            if field not in data:
                return jsonify({'error': f'Missing required field: {field}'}), 400
        
        # Generate filename with timestamp and hash
        timestamp = int(time.time())
        filename = f"{timestamp}_{data['userId']}_{hashlib.md5(data['sessionId'].encode()).hexdigest()[:8]}.json"
        
        # Save to file
        with open(os.path.join('research_data', filename), 'w') as f:
            json.dump(data, f, indent=2)
        
        return jsonify({'success': True, 'filename': filename})
    except Exception as e:
        return jsonify({'error': str(e)}), 500
```

## Implementation Approach for Entry-Level Programmers

1. **Library Documentation Sessions**
   - Dedicate time to review dnd-kit and Zustand documentation
   - Create simple examples before integration
   - Provide starter code with comments for complex parts

2. **Progressive Complexity**
   - Start with simple state management
   - Add undo/redo after basic functionality works
   - Introduce IndexedDB once core features are stable

3. **Pair Programming**
   - Implement challenging features in pairs
   - Organize regular code reviews
   - Share knowledge across the team

4. **Testing Strategy**
   - Create test scenarios for each feature
   - Implement automated tests for critical functions
   - Regular user testing sessions

# Feature Classification

## Must-Have Features

1. **Drag-and-Drop Interface**
   - Ability to drag items from sidebar onto jacket canvas
   - Accurate placement of items on both front and back views
   - Item selection and deletion

2. **Item Customization**
   - Color picker for changing item colors
   - Animation speed control for light components
   - Pattern selection for different flashing patterns
   - Text input for customizable text elements

3. **Jacket Visualization**
   - Front/back toggle view
   - Clear visual representation of the jacket
   - Visual feedback for selected items

4. **Basic Data Collection**
   - Record of all placed items and their properties
   - Timestamps for when items were added/modified
   - Session information (user ID, video watched)
   - JSON data export functionality

5. **Local Storage**
   - Browser-based storage to prevent data loss
   - Ability to download design data as JSON
   - Basic server storage for research collection

6. **Undo/Redo Functionality**
   - History stack for design changes
   - Multiple undo/redo steps
   - Intuitive controls for navigating design history

7. **Multi-User Management**
   - Unique IDs for different research participants
   - Session management and resumption
   - Basic participant tracking

8. **Enhanced Portfolio Elements**
   - Demo mode with sample designs
   - Simple case study documentation
   - Screenshots and usage examples

## Nice-to-Have Features

1. **Advanced Interaction Tracking**
   - Mouse movement heatmaps
   - Detailed keystroke logging
   - Time spent on each customization type
   - Hesitation patterns and decision analysis

2. **Item Scaling & Rotation**
   - Ability to resize items 
   - Rotation controls for placed items
   - Proportional scaling with constraints

3. **Enhanced Animation Preview**
   - Real-time preview of all animations
   - Multiple animation patterns
   - Custom animation creation

4. **Researcher Dashboard**
   - Simple analytics of collected data
   - Visualization of common placement patterns
   - Aggregated statistics across sessions

5. **Responsive Design**
   - Mobile/tablet compatibility
   - Adaptive layout for different screen sizes
   - Touch interface optimization

6. **Performance Optimizations**
   - Throttled event handlers
   - Efficient rendering of multiple animations
   - Optimized data storage
