
# استخدام Python 3.10 لأنه متوافق مع جميع المكتبات المطلوبة
FROM python:3.10-slim

# تعيين مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ كل ملفات المشروع داخل الحاوية
COPY . .

# تثبيت المتطلبات داخل بيئة Python الافتراضية
RUN python -m venv /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install -r requirements.txt

# تفعيل البيئة الافتراضية بشكل دائم
ENV PATH="/opt/venv/bin:$PATH"

# تشغيل السكريبت الرئيسي
CMD ["python", "main.py"]
