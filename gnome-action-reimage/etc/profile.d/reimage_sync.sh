#!/bin/bash

# Comando para sincronização do Action Script ReImage
comando="$(basename "$0")"

# LOG
LOG="/tmp/$comando.log"

# Caminho de origem
ORIGEM="/etc/skel/.local/share/nautilus/scripts/ReImage"
# Caminho de destino
DESTINO="$HOME/.local/share/nautilus/scripts/ReImage"

# Cria o diretório de destino, se não existir
mkdir -p "$DESTINO"

# Renomeia diretórios e arquivos antes de sincronizar
IDIOMAREI="reimage_lang_$(echo "$LANG" | cut -d'.' -f1 | cut -d'_' -f1)"
export IDIOMAREI



if [ -d "$ORIGEM" ]; then
    if command -v transname &> /dev/null; then
        if [ ! -f "$ORIGEM/$IDIOMAREI" ]; then
            sudo transname "$ORIGEM"/*
            sudo transname "$ORIGEM"/*/*
            sudo rm "$ORIGEM"/reimage_lang_*
            sudo touch "$ORIGEM/$IDIOMAREI"
        fi
    fi
        # Sincroniza arquivos e diretórios "REImage" ausentes em $HOME com /etc/skel
        rsync -auv --ignore-existing "$ORIGEM/" "$DESTINO" &>> "$LOG"
        chmod 1766 "$LOG"
fi






