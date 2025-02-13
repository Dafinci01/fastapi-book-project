# Use a lightweight Python image
FROM python:3.10

# Install system dependencies (nginx and supervisor)
RUN apt-get update && \
    apt-get install -y nginx supervisor && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /app/logs /etc/supervisor/conf.d

WORKDIR /app

# Copy requirements and install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY . /app

# Copy Nginx configuration and Supervisor configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose port 80 (Nginx will listen on 80)
EXPOSE 80  8000

# Start Supervisor to run both FastAPI (via uvicorn) and Nginx
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

