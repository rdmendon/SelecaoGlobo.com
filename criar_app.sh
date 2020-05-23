#!/bin/bash
#preparando a maquina
sudo yum update
sudo yum install -y docker
sudo pip install --upgrade pip
sudo pip install -U Flask
sudo pip install gunicorn
sudo pip install -U itsdangerous
sudo pip install -U Jinja2
sudo pip install -U MarkupSafe
sudo pip install -U Werkzeug

#baixando app
sudo yum install git -y
git clone https://github.com/SelecaoGlobocom/richard-mendonca

#Criando container
cd richard-mendonca/app
nohup gunicorn --log-level debug api:app &