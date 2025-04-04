# Flask Server Dockerfile
FROM python:3.10-slim

WORKDIR /app

# Install dependencies
COPY server/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy server code
COPY server/ .

# Create data directory
RUN mkdir -p research_data

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_DEBUG=True
ENV FLASK_PORT=5001

# Expose port
EXPOSE 5001

# Run server
CMD ["python", "app.py"]