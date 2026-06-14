# Phase 2: Intermediate Systems

Duration: 5 weeks. Goal: system-level understanding and troubleshooting.

## Learning Goals

1. Master storage management (LVM, partitions, filesystems)
2. Understand networking stack configuration and diagnosis
3. Manage services with systemd
4. Implement basic networking services (DNS, DHCP, NFS)
5. Configure kernel parameters and modules
6. Build systems from base installation

## Exit Criteria

- Resize logical volumes without unmounting
- Diagnose network issues using only /proc and /sys
- Write systemd unit files from scratch
- Configure a server as NFS client and server
- Compile and load a kernel module

## Weekly Breakdown

### Week 5: Storage and Filesystems

**Core topics:**
- Partition tables: GPT vs MBR, fdisk/gdisk/parted
- LVM: PV, VG, LV, snapshots, thin provisioning
- Filesystems: ext4, XFS, btrfs
- Mount options, /etc/fstab, systemd mounts

**Mental model:** Storage is a stack of abstraction layers. Physical disks provide raw capacity. Partitions divide that capacity. LVM adds flexibility by pooling physical volumes into volume groups and allocating logical volumes dynamically. Filesystems organize data within logical volumes.

**Failure modes:**
- LVM snapshot overflow when the snapshot volume fills
- Filesystem corruption on unclean shutdown
- Wrong mount options causing performance issues or data loss

**Labs:**
- Lab 5.1: LVM Magic
- Lab 5.2: Filesystem Recovery
- Lab 5.3: Snapshot Rescue

**Real-world scenario:** Database server running out of space. Add new disk, extend LVM, resize filesystem online, verify database still running, confirm no performance impact.

**Checkpoint:**
- Create LVM snapshot, modify data, restore from snapshot
- Explain the difference between `fsck` and `xfs_repair` and when each is safe
- Debug why `mount -a` fails after editing fstab

---

### Week 6: Networking Deep Dive

**Core topics:**
- TCP/IP stack in Linux: socket, bind, listen, accept
- Network interfaces, bridges, VLANs, bonding
- Routing tables, policy routing
- iptables/nftables basics
- DNS resolution, /etc/resolv.conf, systemd-resolved

**Mental model:** Every packet has a source and destination. Routing decides the direction. Filtering decides admission. Asymmetric routing, MTU mismatches, conntrack table exhaustion, and DNS caching issues are common failure modes.

**Labs:**
- Lab 6.1: Network Detective
- Lab 6.2: Firewall Fortress
- Lab 6.3: DNS Deep Dive

**Real-world scenario:** Multi-homed server with public and private interfaces. Configure policy routing so management traffic uses the private interface, public traffic uses the public interface, with no cross-traffic.

**Checkpoint:**
- Explain every field in `ip route show` output
- Debug a scenario where `ping` works but `curl` fails
- Configure a network namespace with isolated networking stack

---

### Week 7: systemd and Service Management

**Core topics:**
- systemd architecture: units, targets, dependencies
- Unit types: service, timer, socket, path, target, mount
- journald logging, log persistence, remote logging
- systemd-analyze for boot optimization

**Mental model:** systemd resolves a dependency graph and parallelizes startup where possible. Circular dependencies, timeouts on slow services, resource limits killing processes, and journal corruption are common failure modes.

**Labs:**
- Lab 7.1: Custom Service
- Lab 7.2: Timer Mastery
- Lab 7.3: Boot Rescue

**Real-world scenario:** Deploy new microservice. Create systemd unit, configure resource limits (CPU/memory), set up log rotation, enable auto-start, monitor with `systemctl status`.

**Checkpoint:**
- Write a timer unit that runs daily at 2 AM with 30-minute randomization
- Explain `Type=forking` vs `Type=simple` vs `Type=notify` with use cases
- Debug why `systemctl start` hangs and how to fix it

---

### Week 8: Kernel and Hardware

**Core topics:**
- Kernel modules: lsmod, modprobe, insmod, rmmod
- /proc/sys, sysctl, persistent configuration
- udev rules for device management
- dmesg analysis and hardware troubleshooting

**Mental model:** The kernel is the only software that runs in privileged mode. Everything else requests resources through system calls. Module version mismatch, missing firmware, IRQ conflicts, and OOM killer invocation are common failure modes.

**Labs:**
- Lab 8.1: Module Madness
- Lab 8.2: sysctl Tuning
- Lab 8.3: udev Rules

**Real-world scenario:** New hardware (NIC) not recognized. Check dmesg for firmware errors, identify needed firmware package, install, verify with `lspci -k`, benchmark with `iperf`.

**Checkpoint:**
- Explain what happens when `modprobe` fails with "Unknown symbol in module"
- Configure udev rule to assign consistent name to USB serial device
- Debug OOM killer logs and identify which process to optimize

---

### Week 9: Server Build from Scratch

**Core topics:**
- Base OS installation (minimal)
- Post-installation hardening
- Essential service configuration
- Backup and recovery planning

**Labs:**
- Lab 9.1: From ISO to OS
- Lab 9.2: Hardening 101
- Lab 9.3: Disaster Recovery

**Real-world scenario:** Build staging environment that mirrors production. Document every step, automate with script, test restore procedure, validate with application team.

**Checkpoint:**
- Build server that passes CIS benchmark Level 1
- Create automated backup script with error handling and notification
- Perform full restore and verify in under 30 minutes

## Phase 2 Project: Production Server Setup

Build a production-ready web server from a minimal ISO:

1. Install minimal Linux (Ubuntu Server or AlmaLinux)
2. Configure LVM with separate volumes for /, /var, /home
3. Set up networking with static IP
4. Configure SSH with key auth only
5. Install and configure nginx
6. Set up firewall (ufw or nftables)
7. Configure automatic security updates
8. Create a backup script
9. Document everything in a runbook

**Deliverables:** Server IP accessible via browser, GitHub repo with runbook and scripts, `systemctl status nginx` showing active.

## Assessment

Before advancing to Phase 3, demonstrate:

- [ ] Extend LVM volume and filesystem online without service interruption
- [ ] Diagnose network issue using only `/proc/net/` and `ip` command
- [ ] Write systemd service unit with proper dependencies and restart policy
- [ ] Compile and load kernel module, view output in dmesg
- [ ] Build server from ISO to production in under 2 hours
- [ ] Configure firewall allowing only necessary ports
- [ ] Set up automatic backups with rotation
- [ ] Document procedures in a clear runbook

## Resources

- [Linux Storage Stack Diagram](https://www.thomas-krenn.com/en/wiki/Linux_Storage_Stack_Diagram)
- [systemd for Administrators](https://www.freedesktop.org/wiki/Software/systemd/)
- [Linux Kernel Documentation](https://www.kernel.org/doc/html/latest/)
