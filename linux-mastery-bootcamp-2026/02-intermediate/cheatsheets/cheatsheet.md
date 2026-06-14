# Phase 2: Intermediate Systems Cheatsheet

## LVM

| Command | Description |
|---------|-------------|
| pvcreate /dev/sdb | Create physical volume |
| vgcreate vg0 /dev/sdb | Create volume group |
| lvcreate -L 10G -n lv0 vg0 | Create 10GB logical volume |
| lvextend -L +5G /dev/vg0/lv0 | Extend LV by 5GB |
| lvreduce -L 5G /dev/vg0/lv0 | Shrink LV to 5GB |
| pvmove /dev/sdb | Move data off physical volume |
| lvs, vgs, pvs | Status overview |
| lvdisplay, vgdisplay, pvdisplay | Detailed information |
| lvcreate -L 5G -s -n snap /dev/vg0/lv0 | Create snapshot |
| lvconvert --merge /dev/vg0/snap | Restore from snapshot |

## Filesystems

| Command | Description |
|---------|-------------|
| mkfs.ext4 /dev/sda1 | Format as ext4 |
| mkfs.xfs /dev/sda1 | Format as XFS |
| fsck -y /dev/sda1 | Check and repair ext4 |
| xfs_repair /dev/sda1 | Repair XFS |
| mount -o remount,rw / | Remount read-write |
| tune2fs -l /dev/sda1 | Show ext4 parameters |
| resize2fs /dev/vg0/lv0 | Grow ext4 filesystem |
| xfs_growfs /mountpoint | Grow XFS filesystem |
| blkid | Show UUIDs and filesystem types |
| lsblk -f | Show block devices with filesystems |
| findmnt | Show mounted filesystems |

## Networking

| Command | Description |
|---------|-------------|
| ip addr show | Show IP addresses |
| ip route show | Show routing table |
| ip link show | Show network interfaces |
| ss -tlnp | Show listening TCP sockets with processes |
| ss -s | Socket statistics |
| nc -zv host port | Test port connectivity |
| ping -c 3 host | Test ICMP connectivity |
| traceroute host | Trace network path |
| mtr host | Combined ping and traceroute |
| iptables -L -n -v | List firewall rules |
| nft list ruleset | List nftables rules |
| dig +short @server example.com A | DNS query |
| host example.com | Simple DNS lookup |
| nslookup example.com | DNS lookup (legacy) |

## systemd

| Command | Description |
|---------|-------------|
| systemctl start service | Start service |
| systemctl stop service | Stop service |
| systemctl restart service | Restart service |
| systemctl status service | Show service status |
| systemctl enable service | Enable at boot |
| systemctl disable service | Disable at boot |
| journalctl -u service -f | Follow service logs |
| journalctl -u service -n 100 | Last 100 log lines |
| journalctl --since "1 hour ago" | Logs from last hour |
| systemd-analyze blame | Boot time per service |
| systemd-analyze critical-chain | Critical boot path |
| systemctl edit --full service | Edit unit file |
| systemctl daemon-reload | Reload configuration |
| systemctl list-timers | Show active timers |

## Kernel and Hardware

| Command | Description |
|---------|-------------|
| lsmod | List loaded modules |
| modprobe module | Load module with dependencies |
| insmod module.ko | Load module (no dependency resolution) |
| rmmod module | Remove module |
| modinfo module | Show module information |
| depmod | Generate modules.dep |
| dkms | Dynamic kernel module support |
| sysctl -w key=value | Set kernel parameter |
| sysctl -p | Load sysctl.conf |
| /etc/sysctl.d/*.conf | Persistent kernel parameters |
| /proc/sys | Runtime kernel parameters |
| /sys/class | Hardware device information |
| lspci -v | PCI devices |
| lsusb -t | USB devices (tree view) |
| lscpu | CPU information |
| lsblk | Block devices |
| fdisk -l | Partition tables |
| smartctl -a /dev/sda | SMART disk health |
| dmesg -w | Follow kernel messages |
| udevadm monitor | Monitor udev events |
| hwinfo | Hardware information |
| dmidecode | DMI/BIOS information |
| ethtool eth0 | Network interface settings |

## Boot and Recovery

| Command | Description |
|---------|-------------|
| systemctl rescue | Enter rescue mode |
| systemctl emergency | Enter emergency mode |
| journalctl -xb | Boot messages |
| update-grub | Update GRUB configuration |
| grub-install /dev/sda | Install GRUB bootloader |
| fsck from live USB | Repair unmounted filesystem |
| chroot /mnt/rescue | Change root to mounted system |

## Gotchas

- LVM snapshots need space in the volume group; 100% full snapshot = corrupted
- `xfs_growfs` requires a mounted filesystem; `resize2fs` requires unmounting to shrink
- systemd timer `OnCalendar=*-*-* 02:00:00` uses its own syntax, not cron syntax
- `modprobe` uses `/lib/modules/$(uname -r)/modules.dep` for dependency resolution
- journalctl persistent logs require configuration in `/etc/systemd/journald.conf`
- Always backup before running `fsck` or `xfs_repair`
