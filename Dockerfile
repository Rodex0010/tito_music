FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    build-essential \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    zlib1g-dev \
    && apt-get clean

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# 👇 هنا بننزّل pytgcalls يدويًا من GitHub الرسمي
RUN pip install git+https://github.com/pytgcalls/pytgcalls

COPY . .

CMD ["python", "main.py"]
