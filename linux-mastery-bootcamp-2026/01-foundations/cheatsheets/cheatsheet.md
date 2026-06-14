# Phase 1: Foundations Cheatsheet

## Navigation

| Command | Description |
|---------|-------------|
| pwd | Print working directory |
| cd ~ | Change to home directory |
| cd - | Change to previous directory |
| ls -la | List all files including hidden |
| ls -lahtr | List sorted by time, reversed |
| tree | Visual directory tree |
| find / -type f -name "*.log" -mtime +7 | Find files modified >7 days ago |
| locate filename | Fast file search (requires updatedb) |
| which command | Show command path |
| whereis command | Show binary, source, and man page locations |

## File Operations

| Command | Description |
|---------|-------------|
| touch file | Create empty file or update timestamp |
| mkdir -p dir/subdir | Create directory and parents |
| cp -a src dst | Copy preserving attributes |
| mv old new | Move or rename |
| rm -rf dir | Recursively remove (destructive) |
| rmdir dir | Remove empty directory |
| ln -s target link | Create symbolic link |
| ln target link | Create hard link |
| rsync -avz src dst | Synchronize directories |
| tar czf archive.tar.gz files | Create compressed archive |
| tar xzf archive.tar.gz | Extract compressed archive |

## Pipes and Redirection

| Syntax | Description |
|--------|-------------|
| cmd1 | cmd2 | Pipe stdout of cmd1 to stdin of cmd2 |
| > file | Redirect stdout to file (overwrite) |
| >> file | Redirect stdout to file (append) |
| 2> file | Redirect stderr to file |
| &> file | Redirect stdout and stderr to file |
| < file | Use file as stdin |
| << EOF | Here-document |
| <<< string | Here-string |
| cmd |& cmd2 | Pipe stdout and stderr |
| tee -a file | Write to stdout and file simultaneously |

## Text Processing

| Command | Description |
|---------|-------------|
| grep -Ei pattern file | Extended regex, case-insensitive search |
| grep -r pattern dir | Recursive search |
| sed -i.bak 's/old/new/g' file | In-place substitution with backup |
| awk '{print $1}' file | Print first field |
| awk -F: '{print $1}' file | Use : as field separator |
| sort -k3 -n file | Sort by third column numerically |
| sort | uniq -c | sort -nr | Count and sort occurrences |
| wc -l | Count lines |
| cut -d: -f1 file | Extract first field using delimiter |
| tr 'a-z' 'A-Z' | Translate characters |
| paste file1 file2 | Merge lines side by side |

## Permissions

| Command | Description |
|---------|-------------|
| chmod 755 file | rwxr-xr-x |
| chmod 644 file | rw-r--r-- |
| chmod u+s file | Set SUID bit |
| chmod g+s file | Set SGID bit |
| chmod +t dir | Set sticky bit |
| chown user:group file | Change owner and group |
| umask 022 | Default permissions for new files |
| getfacl file | Get ACL |
| setfacl -m u:user:rwx file | Set ACL |
| ls -la | View permissions |

## SSH and Remote

| Command | Description |
|---------|-------------|
| ssh user@host | Connect to remote server |
| ssh -i key user@host | Connect with specific key |
| ssh-keygen -t ed25519 | Generate SSH key pair |
| ssh-copy-id user@host | Copy public key to server |
| scp -r file user@host:/path | Secure copy |
| rsync -e ssh -avz src user@host:/path | Sync over SSH |
| ~/.ssh/config | SSH client configuration |
| ~/.ssh/authorized_keys | Allowed public keys on server |
| /etc/ssh/sshd_config | SSH server configuration |

## System Info

| Command | Description |
|---------|-------------|
| df -h | Disk usage, human-readable |
| du -sh dir | Directory size |
| free -h | Memory usage |
| uptime | System uptime and load |
| uname -a | Kernel information |
| lsb_release -a | Distribution information |
| dmesg | Kernel ring buffer |
| lscpu | CPU information |
| lsblk | Block devices |
| lspci | PCI devices |
| lsusb | USB devices |

## Gotchas

- `rm -rf /` is blocked by `--preserve-root`, but `rm -rf /*` is not
- `chmod -R 777` breaks setuid bits
- `kill -9` does not kill zombies; the parent must call wait()
- Redirecting grep output to the same file truncates before reading; use `sponge` from moreutils
- SSH key files must have permissions 600 (`chmod 600 ~/.ssh/id_rsa`)
- Linux is case-sensitive: `File.txt` and `file.txt` are different files
