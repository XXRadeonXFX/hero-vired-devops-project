
# Task 2: User Management and Access Control

## Objective
Create secure user accounts for Sarah and Mike, set up isolated workspaces, enforce password policies, and restrict access to individual directories.

---

## Step-by-Step Guide

### 👤 Step 1: Delete Existing Users (if any)
```bash
sudo userdel -r Sarah
sudo userdel -r Mike
```
Check if deleted:
```bash
getent passwd Sarah Mike
```

---

### 👥 Step 2: Create New Users
```bash
sudo useradd -m -s /bin/bash Sarah
sudo useradd -m -s /bin/bash Mike
```

Set passwords:
```bash
echo "Sarah:StrongPass123!" | sudo chpasswd
echo "Mike:StrongPass123!" | sudo chpasswd
```

Check user entry:
```bash
grep -E 'Sarah|Mike' /etc/passwd
```

---

### 🗂️ Step 3: Create and Secure Workspaces
```bash
sudo mkdir -p /home/Sarah/workspace
sudo mkdir -p /home/Mike/workspace

sudo chown Sarah:Sarah /home/Sarah/workspace
sudo chown Mike:Mike /home/Mike/workspace

sudo chmod 700 /home/Sarah/workspace
sudo chmod 700 /home/Mike/workspace
```

Check permissions:
```bash
sudo ls -ld /home/Sarah/workspace /home/Mike/workspace
```

Expected:
```
drwx------ 2 Sarah Sarah ...
drwx------ 2 Mike  Mike  ...
```

---

### 🔐 Step 4: Set Password Expiry Policy
Edit the config file:
```bash
sudo nano /etc/login.defs
```

Ensure the following lines:
```
PASS_MAX_DAYS   30
PASS_MIN_DAYS   0
PASS_WARN_AGE   7
PASS_MIN_LEN    12
```

Apply to users:
```bash
sudo chage -M 30 Sarah
sudo chage -M 30 Mike
```

Verify:
```bash
sudo chage -l Sarah
sudo chage -l Mike
```

---

### 🔒 Step 5 (Optional): Enforce Password Complexity

Install password quality library:
```bash
sudo apt install libpam-pwquality
```

Edit PAM configuration:
```bash
sudo nano /etc/pam.d/common-password
```

Add or modify this line:
```
password requisite pam_pwquality.so retry=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1
```

---

## ✅ Summary

| Task                              | Status |
|-----------------------------------|--------|
| Create users                      | ✅      |
| Secure workspace directories      | ✅      |
| Enforce password expiration       | ✅      |
| Enforce password complexity       | ✅      |

---

## Author

Prince Thakur  
Fresher DevOps Engineer
