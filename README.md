# Мои Dotfiles

Персональные конфигурационные файлы и скрипты.

## Установка
```bash
git clone https://github.com/ваш-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
source ~/.zshrc
```

## Скрипты

### docker-clean
Полная очистка Docker (контейнеры, образы, volumes, сети)
```bash
docker-clean
```

## Структура
```
dotfiles/
├── scripts/
│   └── docker-clean
├── .zshrc
├── install.sh
└── README.md
```
