# Lab 1.2: File Detective

Difficulty: Beginner. Time: 45 minutes. XP: +50.

## Objective

Create, move, copy, and organize a realistic project structure. Build a website project folder with proper organization.

## Starting State

Empty `~/projects` directory.

## Instructions

1. Create the project structure:
   ```bash
   mkdir -p ~/projects/my-website/{css,js,images,docs,backup}
   ```

2. Create sample files:
   ```bash
   cd ~/projects/my-website
   touch index.html about.html contact.html
   touch css/style.css css/responsive.css
   touch js/main.js js/utils.js
   touch images/logo.png images/hero.jpg images/favicon.ico
   echo "# My Website Project" > docs/README.md
   echo "## Setup Instructions" >> docs/README.md
   ```

3. Rename `js` to `scripts`:
   ```bash
   mkdir scripts
   mv js/* scripts/
   rmdir js
   ```

4. Create a backup:
   ```bash
   cp -r ~/projects/my-website ~/projects/my-website-backup
   ```

5. Organize images with wildcards:
   ```bash
   mkdir images/2024-01
   mv images/*.png images/2024-01/
   mv images/*.jpg images/2024-01/
   mv images/2024-01/favicon.ico images/
   find . -type f | sort > docs/file-manifest.txt
   ```

6. Create a trash directory for safe deletion:
   ```bash
   mkdir ~/trash
   mv ~/projects/my-website-backup ~/trash/
   ```

## Verification

Run `tree ~/projects/my-website` and verify:

```
my-website/
├── css/
│   ├── responsive.css
│   └── style.css
├── docs/
│   ├── file-manifest.txt
│   └── README.md
├── images/
│   ├── 2024-01/
│   │   ├── hero.jpg
│   │   └── logo.png
│   └── favicon.ico
├── scripts/
│   ├── main.js
│   └── utils.js
├── about.html
├── contact.html
└── index.html
```

## Failure Cases

| Problem | Cause | Solution |
|---------|-------|----------|
| No such file or directory | Wrong working directory | Use absolute paths or check `pwd` |
| Permission denied | File ownership issue | Files in home directory should be owned by you |
| Wildcard did not match | Case sensitivity | Linux is case-sensitive: `*.PNG` != `*.png` |

## What You Learned

- `mkdir -p` creates parent directories
- `touch` creates empty files
- `cp -r` copies directories recursively
- `mv` moves or renames
- `rmdir` removes empty directories only
- `rm -rf` removes anything permanently
- Wildcards (`*`, `?`) match multiple files
- `find` searches for files matching criteria

## Challenge

Write a script that takes a project name as input and creates the full directory structure automatically.

<details>
<summary>Solution</summary>

```bash
#!/bin/bash
PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: $0 <project-name>"
    exit 1
fi
mkdir -p ~/projects/$PROJECT_NAME/{src,docs,tests,assets}
touch ~/projects/$PROJECT_NAME/src/main.py
echo "# $PROJECT_NAME" > ~/projects/$PROJECT_NAME/docs/README.md
echo "Project $PROJECT_NAME created!"
```

</details>
