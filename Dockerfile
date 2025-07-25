# صورة خفيفة من بايثون 3.10
FROM python:3.10-slim

# تثبيت الأدوات المطلوبة للنظام
RUN apt-get update && apt-get install -y \
    build-essential \
    ffmpeg \
    git \
    libopus-dev \
    libffi-dev \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# إعداد مجلد العمل
WORKDIR /app

# نسخ ملفات المشروع
COPY . .

# تثبيت المتطلبات
RUN pip install --upgrade pip && pip install -r requirements.txt

# تشغيل البوت
CMD ["python", "main.py"]
