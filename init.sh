apt-get update && apt upgrade

export LC_ALL=C.UTF-8 && export LANG=C.UTF-8

#Install extra applications and tools
apt-get install sudo net-tools ssh wget mc curl git python3-pip screen -y

#Install flash update tool and sync/repl tools
pip3 install esptool rshell adafruit-ampy

#Autostart ssh and show container IP address
echo "service ssh start" >> ~/.bashrc
echo "hostname -i" >> ~/.bashrc

#Install VisualStudioCode
mkdir /root/tmp && cd /root/tmp
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install apt-transport-https -y
apt-get update -y
apt-get install code -y
rm -ri /root/tmp

#Add user "mp" with password "micropython" to connect with it over ssh
useradd -m -p $(openssl passwd -1 micropython) -s /bin/bash --groups sudo mp
runuser -l mp -c 'yes "" | ssh-keygen -N "" >&- 2>&-'