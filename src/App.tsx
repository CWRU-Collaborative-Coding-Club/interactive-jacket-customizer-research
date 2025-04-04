// src/App.tsx
import React from 'react';
import './App.css';

function App() {
  return (
    <AppLayout>
      <ThreeColumnLayout
        leftSidebar={<LeftSidebar />}
        mainContent={<JacketCanvas />}
        rightSidebar={<CustomizationPanel />}
      />
    </AppLayout>
  );
}

export default App;