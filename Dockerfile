# Use a lightweight Python image
FROM python:3.10-slim

# Install necessary packages including Nginx and Supervisor
RUN apt-get update && \
    apt-get install -y nginx supervisor && \
    rm -rf /var/lib/apt/lists/*

# Create necessary directories
RUN mkdir -p /app /app/logs /etc/supervisor/conf.d

# Set the working directory
WORKDIR /app

# Copy dependency file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code and configuration files
COPY . /app

# Copy your Nginx configuration into place
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy Supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose port 80 (Nginx will listen on 80)
EXPOSE 80

# Start Supervisor (which will run both Nginx and Uvicorn)
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

