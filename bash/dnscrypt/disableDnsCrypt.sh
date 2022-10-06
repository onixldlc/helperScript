echo "disabling DOH"

sudo systemctl disable dnscrypt-proxy.service &&
  sudo systemctl stop dnscrypt-proxy.service &&
  sudo systemctl enable systemd-resolved.service &&
  sudo systemctl start systemd-resolved.service
