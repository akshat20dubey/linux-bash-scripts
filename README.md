# 🐧 Linux Bash Scripts

A collection of practical Bash scripts built while learning Linux fundamentals as part of my Platform Engineer journey.

---

## 📁 Scripts Overview

| Script | Description |
|--------|-------------|
| `system-health-check.sh` | Displays CPU, Memory, and Disk usage with alerts |
| `server-uptime-monitor.sh` | Checks if websites/servers are UP or DOWN and logs results |
| `log-analyzer.sh` | Scans log files and extracts ERROR and WARNING lines |
| `backup.sh` | Creates a compressed timestamped backup of any folder |
| `user-manager.sh` | Interactive menu to create, delete, or list Linux users |

---

## 🚀 How to Use

**1. Clone the repo**
```bash
git clone https://github.com/akshat20dubey/linux-bash-scripts.git
cd linux-bash-scripts
```

**2. Give execute permission**
```bash
chmod +x *.sh
```

**3. Run any script**
```bash
# Check system health
./system-health-check.sh

# Monitor server uptime
./server-uptime-monitor.sh

# Analyze a log file
./log-analyzer.sh /var/log/syslog

# Backup a folder
./backup.sh /home/user/documents /home/user/backups

# Manage users (requires sudo)
sudo ./user-manager.sh
```

---

## 💡 Sample Output

**system-health-check.sh**
```
======================================
       SYSTEM HEALTH REPORT
======================================
Date: Sun Mar 15 2026
CPU Usage     : 12.3%
Memory Usage  : 1024MB / 4096MB (25.0%)
Disk Usage    : 15G / 50G (30%)
======================================
```

**server-uptime-monitor.sh**
```
======================================
       SERVER UPTIME MONITOR
======================================
✅ UP   | https://google.com (HTTP 200)
✅ UP   | https://github.com (HTTP 200)
✅ UP   | https://aws.amazon.com (HTTP 200)
======================================
```

---

## 🛠️ Tech Used

![Bash](https://img.shields.io/badge/bash_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

---

## 📚 What I Learned

- Linux file system navigation and permissions
- Writing reusable Bash functions
- Using `grep`, `awk`, `cut`, `df`, `free`, `top` commands
- Automating repetitive system tasks with scripts
- Logging output to files for monitoring

---

## 🗺️ Part of My Learning Roadmap

This is **Project 1** of my Platform Engineer roadmap.

---

## 🔗 Connect

[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://linkedin.com/in/akshatautomates)
