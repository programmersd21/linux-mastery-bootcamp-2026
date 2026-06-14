# Linux Mastery Bootcamp 2026

A complete, self-contained Linux curriculum progressing from fundamentals to job-ready specialization.

## Structure

| Phase | Weeks | Focus | Certificate |
|-------|-------|-------|-------------|
| 01 Foundations | 4 | Shell, filesystem, text processing, permissions | Linux Foundations |
| 02 Intermediate | 5 | Storage, networking, systemd, kernel, server builds | Linux Systems Administrator |
| 03 Administration & Security | 6 | Scripting, hardening, crypto, forensics, services | Linux Security Professional |
| 04 Advanced Engineering | 5 | IaC, containers, CI/CD, observability, performance | Linux DevOps Engineer |
| 05 Specialization | 4 | Choose one: DevOps/Cloud, Security, Systems Programming, Embedded Linux | Linux Specialist |

Total: 24 weeks. 45+ labs. 12 projects. 5 certificates.

## Prerequisites

- A computer with 4GB RAM minimum
- 20GB free disk space
- Internet connection
- No prior Linux experience required

## Setup

### Option 1: Virtual Machine (Recommended)

Install VirtualBox, VMware, or UTM. Create a VM with:
- 2 CPU cores
- 4GB RAM
- 20GB disk
- Ubuntu Server 24.04 or AlmaLinux 9

### Option 2: WSL2 (Windows)

```powershell
wsl --install
```

Reboot, then open Ubuntu from the Start Menu.

### Option 3: Cloud VM

AWS Free Tier (t2.micro), Google Cloud (e2-micro), or Oracle Cloud (always free).

### Option 4: Docker

```bash
docker run -it --name linux-bootcamp -v $(pwd):/course ubuntu:24.04 bash
```

### Environment Setup

After creating your environment, run:

```bash
bash shared/scripts/setup.sh
```

This installs essential and modern tools, configures aliases, and prepares the workspace.

## Quick Start

```bash
cd 01-foundations
cat README.md
```

## Learning Method

Each week follows a consistent pattern:

1. **Concepts** — Technical explanation with mental models
2. **Labs** — 2-4 hands-on exercises per week
3. **Scenario** — One real-world problem to solve
4. **Checkpoint** — Practical assessment, no multiple choice
5. **Project** — End-of-phase capstone

## Memory System

- Daily 5-10 minute recall tasks
- Spaced repetition: review on days 1, 3, 7, 14, 30
- Weekly scenario-based exams
- Monthly mastery tests

## Contact

- Repository: https://github.com/programmersd21/linux-mastery-bootcamp-2026
- Email: geniussantu1983@gmail.com

## License

MIT License. Free for personal, educational, and commercial use.
