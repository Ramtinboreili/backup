#!/bin/bash

# تنظیمات
EMAIL="ramtin.bor7hp@gmail.com"  # آدرس ایمیل مقصد
SOURCE_DIR=" /root"  
BACKUP_DIR="/root/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.zip"

# ایجاد پوشه بکاپ اگر وجود ندارد
mkdir -p "$BACKUP_DIR"

# فشرده‌سازی فایل‌ها
zip -r "$BACKUP_FILE" $SOURCE_DIR

# ارسال ایمیل با فایل پیوست
echo "Backup created on $TIMESTAMP" | mail -s "Server Backup - $TIMESTAMP" -A "$BACKUP_FILE" "$EMAIL"

# حذف بکاپ‌های قدیمی‌تر از ۷ روز
find "$BACKUP_DIR" -type f -name "backup_*.zip" -mtime +7 -exec rm {} \;

echo "Backup completed and sent to $EMAIL"
