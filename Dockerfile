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