echo "enabling DOH"

sudo systemctl disable systemd-resolved.service &&
  sudo systemctl stop systemd-resolved.service &&
  sudo systemctl enable dnscrypt-proxy.service &&
  sudo systemctl start dnscrypt-proxy.service

