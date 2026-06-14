# Lab 10.1: Script Like a Pro

Difficulty: Advanced. Time: 60 minutes. XP: +100.

## Objective

Write a production-grade bash script with strict mode, error handling, and functions. Build a backup script suitable for production use.

## Starting State

A directory `/var/www/html` contains a website requiring daily backups.

## Requirements

The script must:
1. Back up website files
2. Back up the MySQL database
3. Compress and rotate old backups
4. Send notification on success or failure

## Instructions

1. Create the script:
   ```bash
   sudo nano /usr/local/bin/website-backup.sh
   ```

2. Add strict mode and configuration:
   ```bash
   #!/bin/bash
   set -euo pipefail
   IFS=$'\n\t'

   BACKUP_DIR="/backup/website"
   SOURCE_DIR="/var/www/html"
   DB_NAME="mywebsite"
   DB_USER="backup_user"
   DB_PASS="${DB_PASSWORD:-}"
   RETENTION_DAYS=7
   TIMESTAMP=$(date +%Y%m%d_%H%M%S)
   BACKUP_NAME="website_${TIMESTAMP}"
   ```

3. Define functions:
   ```bash
   log() {
       echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
   }

   cleanup() {
       local exit_code=$?
       if [ $exit_code -ne 0 ]; then
           log "ERROR: Backup failed with exit code $exit_code"
       else
           log "SUCCESS: Backup completed"
       fi
   }

   check_prerequisites() {
       if [ -z "$DB_PASS" ]; then
           log "ERROR: DB_PASSWORD not set"
           exit 1
       fi
       if [ ! -d "$SOURCE_DIR" ]; then
           log "ERROR: Source directory missing"
           exit 1
       fi
       mkdir -p "$BACKUP_DIR"
   }
   ```

4. Add main logic:
   ```bash
   trap cleanup EXIT
   check_prerequisites

   BACKUP_PATH="${BACKUP_DIR}/${BACKUP_NAME}"
   mkdir -p "$BACKUP_PATH"

   log "Starting file backup"
   tar czf "${BACKUP_PATH}/files.tar.gz" -C "$SOURCE_DIR" .

   log "Starting database backup"
   mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "${BACKUP_PATH}/database.sql"

   log "Compressing backup"
   tar czf "${BACKUP_PATH}.tar.gz" -C "$BACKUP_DIR" "$BACKUP_NAME"
   rm -rf "$BACKUP_PATH"

   log "Rotating old backups"
   find "$BACKUP_DIR" -name "website_*.tar.gz" -mtime +$RETENTION_DAYS -delete

   BACKUP_SIZE=$(du -h "${BACKUP_PATH}.tar.gz" | cut -f1)
   log "Backup size: $BACKUP_SIZE"
   ```

5. Make executable and test:
   ```bash
   sudo chmod +x /usr/local/bin/website-backup.sh
   export DB_PASSWORD="your_password"
   sudo -E /usr/local/bin/website-backup.sh
   ```

## Verification

```bash
ls -lah /backup/website/
tar tzf /backup/website/website_*.tar.gz | head
find /backup/website -name "website_*.tar.gz" | wc -l
```

## Failure Cases

| Problem | Cause | Solution |
|---------|-------|----------|
| DB_PASSWORD not set | Missing environment variable | Export before running |
| mysqldump not found | Package not installed | Install mysql-client |
| Permission denied | Wrong user or permissions | Run with sudo or fix permissions |
| Script exits silently | Strict mode catching error | Add `set -x` temporarily for debugging |

## What You Learned

- Strict mode catches bugs before they become problems
- Functions provide reusable, testable code blocks
- `trap` ensures cleanup runs even on failure
- Environment variables provide a secure way to pass secrets
- Log rotation prevents disk space exhaustion

## Challenge

Add these features:
1. Pre-backup health check (is the website responding?)
2. Backup verification (extract and check integrity)
3. Remote backup sync with rsync
4. Slack or email notification
5. Lock file to prevent concurrent runs
