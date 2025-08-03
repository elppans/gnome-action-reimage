#!/bin/bash

# Comando para sincronização do Action Script ReImage
comando="$(basename "$0")"

# LOG
LOG="/tmp/$comando.log"

# Caminho de origem
ORIGEM="/usr/share/ReImage"
# Caminho de destino
DESTINO="$HOME/.local/share/nautilus/scripts/ReImage"

# Cria o diretório de destino, se não existir
mkdir -p "$DESTINO"

if [ -d "$ORIGEM" ]; then
        # Sincroniza arquivos e diretórios "REImage" ausentes em $HOME com /etc/skel
        rsync -auv --ignore-existing "$ORIGEM/" "$DESTINO" &>> "$LOG"
        chmod 1766 "$LOG"
fi






