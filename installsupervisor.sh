ARCH=$(uname -m | sed 's/armv\([0-9]\+\).*/armv\1/' | tr -d '\r')

rm -rf /tmp/hasupervisor
mkdir /tmp/hasupervisor

apt update
apt install apparmor bluez cifs-utils curl dbus jq libglib2.0-bin lsb-release network-manager nfs-common systemd-journal-remote systemd-resolved udisks2 wget -y

# Install os-agent
AGENT_VER=$(curl -ILv https://github.com/home-assistant/os-agent/releases/latest 2>&1 | grep -i '^Location:' | sed -r 's#.*/tag/##' | tr -d '\r')

wget -P /tmp/hasupervisor https://github.com/home-assistant/os-agent/releases/latest/download/os-agent_${AGENT_VER}_linux_${ARCH}.deb
apt install /tmp/hasupervisor/os-agent_${AGENT_VER}_linux_${ARCH}.deb

# Install docker
curl -fsSL get.docker.com | sh

# Install supervisor
wget -O /tmp/hasupervisor/homeassistant-supervised.deb https://github.com/home-assistant/supervised-installer/releases/latest/download/homeassistant-supervised.deb
BYPASS_OS_CHECK=true apt install /tmp/hasupervisor/homeassistant-supervised.deb

# Clean cache
rm -rf /tmp/hasupervisor