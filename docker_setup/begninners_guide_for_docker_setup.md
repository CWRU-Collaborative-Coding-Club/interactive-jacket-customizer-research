# Beginner's Guide to the Interactive Jacket Customizer Environment (Updated March 2025)

This guide is designed for team members who are new to development environments and Docker. It will walk you through the basics of getting started with our project setup.

## What is Docker and Why Are We Using It?

**Docker** is a tool that helps us create consistent development environments. Think of it as a way to package our entire development setup (code, dependencies, configurations) into a container that works the same way on everyone's computer.

**Benefits for our project:**
- Everyone has exactly the same environment
- No more "but it works on my machine" problems
- Easy to set up - just run a few commands
- Works the same on Windows, Mac, and Linux

## Getting Started: Basic Concepts

Before diving in, let's cover a few key concepts:

- **Container**: A lightweight, standalone package that includes everything needed to run an application
- **Image**: A blueprint for creating containers
- **Dockerfile**: Instructions for building a Docker image
- **Docker Compose**: A tool for defining and running multi-container applications

## Step 1: Install Docker Desktop

1. Download the latest Docker Desktop from the [official website](https://www.docker.com/products/docker-desktop/)
2. Follow the installation instructions for your operating system
3. Start Docker Desktop

**For Windows Users:**
- Make sure you have WSL2 (Windows Subsystem for Linux) installed
- Docker will prompt you to install it if needed

**For Mac Users:**
- Both Intel and Apple Silicon Macs are supported

**Note about Docker Compose:**
- Docker Desktop comes with Docker Compose V2 pre-installed
- We'll be using the `docker compose` command (with a space, not a hyphen)

## Step 2: Setting Up Our Project

### Option 1: Using the Automated Script (Recommended for Beginners)

1. Open your terminal or command prompt
2. Navigate to the project directory (where you cloned the repository)
3. Run the setup script:

```bash
# Make the script executable (Mac/Linux only)
chmod +x setup.sh

# Run the script
./setup.sh
```

This script will:
- Create all necessary Docker configuration files
- Set up the basic project structure
- Start the Docker containers

### Option 2: Manual Setup

If you prefer to understand each step, follow the detailed instructions in the [Docker Environment Setup Guide](docker-setup.md).

## Step 3: Understanding the Project Structure

Our project is divided into two main parts:

1. **Frontend (React Application)**
   - Running on port 3000
   - Contains the interactive jacket customizer interface
   - Uses React, dnd-kit, and Zustand

2. **Backend (Flask API) - Optional**
   - Running on port 5001
   - Handles data storage and retrieval
   - Uses Python with Flask

## Step 4: Everyday Development Workflow

### Starting the Environment

```bash
# Start the Docker environment
docker-compose up
```

This will start both the frontend and backend containers. You'll see logs from both services in your terminal.

If you want to run the containers in the background:

```bash
docker-compose up -d
```

### Accessing the Application

- Frontend: Open your browser and go to http://localhost:3000
- Backend API: http://localhost:5000/api/health

### Making Changes

1. Use your favorite code editor to modify files in the project directory
2. Changes to the frontend code will automatically refresh in your browser
3. Some changes to the backend may require restarting the container

### Stopping the Environment

When you're done working, you can stop the Docker containers:

```bash
# Stop the containers
docker-compose down
```

## Common Tasks and Commands

### Viewing Logs

```bash
# View logs from all containers
docker-compose logs

# View logs from just the frontend
docker-compose logs frontend

# View logs in real-time
docker-compose logs -f
```

### Rebuilding the Environment

If you make changes to the Dockerfile or add new dependencies:

```bash
# Rebuild and start containers
docker-compose up --build
```

### Opening a Shell Inside the Container

Sometimes you need to run commands inside the container:

```bash
# Open a shell in the frontend container
docker exec -it jacket-customizer-frontend sh

# Open a shell in the backend container
docker exec -it jacket-customizer-backend bash
```

### Installing New Dependencies

To add a new package to the frontend:

```bash
# From inside the frontend container
npm install package-name

# Or directly from your host machine
docker exec -it jacket-customizer-frontend npm install package-name
```

## Troubleshooting Common Issues

### Container Won't Start

1. Check if another service is using the same port
2. Make sure Docker Desktop is running
3. Try restarting Docker Desktop

### Changes Not Showing Up

1. Make sure you're saving your files
2. Check the terminal for error messages
3. Try refreshing your browser
4. Try restarting the containers

### Out of Disk Space

Docker can take up disk space over time. Clean up unused resources:

```bash
docker system prune
```

## Getting Help

If you're stuck:

1. Check the error messages in your terminal
2. Consult the official Docker documentation
3. Ask a team member for help in our project chat
4. Describe the issue clearly, including any error messages

## Development Tools and Tips

### VSCode Integration

Visual Studio Code works well with Docker:

1. Install the Docker extension for VSCode
2. Use the Remote Containers extension to work directly inside the container

### Browser Developer Tools

For frontend development, learn to use Chrome or Firefox developer tools:

1. Right-click on a page element and select "Inspect"
2. Use the Console tab to view errors
3. Use the Network tab to monitor API requests

## Your First Tasks

Now that your environment is set up, here are some beginner-friendly tasks to get started:

1. Open the application in your browser
2. Make a small change to the frontend code and see it update
3. Explore the project structure
4. Complete your assigned tasks for the sprint

Remember, everyone on the team started as a beginner at some point. Don't hesitate to ask questions!