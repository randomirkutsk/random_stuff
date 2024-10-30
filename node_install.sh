#!/bin/bash

# Проверка и установка curl
if ! command -v curl &> /dev/null; then
    echo "Curl не установлен. Устанавливаю..."
    sudo apt update && sudo apt install -y curl
else
    echo "Curl уже установлен."
fi

# Установка Marzban
echo "Установка Marzban..."
sudo bash -c "$(curl -sL https://github.com/Gozargah/Marzban-scripts/raw/master/marzban-node.sh)" @ install

# Настройка UFW
echo "Настройка брандмауэра UFW..."
sudo ufw --force enable
sudo ufw default deny incoming
sudo ufw allow 40000
sudo ufw allow 10050
sudo ufw allow 443/tcp
sudo ufw allow 22
sudo ufw allow 62050
sudo ufw allow 62051
sudo ufw allow 80
sudo ufw allow 2488
sudo ufw allow 9100
sudo ufw allow 2488/tcp

# Установка Warp
echo "Установка Warp..."
cd ~
bash <(curl -fsSL git.io/warp.sh) proxy

echo "Скрипт выполнен."
