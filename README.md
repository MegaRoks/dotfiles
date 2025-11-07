# My Dotfiles

Personal configuration files and scripts for productive terminal workflow.

## Installation
```bash
git clone git@personal.github.com:megaroks/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
source ~/.zshrc
```

The install script will:
- Create symbolic links:
  - `~/.zshrc` → `~/dotfiles/.zshrc`
  - `~/scripts` → `~/dotfiles/scripts`
- Backup existing files with timestamps
- Make all scripts executable

## Scripts

### Docker Management

#### docker-clean
Complete Docker cleanup: containers, images, volumes, and networks
```bash
docker-clean
```

#### docker-nuke
Remove ALL containers (including running ones) 💣
```bash
docker-nuke
```

#### docker-prune
Remove only stopped containers
```bash
docker-prune
```

### Git Utilities

#### gcp
Quick git commit and push
```bash
gcp "commit message"
# Equivalent to:
# git add .
# git commit -m "commit message"
# git push
```

### Port Management

#### port
Find process using a specific port
```bash
port 3000
# Shows process ID and details
```

#### killport
Kill process on a specific port
```bash
killport 3000
# Kills the process and shows confirmation
```

### File Utilities

#### extract
Extract any type of archive automatically
```bash
extract archive.zip
extract file.tar.gz
extract data.rar

# Supports: .tar.gz, .zip, .rar, .7z, .tar.bz2, and more
```

## Structure
```
dotfiles/
├── scripts/
│   ├── docker-clean      # Full Docker cleanup
│   ├── docker-nuke       # Remove all containers
│   ├── docker-prune      # Remove stopped containers
│   ├── gcp               # Git commit and push
│   ├── port              # Find process on port
│   ├── killport          # Kill process on port
│   └── extract           # Extract archives
├── .zshrc                # Shell configuration
├── install.sh            # Installation script
└── README.md
```

## Docker Scripts Comparison

| Script | What it removes | Running containers |
|--------|----------------|-------------------|
| `docker-clean` | Everything (containers + images + volumes + networks) | ✅ Stops and removes |
| `docker-nuke` | All containers | ✅ Stops and removes |
| `docker-prune` | Only stopped containers | ❌ Doesn't touch |

## Shell Configuration (.zshrc)

The `.zshrc` includes:

### Oh My Zsh
- **Theme:** robbyrussell
- **Plugins:** git, docker, docker-compose, nvm, npm, node, yarn, zsh-autosuggestions, zsh-syntax-highlighting

### NVM Integration
- Auto-switching Node.js versions based on `.nvmrc` files
- Automatic installation of missing versions

### Custom Aliases
- **Navigation:** `..`, `...`, `....`, `~`, `-`
- **General:** `c` (clear), `reload` (reload zshrc), `zshconfig` (edit config)
- **Utilities:** `myip`, `ports`, `sizeof`

### Features
- 10,000 command history
- Case-insensitive tab completion
- Colored man pages
- History sharing between sessions

## Quick Reference

### Daily Workflow
```bash
# Navigate and work
cd my-project              # NVM auto-switches Node version
npm install
gcp "Add new feature"      # Quick commit and push

# Docker cleanup
docker-nuke                # Remove all containers
docker-clean               # Full cleanup

# Port management
port 3000                  # Check what's using port
killport 3000              # Free up the port

# File extraction
extract downloads.zip      # Auto-detect and extract
```

### Common Commands
```bash
# From Oh My Zsh git plugin
gst                        # git status
gaa                        # git add .
gcmsg "message"            # git commit -m "message"
gp                         # git push
gl                         # git pull
gco branch                 # git checkout branch

# From Oh My Zsh docker plugin
dps                        # docker ps
di                         # docker images
dex container bash         # docker exec -it container bash

# From Oh My Zsh docker-compose plugin
dcup                       # docker compose up
dcupd                      # docker compose up -d
dcdn                       # docker compose down
dclf                       # docker compose logs -f
```

## Benefits

- ✅ Version control for shell configuration
- ✅ Easy sync between multiple machines
- ✅ Automatic backups before installation
- ✅ Modular script organization
- ✅ Single source of truth for settings
- ✅ All utilities accessible from anywhere

## Updating

To update dotfiles on your machine:
```bash
cd ~/dotfiles
git pull
./install.sh
source ~/.zshrc
```

## Uninstall

To remove the setup:
```bash
rm ~/.zshrc ~/scripts
# Restore from backup if needed
cp ~/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
```

## Adding New Scripts

1. Create script in `scripts/` directory
2. Make it executable: `chmod +x scripts/script-name`
3. Commit and push
4. Run `./install.sh` on other machines

## Requirements

- zsh
- Oh My Zsh
- git
- docker (for docker scripts)
- nvm (for Node.js version management)

