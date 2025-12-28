# Use a Python image with TensorFlow pre-installed to save time
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies needed for some ML libraries
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file and install libraries
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your python script into the container
COPY stock_prediction.py .

# Run the script when the container starts
CMD ["python", "stock_prediction.py"]