#!/bin/bash

# Comando para sincronização do Action Script ReImage
comando="$(basename $0)"

# LOG
LOG="/tmp/$comando.log"

# Caminho de origem
ORIGEM="/etc/skel/.local/share/nautilus/scripts/ReImage/"
# Caminho de destino
DESTINO="$HOME/.local/share/nautilus/scripts/ReImage"

# Cria o diretório de destino, se não existir
mkdir -p "$DESTINO"

# Sincroniza arquivos e diretórios ausentes do /etc/skel
rsync -auv --ignore-existing "$ORIGEM" "$DESTINO" &>> "$LOG"



