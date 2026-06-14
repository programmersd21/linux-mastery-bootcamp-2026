# Track D: Embedded Linux

Duration: 4 weeks. Certificate: Embedded Linux Specialist.

## Skill Map

Cross-Compilation -> Build Systems -> Hardware -> Real-Time
- Toolchains, sysroots, debugging
- Buildroot, Yocto, Bitbake
- Device tree, GPIO, I2C, SPI
- PREEMPT_RT, Xenomai, determinism

## Weekly Breakdown

### Week 21: Cross-Compilation

Build cross-compiled application for ARM.

Topics: Cross-compiler toolchains, sysroot, staging, QEMU emulation, static vs dynamic linking, gdbserver.

### Week 22: Build Systems

Build custom Linux image with Buildroot and Yocto.

Topics: Buildroot configuration, Yocto layers and recipes, Bitbake, custom packages, SDK generation.

### Week 23: Hardware Interaction

Build hardware control application for Raspberry Pi.

Topics: Device tree overlays, GPIO control, I2C and SPI, kernel driver basics, hardware debugging.

### Week 24: Real-Time Systems

Build real-time control application.

Topics: PREEMPT_RT patches, SCHED_FIFO, latency measurement, Xenomai, deterministic behavior.

## Final Project: Custom Embedded System

Requirements:
1. Under 100MB root filesystem
2. GPIO, I2C, or SPI application
3. Custom kernel config with PREEMPT_RT
4. Secure OTA update mechanism
5. Health checks and logging
6. Hardware interface specification

## Tool Stack

| Category | Tools |
|----------|-------|
| Build | Buildroot, Yocto, Bitbake |
| Cross-Compile | gcc-arm-linux-gnueabihf, crosstool-ng |
| Debug | gdb-multiarch, OpenOCD, JTAG |
| Flash | flashrom, dd, rpi-imager |
| Hardware | devmem2, i2c-tools, spidev |
| Emulation | QEMU, Docker |

## Career Path

Embedded Developer -> IoT Engineer -> Systems Architect -> Hardware-Software Integration Lead
$80K -> $110K -> $140K -> $170K+
