FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    ffmpeg \
    git \
    libopus-dev \
    libffi-dev \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["python", "main.py"]
