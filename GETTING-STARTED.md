# Getting Started

## Environment Setup

### Virtual Machine

1. Download VirtualBox from https://www.virtualbox.org/
2. Download Ubuntu Server 24.04 ISO
3. Create VM: 2 CPU, 4GB RAM, 20GB disk, bridged network
4. Install Ubuntu Server (minimal)
5. Run: `bash shared/scripts/setup.sh`

### WSL2 (Windows)

```powershell
wsl --install
```

Reboot. Open Ubuntu. Run: `bash shared/scripts/setup.sh`

### Cloud VM

1. Create account with AWS, GCP, or Oracle Cloud
2. Launch Ubuntu 24.04 instance
3. Allow SSH (port 22) in security group
4. Connect: `ssh -i key.pem ubuntu@ip`
5. Run: `bash shared/scripts/setup.sh`

### Docker

```bash
docker run -it --name linux-bootcamp -v $(pwd):/course ubuntu:24.04 bash
apt update && apt install -y vim nano curl wget git
```

## First Steps

```bash
cd 01-foundations
cat README.md
```

## Learning Tips

- Type every command manually. Do not copy-paste.
- Break things intentionally. Fix them to learn.
- Explain concepts aloud or in writing to test understanding.
- Review previous material on days 1, 3, 7, 14, 30.
- Complete every lab before moving to the next week.

## Common Issues

**Permission denied**
```bash
sudo command
ls -la file   # check permissions
```

**Command not found**
```bash
sudo apt install package
which command   # check PATH
```

**Connection refused**
```bash
sudo systemctl status service
sudo ufw status
```
