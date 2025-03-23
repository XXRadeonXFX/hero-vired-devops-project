
# DevOps Assignment: Secure Development Environment Setup

## 👨‍💻 Author: Prince Thakur  
## 📅 Date: March 2025  

---

## 🚀 Overview

This assignment involved setting up and managing secure, isolated development environments for two developers — Sarah and Mike — at TechCorp.  
The tasks covered include:

- System Monitoring (CPU, Memory, Disk, Processes)
- User Management and Access Control
- Automated Web Server Backups with Cron Jobs

---

## ✅ Task 1: System Monitoring Setup

### Tools Used:
- `htop`, `nmon`, `df`, `du`, `ps`

### Key Scripts:
- `log_htop.sh`: Logs process stats via `top`
- `log_nmon.sh`: Captures system metrics in `.nmon` format
- `monitor_disk.sh`: Logs disk usage and directory sizes
- `monitor_processes.sh`: Logs top memory and CPU processes

### Outputs:
- Metrics saved in `/var/log/sys_monitor/`
- Cron jobs schedule log generation every 10-15 minutes

---

## ✅ Task 2: User Management & Access Control

### Actions Taken:
- Deleted and recreated users: `Sarah` and `Mike`
- Created isolated directories `/home/Sarah/workspace` & `/home/Mike/workspace`
- Applied `chmod 700` for full privacy
- Password expiry set to 30 days (`chage`)
- Enforced complexity with `pam_pwquality`

### Verifications:
- Ownership and permission checks with `ls -ld`
- Password policy validated with `chage -l`

---

## ✅ Task 3: Backup Configuration for Web Servers

### 🔹 Apache Backup for Sarah
- Script: `/usr/local/bin/apache_backup.sh`
- Backs up `/etc/apache2` and `/var/www/html`
- Scheduled via cron to run **every Tuesday at 12:00 AM**

### 🔹 Nginx Backup for Mike
- Script: `/usr/local/bin/nginx_backup.sh`
- Backs up `/etc/nginx` and `/usr/share/nginx/html`
- Scheduled via cron **same time**

### Validations:
- Manual script execution
- Backup files in `/backups/`
- Verified archive contents with `tar -tzf`

---

## 📁 Deliverables

| Item                    | Path/Command                                 |
|-------------------------|----------------------------------------------|
| Monitoring Scripts      | `/home/radeonxfx/task1/*.sh`                |
| Backup Scripts          | `/usr/local/bin/apache_backup.sh`, `nginx_backup.sh` |
| Cron Jobs               | `crontab -u Sarah -l`, `crontab -u Mike -l` |
| Backup Files            | `/backups/apache_backup_*.tar.gz`           |
| Verification Logs       | Screenshots + `tar -tzf` output              |

---

## 📸 Screenshots

- Monitoring tools running (`htop`, `nmon`)
- Directory permissions
- Backup verification (`ls -lh`, `tar -tzf`)
- Cron job listings

---

## ✅ Completed and Tested on:
- Ubuntu-based Linux (Local VM)
- Users: `Sarah`, `Mike`
- Shell: Bash

---

## 🏁 Conclusion

All required system monitoring, user isolation, and backup automation tasks have been completed and verified. Screenshots and shell outputs have been included for validation and reporting.

---

## 🔗 GitHub Repository

> Push your scripts and report to a GitHub repo and link here for submission.

