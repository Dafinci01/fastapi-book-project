# Use a lightweight Python image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy only the dependency file first to leverage Docker’s cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app

# Start the application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

