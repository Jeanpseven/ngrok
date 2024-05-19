#!/bin/bash

# Função para instalar ngrok
install_ngrok() {
  echo "Instalando ngrok..."
  curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
    | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
    && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
    | sudo tee /etc/apt/sources.list.d/ngrok.list \
    && sudo apt update \
    && sudo apt install ngrok
  echo "Ngrok instalado com sucesso!"
}

# Função para configurar authtoken
configure_authtoken() {
  echo "Digite o seu authtoken ngrok:"
  read -r authtoken
  echo "Configurando authtoken..."
  echo "authtoken: $authtoken" | sudo tee /etc/ngrok/ngrok.yml
  echo "Authtoken configurado com sucesso!"
}

# Menu de opções
echo "Ngrok Installer e Configurador"
echo "---------------------------"
echo "1. Instalar ngrok"
echo "2. Configurar authtoken"
echo "3. Sair"

read -r opcao

case $opcao in
  1) install_ngrok ;;
  2) configure_authtoken ;;
  3) exit ;;
  *) echo "Opção inválida. Tente novamente." ;;
esac
