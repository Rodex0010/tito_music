# Use official lightweight Python image
FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    build-essential \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    zlib1g-dev \
    && apt-get clean

# Set work directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip \
 && pip cache purge \
 && pip install --no-cache-dir -r requirements.txt

# Copy the entire app
COPY . .

# Expose port (if needed)
EXPOSE 8080

# Default command to run the bot (adjust if needed)
CMD ["python", "main.py"]
