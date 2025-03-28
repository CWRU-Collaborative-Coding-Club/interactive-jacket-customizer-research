#!/bin/bash

# Interactive Jacket Customizer Research - Environment Setup Script
# This script sets up the Docker development environment for the project

echo "======================================================"
echo "Setting up Docker environment for Jacket Customizer..."
echo "======================================================"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "ERROR: Docker is not installed."
    echo "Please install Docker first: https://www.docker.com/products/docker-desktop/"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "ERROR: Docker Compose is not installed."
    echo "Docker Compose is typically installed with Docker Desktop."
    exit 1
fi

# Create Dockerfile if it doesn't exist
if [ ! -f "Dockerfile" ]; then
    echo "Creating Dockerfile..."
    cat > Dockerfile << 'EOF'
# Base image with Node.js
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install global packages
RUN npm install -g serve

# Copy package files
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port for development server
EXPOSE 3000

# Start development server
CMD ["npm", "start"]
EOF
    echo "✓ Dockerfile created."
fi

# Create docker-compose.yml if it doesn't exist
if [ ! -f "docker-compose.yml" ]; then
    echo "Creating docker-compose.yml..."
    cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  # Frontend React application
  frontend:
    build: .
    container_name: jacket-customizer-frontend
    ports:
      - "3000:3000"
    volumes:
      - ./:/app
      - /app/node_modules
    environment:
      - CHOKIDAR_USEPOLLING=true
      - NODE_ENV=development
    stdin_open: true
    tty: true

  # Optional Flask backend service
  backend:
    image: python:3.12-slim
    container_name: jacket-customizer-backend
    working_dir: /app
    command: >
      bash -c "pip install -r requirements.txt &&
              python app.py"
    ports:
      - "5001:5001"
    volumes:
      - ./server:/app
    environment:
      - FLASK_APP=app.py
      - FLASK_ENV=development
EOF
    echo "✓ docker-compose.yml created."
fi

# Create .dockerignore if it doesn't exist
if [ ! -f ".dockerignore" ]; then
    echo "Creating .dockerignore..."
    cat > .dockerignore << 'EOF'
node_modules
npm-debug.log
build
.git
.github
.gitignore
README.md
LICENSE
PROJECTOVERVIEW.md
DEVLOG.md
/plans_for_each_week
EOF
    echo "✓ .dockerignore created."
fi

# Create server directory and Flask app if it doesn't exist
if [ ! -d "server" ]; then
    echo "Creating server directory and Flask app..."
    mkdir -p server
    
    # Create requirements.txt
    cat > server/requirements.txt << 'EOF'
Flask==2.3.3
Flask-CORS==4.0.0
python-dotenv==1.0.0
EOF

    # Create a basic Flask app
    cat > server/app.py << 'EOF'
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({"status": "healthy"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
EOF
    echo "✓ Server files created."
fi

# Create a .env file for environment variables if it doesn't exist
if [ ! -f ".env" ]; then
    echo "Creating .env file..."
    cat > .env << 'EOF'
# React development settings
REACT_APP_API_URL=http://localhost:5001
# Add other environment variables as needed
EOF
    echo "✓ .env file created."
fi

# Check if package.json exists, create a basic one if not
if [ ! -f "package.json" ]; then
    echo "Creating a basic package.json file..."
    cat > package.json << 'EOF'
{
  "name": "interactive-jacket-customizer",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "@dnd-kit/core": "^6.1.0",
    "@dnd-kit/sortable": "^7.0.2",
    "@react-spectrum/color": "^3.0.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "zustand": "^4.4.7"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
EOF
    echo "✓ Basic package.json created."
fi

echo "Starting Docker containers..."
docker-compose up -d

echo "======================================================"
echo "Environment setup complete!"
echo "✓ Frontend: http://localhost:3000"
echo "✓ Backend API: http://localhost:5001/api/health"
echo "======================================================"
echo "Use these commands to manage the environment:"
echo "  - Start:   docker-compose up"
echo "  - Stop:    docker-compose down"
echo "  - Rebuild: docker-compose up --build"
echo "  - Logs:    docker-compose logs -f"
echo "======================================================"