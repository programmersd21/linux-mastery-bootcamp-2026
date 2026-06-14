# Phase 3: Administration and Security Cheatsheet

## Bash Scripting

| Syntax | Description |
|--------|-------------|
| set -euo pipefail | Strict mode: exit on error, unset vars, pipe failures |
| IFS=$'\n\t' | Safe word splitting |
| ${var:-default} | Default value if unset |
| ${var:?error} | Error and exit if unset |
| trap 'cleanup' EXIT ERR | Run cleanup on exit or error |
| [[ -e file ]] && cmd || cmd | Test and conditional execution |
| mapfile -t array < file | Read file into array |
| declare -A assoc | Declare associative array |
| local var=value | Local variable in function |
| readonly var=value | Read-only variable |

## Security

| Command | Description |
|---------|-------------|
| getenforce | Show SELinux mode |
| setenforce 0\|1 | Set SELinux permissive/enforcing |
| chcon -t type file | Change SELinux context |
| semanage fcontext -a -t type file | Add file context rule |
| restorecon -Rv /path | Restore SELinux contexts |
| audit2allow -a -M local | Generate SELinux policy from denials |
| lynis audit system | Run security audit |
| oscap xccdf eval --profile | Evaluate CIS benchmark |
| aide --init | Initialize file integrity database |
| aide --check | Check file integrity |
| aide --update | Update integrity database |

## Cryptography

| Command | Description |
|---------|-------------|
| openssl req -newkey rsa:2048 -keyout key.pem -out csr.pem | Generate CSR |
| openssl x509 -req -in csr -signkey key -out cert.pem | Self-sign certificate |
| openssl s_client -connect host:443 | Test TLS connection |
| certbot certonly --standalone | Obtain Let's Encrypt certificate |
| openssl x509 -in cert.pem -text -noout | View certificate details |
| openssl verify -CAfile ca.crt cert.pem | Verify certificate chain |
| update-ca-certificates | Update CA trust store |

## Logging and Audit

| Command | Description |
|---------|-------------|
| auditctl -w /etc/passwd -p wa -k user_logins | Watch file for writes/attribute changes |
| ausearch -ts today -k user_logins | Search audit logs by key |
| journalctl --since "1 hour ago" | Logs from last hour |
| journalctl -u service -f | Follow service logs |
| logrotate -d /etc/logrotate.conf | Test logrotate configuration |
| logger -p auth.warning "message" | Write to system log |
| rsyslogd -N1 | Test rsyslog configuration |

## Network Services

| Command | Description |
|---------|-------------|
| named-checkconf | Test BIND configuration |
| rndc reload | Reload BIND |
| dig +short @server example.com A | DNS query |
| showmount -e server | List NFS exports |
| mount -t nfs4 server:/share /mnt | Mount NFSv4 |
| testparm -s | Test Samba configuration |
| smbstatus | Show Samba connections |

## Forensics

| Command | Description |
|---------|-------------|
| strings /bin/ls \| grep password | Extract strings from binary |
| photorec /dev/sdb | File recovery from disk |
| dd if=/dev/sda of=image bs=4M | Create disk image |
| find / -mtime -1 -type f | Files modified in last 24 hours |
| last, lastb | Login history |
| lsof -p PID | Files opened by process |
| lsof +L1 | Deleted files still held open |

## Gotchas

- `set -e` fails on commands in OR lists; use `cmd || true` when failure is acceptable
- SELinux contexts persist after `chmod`; use `restorecon` to apply policy
- AIDE database must be stored on read-only media for integrity guarantees
- `certbot renew` does not reload services; use `--deploy-hook` to restart
- auditd rules are order-dependent; the last matching rule wins
- Always test BIND configuration with `named-checkconf` before reload
