# Docker Environment Setup Guide for Interactive Jacket Customizer

This guide will help you set up a consistent development environment using Docker, ensuring all team members have identical environments regardless of their operating system.

## Prerequisites

Before starting, you need to install:

1. **Docker Desktop**:
   - [Download Docker Desktop](https://www.docker.com/products/docker-desktop/)
   - For Windows users: Make sure you have WSL2 installed
   - For Mac users: Both Intel and Apple Silicon are supported

2. **Git**:
   - [Download Git](https://git-scm.com/downloads)

## Step 1: Clone the Repository

```bash
# Clone the repository
git clone https://github.com/your-organization/interactive-jacket-customizer-research.git

# Navigate to project directory
cd interactive-jacket-customizer-research
```

## Step 2: Create Docker Configuration Files

Create the following files in your project root directory:

### 1. Create Dockerfile

Create a file named `Dockerfile` in the root of your project with the following content:

```dockerfile
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
```

### 2. Create docker-compose.yml

Create a file named `docker-compose.yml` in the root of your project with the following content:

```yaml
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
```

### 3. Create .dockerignore

Create a file named `.dockerignore` to prevent unnecessary files from being copied into your Docker image:

```
node_modules
npm-debug.log
build
.git
.github
.gitignore
README.md
LICENSE
```

## Step 3: Add Server Requirements

For the Flask backend (optional but included in the setup), create a requirements.txt file in the server directory:

```bash
# Create server directory if it doesn't exist
mkdir -p server

# Create requirements.txt file
touch server/requirements.txt
```

Add the following content to the `server/requirements.txt` file:

```
Flask==2.3.3
Flask-CORS==4.0.0
python-dotenv==1.0.0
```

## Step 4: Create a Basic Flask App

Create a basic Flask app file to ensure the backend works properly:

```bash
# Create a basic Flask app file
touch server/app.py
```

Add the following content to the `server/app.py` file:

```python
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({"status": "healthy"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
```

## Step 5: Start the Docker Environment

Start the Docker containers using docker-compose:

```bash
# Start all services defined in docker-compose.yml
docker-compose up
```

This command will:
1. Build the Docker images (if not already built)
2. Create and start the containers
3. Display logs from both services

If you want to run the containers in the background:

```bash
docker-compose up -d
```

## Step 6: Access the Application

- **Frontend**: Open your browser and navigate to http://localhost:3000
- **Backend API**: Accessible at http://localhost:5001/api/health

## Step 7: Common Docker Commands

Here are some useful Docker commands for your daily development workflow:

```bash
# Stop the containers
docker-compose down

# Rebuild containers (needed after changing Dockerfile or dependencies)
docker-compose up --build

# View logs
docker-compose logs

# View logs for a specific service
docker-compose logs frontend

# Open a shell in the container
docker exec -it jacket-customizer-frontend sh
```

## Troubleshooting

### Common Issues and Solutions

1. **Port Already in Use**:
   If you see an error like "port is already allocated":
   ```bash
   # Find the process using the port
   # For Windows:
   netstat -ano | findstr :3000
   # For Mac/Linux:
   lsof -i :3000
   
   # Kill the process
   # Windows (replace PID with the process ID):
   taskkill /F /PID PID
   # Mac/Linux:
   kill -9 PID
   ```

2. **Permission Denied**:
   If you encounter permission issues:
   ```bash
   # For Mac/Linux:
   sudo docker-compose up
   ```

3. **Node Modules Issues**:
   If you have problems with node_modules:
   ```bash
   # Remove node_modules inside Docker
   docker exec -it jacket-customizer-frontend sh -c "rm -rf node_modules && npm install"
   ```

4. **Docker Taking Too Much Space**:
   To clean up unused Docker resources:
   ```bash
   docker system prune
   ```

## Next Steps

1. Create a branch for your assigned feature
2. Make your changes locally
3. Test in the Docker environment
4. Commit and push your changes
5. Create a pull request

If you encounter any issues with the Docker setup, please ask for help in the team chat.