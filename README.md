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

## Webhook

When SMS comes, the service will send a JSON payload in following format to the specified WebHook URL.

```json
{
  "data": [
    {
      "class": "Class of message",
      "number": "Sender number",
      "text": "Message text",
      "reference": "Message Reference. If delivery status received, this variable contains TPMR of original message"
    }
  ]
}
```

## Installed files

- `~/.config/gammu-smsd`: Config and scripts
- `~/.log/gammu-smsd`
  - Log files: `gammu.log`, `smsd.log`
  - SMS Messages: `inbox/`, `outbox/`, `sent/`, `error/`
- `~/.config/systemd/user/gammu-smsd.service`: Systemd service unit

## Credit

https://github.com/realJoshByrnes/docker-gammu-kalkun
