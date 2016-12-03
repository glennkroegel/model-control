./dockerenv
sudo usermod -aG docker ubuntu
sudo docker build -t model-control .
cd ~/
git clone https://github.com/glennkroegel/tina.git
sudo apt-get install supervisor

