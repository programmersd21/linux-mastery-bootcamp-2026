# Lab 1.1: Navigate the Maze

Difficulty: Beginner. Time: 30 minutes. XP: +50.

## Objective

Find the secret message hidden in a complex directory structure. Practice navigation, listing files, and understanding hidden files.

## Starting State

A directory structure exists at `/tmp/maze`. Create it with:

```bash
mkdir -p /tmp/maze/{hallway1,hallway2,hallway3}/{room_a,room_b,room_c}/{drawer,closet,.secret}
touch /tmp/maze/hallway1/room_b/.secret/message.txt
echo "The next clue is in hallway3/room_a/closet/" > /tmp/maze/hallway1/room_b/.secret/message.txt
touch /tmp/maze/hallway3/room_a/closet/next_clue.txt
echo "The final answer is: LINUX_IS_AWESOME" > /tmp/maze/hallway3/room_a/closet/next_clue.txt
```

## Instructions

1. Navigate to `/tmp/maze` and list all contents including hidden files:
   ```bash
   cd /tmp/maze
   ls -la
   ```

2. Enter `hallway1`, then `room_b`. List hidden files:
   ```bash
   cd hallway1/room_b
   ls -la
   ```

3. Read the message in `.secret/message.txt`:
   ```bash
   cat .secret/message.txt
   ```

4. Follow the clue to `hallway3/room_a/closet/` and read the final message.

## Verification

The final message should read: `The final answer is: LINUX_IS_AWESOME`

## Failure Cases

| Problem | Cause | Solution |
|---------|-------|----------|
| No such file or directory | Wrong current directory | Check with `pwd`, use absolute paths |
| Permission denied | Insufficient permissions | Check with `ls -la`, use `sudo` if needed |
| Cannot find `.secret` | Forgot hidden files | Use `ls -la`, not `ls` |

## What You Learned

- `cd` changes directories; `cd ..` goes up; `cd /` goes to root
- `ls` lists files; `ls -la` shows hidden files and details
- `cat` displays file contents
- Hidden files start with `.`
- `pwd` shows current location
- Absolute paths work from any location

## Challenge

Find both messages using exactly two commands.

<details>
<summary>Solution</summary>

```bash
cat /tmp/maze/hallway1/room_b/.secret/message.txt
cat /tmp/maze/hallway3/room_a/closet/next_clue.txt
```

</details>
