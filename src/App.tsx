// App.tsx
import React from 'react';
import './App.css'; 
import { LeftComponent } from './components/LeftComponent';
import { MiddleComponent } from './components/MiddleComponent';
import { RightComponent } from './components/RightComponent';

const App: React.FC = () => {
  return (
    <div>
      <header>
        <h1>Interactive Jacket Customizer - text in app.tsx</h1>
      </header>
      <main>
        <div style={{ display: 'flex' }}>
          <div><LeftComponent /></div>
          <div><MiddleComponent /></div>
          <div><RightComponent /></div>
        </div>
      </main>
      <footer>
        <p>© 2025 Case Western Reserve University, SaPHaRI Lab(text in App.tsx)</p>
      </footer>
    </div>
  );
};

export default App;