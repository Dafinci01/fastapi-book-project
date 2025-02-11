# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the dependency file first to leverage Docker’s cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code (note the folder change from ./app to ./api)
COPY ./api /app/api

# Start the application using Uvicorn (adjust the module path if needed)
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]

