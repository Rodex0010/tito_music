FROM python:3.10-slim

# تثبيت الأدوات الأساسية
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    build-essential \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    zlib1g-dev \
    && apt-get clean

# إعداد مجلد العمل
WORKDIR /app

# نسخ المتطلبات فقط لتقليل الـ cache rebuilds
COPY requirements.txt .

# تثبيت المتطلبات الأساسية من requirements.txt
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# 👇 تحميل pytgcalls يدويًا من GitHub (عشان tgcalls dependency)
RUN pip install git+https://github.com/pytgcalls/pytgcalls

# نسخ بقية ملفات المشروع
COPY . .

# تشغيل التطبيق
CMD ["python", "main.py"]
