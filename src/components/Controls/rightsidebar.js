import React from 'react';
import ReactDOM from 'react-dom/client';
import './styles.css';
import './index.css';

function rightsidebar() {
  return (
    <div className="right-sidebar">
      <div className="sidebar-section">
        <h3>No Item Selected</h3>
      </div>
      <div className="sidebar-section">
        <h3>Color</h3>
        <div className="color-options">
          <div className="color-box" style={{backgroundColor: 'red'}}></div>
          <div className="color-box" style={{backgroundColor: 'blue'}}></div>
          <div className="color-box" style={{backgroundColor: 'green'}}></div>
          <div className="color-box" style={{backgroundColor: 'yellow'}}></div>
        </div>
        <h3>Speed</h3>
        <div className="speed-slider">
          <input type="range" min="1" max="5" value="3" class="slider" id="speed-range"/>
          <span id="value" style={{display: 'none'}}/>
        </div>
        <h3>Movement Selections</h3>
        <div className="movement-options">
            <input type="radio" id="radio-button1" name="radio-button" value="radio tbd1"/>
            <label for="radio-button1">radio tbd1</label><br/>
            <input type="radio" id="radio-button2" name="radio-button" value="radio tbd2"/>
            <label for="radio-button2">radio tbd2</label><br/>
            <input type="radio" id="radio-button3" name="radio-button" value="radio tbd3"/>
            <label for="radio-button3">radio tbd3</label><br/>
            <h4>Write my own:</h4>
            <textarea id="custom-input" name="item-movement" rows="2" cols="22"/>
        </div>
      </div>
    </div>
  );
}

export default rightsidebar;
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<rightsidebar />);