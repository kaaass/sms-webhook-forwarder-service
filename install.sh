#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Usage: $0 <port> <webhook url>"
    exit 1
fi

mkdir -p ~/.config/gammu-smsd \
    ~/.log/gammu-smsd \
    ~/.log/gammu-smsd/inbox \
    ~/.log/gammu-smsd/outbox \
    ~/.log/gammu-smsd/sent \
    ~/.log/gammu-smsd/error

cp ./gammurc ~/.config/gammu-smsd
cp ./hook-send-message.sh ~/.config/gammu-smsd
sed -i "s|\$PORT|$1|g" ~/.config/gammu-smsd/gammurc
sed -i "s|\$HOME|$HOME|g" ~/.config/gammu-smsd/gammurc
echo "WEBHOOK_URL=$2" >> ~/.config/gammu-smsd/environment

mkdir -p ~/.config/systemd/user/
cp ./gammu-smsd.service ~/.config/systemd/user/gammu-smsd.service

echo "Enable service by: systemctl --user enable --now gammu-smsd.service"
