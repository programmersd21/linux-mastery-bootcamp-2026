# Lab 1.3: The Cleanup Crew

Difficulty: Beginner. Time: 30 minutes. XP: +50.

## Objective

Safely delete files, understand trash mechanisms, and learn to recover from mistakes. Clean up a messy `/tmp` directory.

## Starting State

Create the test environment:

```bash
mkdir -p /tmp/cleanup-challenge/{old,current,backup,logs}
touch /tmp/cleanup-challenge/old/file_{1..20}.tmp
touch /tmp/cleanup-challenge/current/project_{a..e}.py
touch /tmp/cleanup-challenge/backup/backup_$(date -d '30 days ago' +%Y%m%d).tar.gz
touch /tmp/cleanup-challenge/backup/backup_$(date -d '60 days ago' +%Y%m%d).tar.gz
touch /tmp/cleanup-challenge/backup/backup_$(date -d '90 days ago' +%Y%m%d).tar.gz
dd if=/dev/zero of=/tmp/cleanup-challenge/logs/app.log bs=1M count=10
dd if=/dev/zero of=/tmp/cleanup-challenge/logs/error.log bs=1M count=5
dd if=/dev/zero of=/tmp/cleanup-challenge/logs/access.log bs=1M count=20
cp /tmp/cleanup-challenge/current/project_a.py /tmp/cleanup-challenge/old/project_a.py
cp /tmp/cleanup-challenge/current/project_b.py /tmp/cleanup-challenge/backup/project_b.py
```

## Instructions

1. Assess disk usage:
   ```bash
   cd /tmp/cleanup-challenge
   du -sh *
   ```

2. Find all `.tmp` files:
   ```bash
   find . -name "*.tmp" -type f
   ```

3. Find files older than 30 days:
   ```bash
   find . -type f -mtime +30
   ```

4. Find duplicates by checksum:
   ```bash
   find . -type f -exec md5sum {} + | sort | uniq -d -w32
   ```

5. Move old `.tmp` files to trash instead of deleting:
   ```bash
   mkdir -p ~/trash/cleanup-$(date +%Y%m%d)
   find . -name "*.tmp" -type f -exec mv {} ~/trash/cleanup-$(date +%Y%m%d)/ \;
   ```

6. Move backups older than 60 days to trash:
   ```bash
   find ./backup -type f -mtime +60 -exec mv {} ~/trash/cleanup-$(date +%Y%m%d)/ \;
   ```

7. Compress logs older than 7 days:
   ```bash
   find ./logs -name "*.log" -type f -mtime +7 -exec gzip {} \;
   ```

8. Remove duplicates from `old/` and `backup/`, keeping originals in `current/`:
   ```bash
   rm /tmp/cleanup-challenge/old/project_a.py
   rm /tmp/cleanup-challenge/backup/project_b.py
   ```

## Verification

- No `.tmp` files remain
- Only backups from the last 60 days remain
- Logs are compressed (`.gz` files)
- No duplicate files remain
- Total space is reduced

```bash
du -sh /tmp/cleanup-challenge/
find /tmp/cleanup-challenge -type f | wc -l
```

## Failure Cases

| Problem | Cause | Solution |
|---------|-------|----------|
| Deleted wrong file | No verification step | Always `ls` before `rm`; use trash first |
| Not enough space to move to trash | Disk full | Compress first, then move |
| Operation not permitted | Wrong permissions | Check with `ls -la` |
| `find` too slow | Deep directory tree | Add `-maxdepth 2` |

## What You Learned

- `du` shows disk usage; `du -sh` summarizes human-readable
- `find` locates files by name, type, age, and other criteria
- `-mtime +30` finds files modified more than 30 days ago
- `gzip` compresses files in place
- `md5sum` creates checksums for finding duplicates
- Trash is safer than `rm`; use `trash-cli` when available
- Always verify before deleting

## Challenge

Write a cleanup script with a `--dry-run` option that shows what it would do without making changes.
