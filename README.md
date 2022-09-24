# Docker for macos ryzen ( hackintosh / ryzentosh )

This project makes `docker CLI` use a `docker` installed in a Virtual Machine created in Virtualbox;

## Requirements
- Docker CLI
- Vagrant 
- VirtualBox

## How it works

1. Install VirtualBox

```
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
```

2. Install Vagrant and the vbguest plugin to manage VirtualBox Guest Additions on the VM
```
brew install vagrant
vagrant plugin install vagrant-vbguest
```

3. Install Docker CLI
```
brew install docker
brew install docker-compose
```

4. Download this project;

5. Start the vm 
```
vagrant up
```

6. Save IP to a hostname
```
echo "192.168.59.100 docker.vm" | sudo tee -a /etc/hosts > /dev/null
```

7. Tell Docker CLI to talk to the VM
```
export DOCKER_HOST=http://docker.vm:2375
```
`
You can put the command above in your ".bash_profile" so you don't need to repeat everytime`

8. Test
```
docker run hello-world
```