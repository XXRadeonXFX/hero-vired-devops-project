
# Task 1: System Monitoring Setup

## Objective
Set up real-time monitoring of CPU, memory, disk usage, and processes using tools like `htop`, `nmon`, `df`, and `du`. Automate system logging via shell scripts and schedule them using cron jobs.

---

## Directory Structure
```
/home/radeonxfx/task1/
├── monitor_disk.sh
├── monitor_processes.sh
├── log_htop.sh
├── log_nmon.sh
```

---

## Scripts Overview

### 🔍 `monitor_disk.sh`
Logs disk usage and sizes of web directories.

**What it does:**
- Logs `df -h` output (mounted partition disk usage).
- Logs `du -sh` of `/var/www/html` and `/usr/share/nginx/html`.

**Run:**
```bash
bash monitor_disk.sh
```

---

### 🔧 `monitor_processes.sh`
Captures top CPU and memory-consuming processes.

**What it does:**
- Logs output of:
  - `ps aux --sort=-%cpu | head -5`
  - `ps aux --sort=-%mem | head -5`

**Run:**
```bash
bash monitor_processes.sh
```

---

### 📊 `log_htop.sh`
Simulates `htop` output using `top` in batch mode and logs it.

**What it does:**
- Uses `top -b -n 1` to capture process stats.
- Outputs to `/var/log/sys_monitor/htop_snapshot.log`.

**Run:**
```bash
bash log_htop.sh
```

---

### 📈 `log_nmon.sh`
Uses `nmon` to generate detailed system metrics snapshots.

**What it does:**
- Runs `nmon -f -s 10 -c 6` to log every 10s for 1 minute.
- Saves `.nmon` file in `/var/log/sys_monitor/`.

**Run:**
```bash
bash log_nmon.sh
```

---

## Log Directory
Ensure the log folder exists:
```bash
sudo mkdir -p /var/log/sys_monitor
```

---

## Cron Setup

You can automate logging by editing the crontab:
```bash
sudo crontab -e
```

Add these lines:
```bash
*/10 * * * * /home/radeonxfx/task1/monitor_disk.sh
*/15 * * * * /home/radeonxfx/task1/log_htop.sh
*/15 * * * * /home/radeonxfx/task1/log_nmon.sh
*/15 * * * * /home/radeonxfx/task1/monitor_processes.sh
```

---

## Output Example

- `system_metrics.log`: combined disk, du, and process stats
- `htop_snapshot.log`: snapshot of top output
- `*.nmon`: full system logs for external analysis

---

## Author
Prince Thakur  
Fresher DevOps Engineer  
