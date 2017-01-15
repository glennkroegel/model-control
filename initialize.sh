./dockerenv
usermod -aG docker ubuntu
docker build -t model-control .
cd ~/
git clone https://github.com/glennkroegel/tina.git ../tina/
apt-get -y install supervisor

