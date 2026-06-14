# Phase 1: Foundations

Duration: 4 weeks. Goal: operational fluency in the Linux environment.

## Learning Goals

1. Navigate and manipulate the filesystem with precision
2. Understand process fundamentals and basic control
3. Master text processing pipelines
4. Configure user environments and permissions
5. Operate package managers and software installation
6. Establish SSH connectivity and remote workflow

## Exit Criteria

- Recover deleted files from trash mechanisms
- Pipe 5+ commands to extract specific data from logs
- Create, modify, and troubleshoot user accounts
- Install software and resolve dependency conflicts
- Connect to remote servers via SSH with key authentication

## Weekly Breakdown

### Week 1: Shell and Filesystem

**Core topics:**
- Shell interpretation order: alias, function, builtin, command, PATH
- Absolute vs relative path resolution
- File descriptors (stdin/stdout/stderr) and redirection
- Globbing, brace expansion, and quoting rules

**Mental model:** The shell is a translator. It takes human-readable commands, locates the appropriate executable, and hands control to the kernel. If PATH is incorrect, the shell cannot locate executables. If permissions are incorrect, the executable refuses to run.

**Labs:**
- Lab 1.1: Navigate the Maze
- Lab 1.2: File Detective
- Lab 1.3: The Cleanup Crew

**Real-world scenario:** Production server filesystem is full. Identify largest files, find log rotation failures, clear safely without deleting active logs, implement logrotate fix.

**Checkpoint:**
- Fix a broken PATH without rebooting
- Find all SUID binaries and explain security implications
- Explain why `rm -rf /` is blocked but `rm -rf /*` is not

---

### Week 2: Process Control and Monitoring

**Core topics:**
- Process lifecycle: fork, exec, wait, exit
- Signals: SIGTERM, SIGKILL, SIGSTOP, SIGHUP
- Job control: fg, bg, &, nohup, disown
- Process states: R, S, D, T, Z

**Mental model:** Every process has a parent. If the parent dies before calling wait(), init adopts the child. Zombie processes occupy process table entries until reaped. Uninterruptible sleep (D state) usually indicates I/O deadlock on network storage.

**Labs:**
- Lab 2.1: Pipeline Power
- Lab 2.2: Redirection Riddles
- Lab 2.3: Alias Arsenal

**Real-world scenario:** Runaway process consuming 100% CPU. Identify it without top or htop (using only /proc), send appropriate signal, verify cleanup, prevent recurrence with limits.

**Checkpoint:**
- Explain the difference between SIGTERM and SIGKILL
- Create a process that survives logout
- Debug why `kill -9` sometimes does not work immediately

---

### Week 3: Text Processing and Data Manipulation

**Core topics:**
- grep/egrep/fgrep patterns and performance
- sed stream editing: addresses, commands, hold space
- awk as a reporting language: BEGIN/END, patterns, actions
- Regular expressions: ERE vs BRE vs PCRE

**Mental model:** Text files are streams of records. grep filters records, sed modifies them, awk assembles reports. Greedy regexes can cause catastrophic backtracking. sed in-place editing without backup is dangerous. awk field separator assumptions often break on malformed input.

**Labs:**
- Lab 3.1: grep Gymnastics
- Lab 3.2: sed Surgery
- Lab 3.3: awk Awesomeness

**Real-world scenario:** Parse CSV export from cloud provider billing, extract compute costs by region, identify anomalies, generate summary report.

**Checkpoint:**
- Write an awk one-liner to sum column 3 when column 1 matches a pattern
- Explain the difference between `grep -P` and `grep -E`
- Debug a sed command that works on a test file but fails in production

---

### Week 4: Users, Permissions, and Environment

**Core topics:**
- UID/GID, /etc/passwd, /etc/shadow, /etc/group
- Permission bits: rwx, SUID, SGID, sticky
- ACLs and extended attributes
- Environment variables, shell profiles, systemd user sessions

**Mental model:** Every file operation checks: who are you (UID), what groups (GID), what permissions apply. SUID binaries run as the file owner, not the caller. World-writable directories without the sticky bit allow any user to delete any file.

**Labs:**
- Lab 4.1: Permission Puzzle
- Lab 4.2: SSH Fortress
- Lab 4.3: User Factory

**Real-world scenario:** New developer joins team. Create account, add to appropriate groups, set up sudo for specific commands only, configure SSH keys, audit after 30 days.

**Checkpoint:**
- Create a directory where team members can write but only the owner can delete
- Explain why `chmod 777` is never the correct solution and provide three alternatives
- Debug a scenario where a user is in a group but still gets permission denied

## Phase 1 Project: Personal Development Environment

Build a complete, personalized Linux development environment:

1. Create a dotfiles repository
2. Configure shell with useful aliases, custom prompt with git branch, color-coded ls output, history settings
3. Set up SSH key authentication to GitHub
4. Create a project structure under `~/projects`
5. Write a `setup.sh` script that recreates the environment on a new machine

**Deliverables:** GitHub repo with dotfiles, screenshot of terminal, working setup.sh script.

## Assessment

Before advancing to Phase 2, demonstrate:

- [ ] Navigate to any directory using absolute and relative paths
- [ ] Create a 5-command pipeline to process text data
- [ ] Explain why `chmod 777` is dangerous and provide alternatives
- [ ] Set up SSH key authentication and disable password login
- [ ] Write a bash alias that simplifies a complex command
- [ ] Use `grep` with regular expressions to find patterns
- [ ] Explain the difference between `>` and `>>`
- [ ] Create a user, add to a group, and set appropriate permissions

## Resources

- [Linux Command Line](https://linuxcommand.org/tlcl.php) — Free book
- [ExplainShell](https://explainshell.com/) — Command decomposition
- [OverTheWire: Bandit](https://overthewire.org/wargames/bandit/) — Command-line wargames
- [Linux Upskill Challenge](https://linuxupskillchallenge.org/) — Real sysadmin tasks

## Modern Tools

Install alongside classic commands:

```bash
sudo apt install bat eza ripgrep fd-find fzf btop
```

| Classic | Modern | Advantage |
|---------|--------|-----------|
| cat | bat | Syntax highlighting, git integration |
| ls | eza | Colors, icons, git status |
| grep | ripgrep | 10-100x faster, respects .gitignore |
| find | fd | Simpler syntax, .gitignore aware |
| top | btop | Better UI, mouse support |
| Ctrl+R | fzf | Interactive fuzzy search |
