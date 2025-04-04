# React Client Dockerfile
FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy client code
COPY . .

# Set environment variables
ENV REACT_APP_API_URL=http://localhost:5001/api

# Expose port
EXPOSE 3000

# Start development server
CMD ["npm", "start"]