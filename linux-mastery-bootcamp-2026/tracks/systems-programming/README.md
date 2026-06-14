# Track C: Systems Programming

Duration: 4 weeks. Certificate: Systems Programming Specialist.

## Skill Map

C Fundamentals -> System Calls -> Debugging -> Kernel Concepts
- Data types, memory management, compilation
- File I/O, process management, IPC/sockets
- strace, ltrace, gdb, perf
- eBPF, module development, driver concepts

## Weekly Breakdown

### Week 21: C for Systems

Build system information tool in C.

Topics: C data types, memory layout, pointers, compilation with gcc, static and dynamic linking, Make and CMake.

### Week 22: System Calls

Build file copy tool using only system calls.

Topics: open, read, write, close, fork, execve, wait, mmap, socket, bind, listen, accept, errno handling.

### Week 23: Debugging Mastery

Build debugging toolkit for production issues.

Topics: strace, ltrace, gdb, perf, bpftrace.

### Week 24: eBPF and Kernel

Build eBPF program for real-time system monitoring.

Topics: eBPF architecture, verifier, bpftrace, BCC, kernel module basics, /proc and /sys interfaces.

## Final Project: System Monitor

Requirements:
1. C application reading /proc and /sys for metrics
2. Raw syscalls without libc wrappers
3. eBPF program tracking process execution
4. JSON-formatted output
5. Under 1% CPU overhead
6. Architecture and API documentation

## Tool Stack

| Category | Tools |
|----------|-------|
| Compiler | gcc, clang, make, cmake |
| Debugger | gdb, lldb |
| Tracer | strace, ltrace, perf |
| eBPF | bpftrace, BCC, libbpf |
| Analysis | valgrind, AddressSanitizer |

## Career Path

Junior Systems Programmer -> Systems Programmer -> Senior Systems -> Kernel Developer -> Principal Engineer
$85K -> $115K -> $145K -> $175K -> $200K+
