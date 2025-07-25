# استخدم صورة مناسبة تتضمن أدوات الترجمة و pip
FROM python:3.10-slim

# تثبيت الأدوات المطلوبة للنظام لبناء بعض المكتبات (مثل aiohttp و psutil و ffmpeg-python)
RUN apt-get update && apt-get install -y \
    build-essential \
    ffmpeg \
    git \
    && apt-get clean

# إعداد مجلد العمل
WORKDIR /app

# نسخ جميع الملفات
COPY . .

# تثبيت المتطلبات
RUN pip install --upgrade pip && pip install -r requirements.txt

# أمر التشغيل الرئيسي
CMD ["python", "main.py"]
