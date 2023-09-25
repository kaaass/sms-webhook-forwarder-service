# sms-webhook-forwarder-service

Systemd unit (user level) for forwarding SMS message to WebHook using gammu-smsd

## Usage

```shell
# Install service files and configs
./install.sh <port> <webhook url>
# e.g.,
./install.sh /dev/ttyUSB0 https://example.com/webhook
# Enable and start the service
systemctl --user enable --now gammu-smsd.service
```

## Installed files

- `~/.config/gammu-smsd`: Config and scripts
- `~/.log/gammu-smsd`
  - Log files: `gammu.log`, `smsd.log`
  - SMS Messages: `inbox/`, `outbox/`, `sent/`, `error/`
- `~/.config/systemd/user/gammu-smsd.service`: Systemd service unit

## Credit

https://github.com/realJoshByrnes/docker-gammu-kalkun
>>>>>>> 9531299 (Init)
