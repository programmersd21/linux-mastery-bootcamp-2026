# Phase 3: Administration and Security

Duration: 6 weeks. Goal: production-ready administration and security.

## Learning Goals

1. Implement comprehensive security hardening
2. Configure centralized authentication (LDAP/SSSD)
3. Master log analysis and intrusion detection
4. Automate tasks with robust shell scripting
5. Manage SSL/TLS and certificate infrastructure
6. Respond to security incidents and forensics

## Exit Criteria

- Harden server to pass CIS Level 2 audit
- Write 100-line bash script with error handling
- Configure centralized user authentication
- Analyze logs to identify breach timeline
- Rotate and deploy certificates automatically

## Weekly Breakdown

### Week 10: Shell Scripting Mastery

**Core topics:**
- Bash strict mode: `set -euo pipefail`
- Functions, error handling, traps
- Arrays, associative arrays, string manipulation
- External tools integration: jq, xargs, parallel

**Mental model:** A script is a contract. It must define inputs, handle edge cases, specify failure consequences, and have exit clauses. Unset variables expanding to empty strings, pipe failures hidden by default, and race conditions in temporary files are common failure modes.

**Labs:**
- Lab 10.1: Strict Mode
- Lab 10.2: Error Handling
- Lab 10.3: Script Library

**Real-world scenario:** Automate user onboarding: create account, add to groups, set up SSH keys, configure email, send welcome message, maintain audit trail.

**Checkpoint:**
- Write script that safely handles filenames with spaces and special characters
- Implement idempotent configuration management script
- Debug script that works interactively but fails in cron

---

### Week 11: Security Hardening

**Core topics:**
- CIS benchmarks and hardening scripts
- SELinux/AppArmor mandatory access control
- File integrity monitoring (AIDE, Tripwire)
- PAM configuration and authentication policies

**Mental model:** Defense in depth. Assume breach. Every layer must slow the attacker and create noise. SELinux disabled instead of tuned, weak password policy, and unmonitored SUID binaries are common failure modes.

**Labs:**
- Lab 11.1: CIS Hardening
- Lab 11.2: SELinux Policy
- Lab 11.3: AIDE Monitoring

**Real-world scenario:** Compliance audit incoming. Run baseline scan, identify gaps, implement fixes, document exceptions, schedule continuous monitoring.

**Checkpoint:**
- Explain difference between DAC and MAC with real-world examples
- Configure PAM to enforce password complexity and lockout after 3 failures
- Debug SELinux denial without setting to permissive mode

---

### Week 12: Cryptography and Certificates

**Core topics:**
- TLS/SSL handshake, certificate chains, CA hierarchy
- OpenSSL for certificate generation and validation
- Let's Encrypt/certbot automation
- Certificate pinning, HSTS, modern TLS configuration

**Labs:**
- Lab 12.1: Internal CA
- Lab 12.2: Let's Encrypt
- Lab 12.3: TLS Hardening

**Real-world scenario:** Migrate all services from self-signed to proper certificates. Implement monitoring for expiry. Document renewal procedures.

**Checkpoint:**
- Explain certificate chain validation with OpenSSL commands
- Debug "certificate verify failed" error with three approaches
- Configure nginx with modern TLS (1.3 only, strong ciphers)

---

### Week 13: Logging, Monitoring, and Forensics

**Core topics:**
- rsyslog/syslog-ng configuration, remote logging
- logrotate advanced configuration
- auditd for system call auditing
- Basic forensics: timeline analysis, file recovery

**Labs:**
- Lab 13.1: Centralized Logging
- Lab 13.2: Audit Trail
- Lab 13.3: Incident Response

**Real-world scenario:** Alert: multiple failed SSH attempts followed by successful login at 3 AM. Analyze logs, identify compromised account, determine lateral movement, preserve evidence.

**Checkpoint:**
- Configure auditd to monitor all /etc/passwd modifications
- Create log analysis pipeline that detects brute force in real-time
- Perform forensic timeline reconstruction from multiple log sources

---

### Week 14: Network Services

**Core topics:**
- DNS (bind/unbound): zones, records, recursion, DNSSEC
- DHCP server configuration
- NFSv4 with Kerberos security
- Samba/Windows integration

**Labs:**
- Lab 14.1: DNS Server
- Lab 14.2: NFS Secure
- Lab 14.3: Samba Share

**Real-world scenario:** Office file server migration. Plan cutover, configure new server, test with subset of users, migrate data, decommission old server.

**Checkpoint:**
- Explain DNS resolution order in Linux (files, dns, myhostname)
- Debug NFS "permission denied" despite correct exports
- Configure split-horizon DNS for internal/external resolution

---

### Week 15: Security Operations

**Core topics:**
- Vulnerability scanning (OpenVAS, Nessus basics)
- Intrusion detection (Snort/Suricata, OSSEC)
- Patch management and maintenance windows
- Security incident response procedures

**Labs:**
- Lab 15.1: Vulnerability Scan
- Lab 15.2: IDS Setup
- Lab 15.3: Incident Playbook

**Real-world scenario:** CVE announced for critical service. Assess exposure, identify affected systems, test patch, deploy during maintenance window, verify.

**Checkpoint:**
- Write custom Suricata rule for specific attack pattern
- Create automated patch deployment with rollback capability
- Conduct tabletop incident response exercise

## Phase 3 Project: Secure Infrastructure

Build a secure, monitored infrastructure with hardened servers:

1. Deploy 3 VMs: web server, database server, monitoring server
2. Harden all servers to CIS Level 1
3. Configure SELinux in enforcing mode
4. Set up centralized logging (rsyslog with TLS)
5. Deploy internal PKI for service certificates
6. Set up AIDE file integrity monitoring
7. Create incident response playbooks
8. Document security policies

**Deliverables:** Infrastructure diagram, security audit report, incident response playbook, GitHub repo with all configurations.

## Assessment

Before advancing to Phase 4, demonstrate:

- [ ] Write 100-line bash script with `set -euo pipefail`
- [ ] Configure SELinux to allow non-standard application without disabling
- [ ] Create internal CA, issue certificates, configure trust chain
- [ ] Analyze audit logs to reconstruct security incident timeline
- [ ] Configure DNS with reverse lookup
- [ ] Deploy and tune IDS rule
- [ ] Create incident response playbook
- [ ] Automate vulnerability scanning

## Resources

- [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks)
- [SELinux Project](https://github.com/SELinuxProject)
- [Let's Encrypt Documentation](https://letsencrypt.org/docs/)
