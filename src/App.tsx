// App.tsx
import React from 'react';
import { LeftSidebar } from './components/LeftSidebar';
import { JacketCanvas } from './components/JacketCanvas';
import { CustomizationPanel } from './components/CustomizationPanel';

const App: React.FC = () => {
  return (
    <div>
      <header>
        <h1>Interactive Jacket Customizer</h1>
      </header>
      <main>
        <div style={{ display: 'flex' }}>
          <div><LeftSidebar /></div>
          <div><JacketCanvas /></div>
          <div><CustomizationPanel /></div>
        </div>
      </main>
      <footer>
        <p>© 2025 Case Western Reserve University, SaPHaRI Lab(text in App.tsx)</p>
      </footer>
    </div>
  );
};

export default App;