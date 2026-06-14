# Lab 5.1: LVM Magic

Difficulty: Intermediate. Time: 45 minutes. XP: +75.

## Objective

Extend a live filesystem without downtime using LVM. Add a new disk, create a volume group, and grow a filesystem while it is running.

## Starting State

A VM with one 20GB disk (`/dev/sda`) containing a 10GB logical volume, and a new 30GB disk (`/dev/sdb`) attached but unused.

## Instructions

1. Check current state:
   ```bash
   lsblk
   sudo lvs
   sudo vgs
   sudo pvs
   df -h
   ```

2. Create physical volume on the new disk:
   ```bash
   sudo pvcreate /dev/sdb
   sudo pvs
   ```

3. Extend the volume group:
   ```bash
   sudo vgextend vg0 /dev/sdb
   sudo vgs
   ```

4. Extend the logical volume by 20GB:
   ```bash
   sudo lvextend -L +20G /dev/vg0/lv_root
   sudo lvs
   ```

5. Grow the filesystem:
   ```bash
   # For ext4
   sudo resize2fs /dev/vg0/lv_root

   # For XFS
   # sudo xfs_growfs /
   ```

## Verification

```bash
sudo lvs          # LV shows increased size
df -h /           # Filesystem shows more space
uptime            # System still running
```

## Failure Cases

| Problem | Cause | Solution |
|---------|-------|----------|
| Device not found | Wrong disk name | Check `lsblk` |
| Insufficient free space | VG full | Check `vgs` |
| Filesystem already N blocks | Already correct size | Check `df` |
| resize2fs fails | Wrong filesystem type | Use `xfs_growfs` for XFS |

## What You Learned

- Physical Volume (PV): raw disk space usable by LVM
- Volume Group (VG): pool of PVs for allocation
- Logical Volume (LV): virtual partition for formatting and mounting
- Online resizing: LVM allows filesystem growth without unmounting

## Challenge

Create an LVM snapshot, make changes, then restore from the snapshot.

<details>
<summary>Solution</summary>

```bash
# Create snapshot (requires free space in VG)
sudo lvcreate -L 5G -s -n root_snap /dev/vg0/lv_root

# Make changes
sudo touch /important_file.txt

# Restore (requires unmounting; practice on test system)
sudo umount /
# Boot from live CD, then:
sudo lvconvert --merge /dev/vg0/root_snap
```

</details>
