# Install Docker
apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Configure Docker to listen on a TCP socket
mkdir /etc/systemd/system/docker.service.d
echo \
'[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --containerd=/run/containerd/containerd.sock' | tee /etc/systemd/system/docker.service.d/docker.conf > /dev/null
echo \
'{
  "hosts": ["fd://", "tcp://0.0.0.0:2375"]
}' | tee /etc/docker/daemon.json > /dev/null
systemctl daemon-reload
systemctl restart docker.service
