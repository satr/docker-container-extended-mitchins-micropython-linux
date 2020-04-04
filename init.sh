apt-get update && apt upgrade
apt-get install sudo net-tools ssh wget mc curl git python3-pip screen -y
pip3 install esptool rshell
echo "service ssh start" >> ~/.bashrc
mkdir /root/tmp && cd /root/tmp
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get install apt-transport-https -y
apt-get update -y
apt-get install code -y
rm -ri /root/tmp
adduser --disabled-password --gecos "" user1 && usermod -a -G sudo user1
ifconfig