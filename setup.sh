#!/bin/bash

# Interactive Jacket Customizer Research Project Setup Script
echo "Setting up the Interactive Jacket Customizer Research project..."

# Create necessary directories
echo "Creating directories..."
mkdir -p public/assets/images
mkdir -p research_data

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install Node.js and npm before continuing."
    exit 1
fi

# Check for Python
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3 before continuing."
    exit 1
fi

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file..."
    cat > .env << EOL
# Environment Variables for Interactive Jacket Customizer

# React App Settings
REACT_APP_API_URL=http://localhost:5001/api

# Flask Settings
FLASK_APP=app.py
FLASK_DEBUG=True
FLASK_PORT=5001
EOL
    echo ".env file created."
fi

# Install frontend dependencies
echo "Installing frontend dependencies..."
npm install

# Set up Python virtual environment
echo "Setting up Python virtual environment..."
python3 -m venv venv

# Activate virtual environment based on OS
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate
else
    source venv/bin/activate
fi

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r server/requirements.txt

echo "Project setup complete!"
echo ""
echo "To start the development environment:"
echo "  1. Start the Flask server: cd server && python app.py"
echo "  2. In a new terminal, start the React app: npm start"
echo ""
echo "Alternatively, use Docker Compose:"
echo "  docker-compose up"
echo ""
echo "For more information, see the README.md and SETUP.md files."