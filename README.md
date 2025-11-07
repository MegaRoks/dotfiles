# My Dotfiles

Personal configuration files and scripts.

## Installation
```bash
git clone git@personal.github.com:megaroks/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
source ~/.zshrc
```

## Docker Scripts

### docker-clean
Complete Docker cleanup: containers, images, volumes, and networks
```bash
docker-clean
```

### docker-nuke
Remove ALL containers (including running ones) 💣
```bash
docker-nuke
```

### docker-prune
Remove only stopped containers
```bash
docker-prune
```

## Structure
```
dotfiles/
├── scripts/
│   ├── docker-clean
│   ├── docker-nuke
│   └── docker-prune
├── .zshrc
├── install.sh
└── README.md
```

## Scripts Comparison

| Script | What it removes | Running containers |
|--------|----------------|-------------------|
| `docker-clean` | Everything (containers + images + volumes + networks) | ✅ Stops and removes |
| `docker-nuke` | All containers | ✅ Stops and removes |
| `docker-prune` | Only stopped containers | ❌ Doesn't touch |

## Usage

After installation, you can use these commands from anywhere:
```bash
docker-clean   # Full Docker cleanup
docker-nuke    # Remove all containers
docker-prune   # Remove stopped containers only
```

