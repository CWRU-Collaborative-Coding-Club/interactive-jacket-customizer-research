// App.tsx
import React from 'react';
import { LeftSidebar } from './components/LeftComponent';
import { JacketCanvas } from './components/MiddleComponent';
import { CustomizationPanel } from './components/RightComponent';

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