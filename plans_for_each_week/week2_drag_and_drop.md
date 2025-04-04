# Week 2: Core Drag-and-Drop Functionality

This document outlines the implementation plan for Week 2 of the Interactive Jacket Customizer Research project. This week focuses on implementing the core drag-and-drop functionality that will allow users to place and manipulate items on the jacket.

## Learning Objectives

By the end of this week, you should be able to:
- Implement drag-and-drop functionality using dnd-kit
- Create draggable item components
- Set up drop targets for item placement
- Handle item positioning and selection
- Update state based on user interactions

## Tasks Breakdown

### Days 1-3: Item Components & Drag Sources

#### 1. Create Draggable Item Components

**Tasks:**
- [ ] Create DraggableItem component using dnd-kit
- [ ] Implement different item types (lights, text, decorations)
- [ ] Create visual styles for draggable items
- [ ] Add drag preview functionality
- [ ] Implement drag sensors for mouse and touch

**Resources:**
- [dnd-kit Draggable](https://docs.dndkit.com/api-documentation/draggable)
- [dnd-kit Drag Overlay](https://docs.dndkit.com/api-documentation/draggable/drag-overlay)

**Expected Output:**
- Draggable items that can be picked up
- Visual feedback during drag operations
- Different item types with distinct appearances

#### 2. Set Up Item Sidebar

**Tasks:**
- [ ] Complete LeftSidebar component implementation
- [ ] Organize items by category
- [ ] Create item preview thumbnails
- [ ] Add tooltips for item descriptions
- [ ] Implement scrolling for many items

**Expected Output:**
- Organized sidebar with categorized items
- Visual representation of all available items
- Smooth dragging from sidebar to canvas

#### 3. Implement Drag Context Providers

**Tasks:**
- [ ] Set up DndContext from dnd-kit
- [ ] Configure drag sensors
- [ ] Implement custom drag preview
- [ ] Add accessibility features
- [ ] Handle drag start and end events

**Resources:**
- [dnd-kit Context Provider](https://docs.dndkit.com/api-documentation/context-provider)
- [dnd-kit Accessibility](https://docs.dndkit.com/accessibility)

**Expected Output:**
- Working drag context throughout the application
- Proper event handling for drag operations
- Accessible drag-and-drop implementation

### Days 3-5: Drop Target & Item Placement

#### 1. Create Drop Target on Jacket Canvas

**Tasks:**
- [ ] Set up DroppableArea component
- [ ] Configure drop zones on jacket
- [ ] Implement drop validation
- [ ] Create visual indicators for valid drop areas
- [ ] Handle positioning calculation

**Resources:**
- [dnd-kit Droppable](https://docs.dndkit.com/api-documentation/droppable)

**Expected Output:**
- Jacket canvas that accepts dropped items
- Visual feedback for valid drop zones
- Proper positioning of dropped items

#### 2. Implement Item State Management

**Tasks:**
- [ ] Expand Zustand store for placed items
- [ ] Create actions for adding, moving, and removing items
- [ ] Implement position calculation
- [ ] Handle item selection
- [ ] Persist items between front/back views

**Expected Output:**
- State management for all placed items
- Proper positioning data in the store
- Selection mechanism for items

#### 3. Add Item Selection and Deletion

**Tasks:**
- [ ] Implement click handling for item selection
- [ ] Create visual indicator for selected items
- [ ] Add delete functionality with keyboard and button
- [ ] Implement drag-to-move for placed items
- [ ] Handle multi-item operations (future feature)

**Expected Output:**
- Ability to select items by clicking
- Visual feedback for selected items
- Working delete functionality
- Ability to move placed items

## Checkpoints and Milestones

### Checkpoint 1 (End of Day 2)
- Draggable items that can be picked up
- Organized sidebar with items
- Drag context set up throughout the application

### Checkpoint 2 (End of Day 4)
- Drop target working on jacket canvas
- Items can be placed on the jacket
- Basic selection mechanism

### Final Milestone (End of Week 2)
- Complete drag-and-drop functionality
- Item placement with proper positioning
- Selection and deletion of items
- Items persisted in state between view changes

## Common Issues and Solutions

### dnd-kit Integration
- **Issue:** Multiple drag contexts causing conflicts
- **Solution:** Ensure proper nesting of DndContext providers

### Position Calculation
- **Issue:** Items not positioning correctly on drop
- **Solution:** Implement proper coordinate translation from drop event

### State Management
- **Issue:** Items not persisting between state updates
- **Solution:** Ensure immutable state updates in Zustand store

## Evaluation Criteria

Your implementation will be evaluated based on:

1. **Functionality:** Does the drag-and-drop system work as expected?
2. **User Experience:** Is the interaction smooth and intuitive?
3. **Code Quality:** Is the drag-and-drop implementation clean and maintainable?
4. **Technical Implementation:** Are you using dnd-kit features effectively?

## Team Collaboration Tips

1. **Pair Programming:** Work in pairs for complex drag-and-drop logic
2. **Regular Testing:** Test on different devices and browsers
3. **Documentation:** Document the drag-and-drop system architecture
4. **Performance:** Monitor performance during drag operations

## Next Week Preview

In Week 3, we'll focus on implementing the customization panel, allowing users to modify properties of placed items, and adding undo/redo functionality.
