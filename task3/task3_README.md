
# Task 3: Backup Configuration for Web Servers

## Objective
Configure automated backups for Apache and Nginx web servers to ensure data integrity and disaster recovery.  
- Sarah manages Apache.
- Mike manages Nginx.

---

## ✅ Apache Backup Setup for Sarah

### Step 1: Create Backup Directory
```bash
sudo mkdir -p /backups
sudo chmod 700 /backups
```

### Step 2: Create Apache Backup Script
```bash
sudo nano /usr/local/bin/apache_backup.sh
```

Paste:
```bash
#!/bin/bash
DATE=$(date +%F)
BACKUP_DIR="/backups"
BACKUP_FILE="$BACKUP_DIR/apache_backup_$DATE.tar.gz"
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_FILE /etc/apache2 /var/www/html

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup FAILED for $DATE" >&2
fi
```

Make it executable:
```bash
sudo chmod +x /usr/local/bin/apache_backup.sh
```

### Step 3: Test Script & Verify
```bash
sudo /usr/local/bin/apache_backup.sh
sudo ls -lh /backups/
sudo tar -tzf /backups/apache_backup_$(date +%F).tar.gz
```

### Step 4: Schedule Cron Job
```bash
sudo crontab -u Sarah -e
```

Add:
```bash
0 0 * * 2 /usr/local/bin/apache_backup.sh
```

---

## ✅ Nginx Backup Setup for Mike

### Step 1: Confirm Directories Exist
```bash
ls -ld /etc/nginx /usr/share/nginx/html
```

If missing:
```bash
sudo mkdir -p /usr/share/nginx/html
```

### Step 2: Create Nginx Backup Script
```bash
sudo nano /usr/local/bin/nginx_backup.sh
```

Paste:
```bash
#!/bin/bash
DATE=$(date +%F)
BACKUP_DIR="/backups"
BACKUP_FILE="$BACKUP_DIR/nginx_backup_$DATE.tar.gz"
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_FILE /etc/nginx /usr/share/nginx/html

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup FAILED for $DATE" >&2
fi
```

Make it executable:
```bash
sudo chmod +x /usr/local/bin/nginx_backup.sh
```

### Step 3: Test Script & Verify
```bash
sudo /usr/local/bin/nginx_backup.sh
sudo ls -lh /backups/
sudo tar -tzf /backups/nginx_backup_$(date +%F).tar.gz
```

### Step 4: Schedule Cron Job
```bash
sudo crontab -u Mike -e
```

Add:
```bash
0 0 * * 2 /usr/local/bin/nginx_backup.sh
```

---

## 📦 Output Example

- `/backups/apache_backup_YYYY-MM-DD.tar.gz`
- `/backups/nginx_backup_YYYY-MM-DD.tar.gz`

---

## ✅ Final Checklist

| Task                                             | Status |
|--------------------------------------------------|--------|
| Apache directories verified                      | ✅     |
| Apache backup script created                     | ✅     |
| Apache backup file created and verified          | ✅     |
| Cron job scheduled for Sarah                     | ✅     |
| Nginx directories verified                       | ✅     |
| Nginx backup script created                      | ✅     |
| Nginx backup file created and verified           | ✅     |
| Cron job scheduled for Mike                      | ✅     |

---

## Author

Prince Thakur  
Fresher DevOps Engineer
