#!/bin/bash

set -euo pipefail

#####BACKUP CIBLÉ LOCAL VERS WDMC2(DEBIAN)#####


#VARIABLES
DATE=$(date +"%Y-%m-%d_%H-%M")
LOG_FILE="/home/max/scripting/log/backup$(date +%Y-%m-%d_%H-%M).log"
USER_SSH="max@192.168.1.127"    #IP de mon WDMC Debian 12
BACKUP_DIR="/home/max/backups/backup_$(date +%Y-%m-%d)"

#CRÉATION DES FICHIERS LOG
echo "---------Début de sauvegarde----------" >> "$LOG_FILE"

#CRÉATION DU FICHIER DE DESTINATION
ssh -t "$USER_SSH" "mkdir -p /home/max/backups/backup_$(date +%Y-%m-%d)/" 
echo "$DATE: Dossier de backups créé." >> "$LOG_FILE"

#RSYNC

rsync -avzP --delete "/home/max/scripting/secret/" "$USER_SSH:$BACKUP_DIR" >> "$LOG_FILE" 2>&1

#VÉRIFICATION

if [ $? -eq 0 ]; then
	echo "$DATE: Sauvegarde réussie." >> "$LOG_FILE"
else
	echo "$DATE: Echec sauvegarde. Voir erreurs." >> "$LOG_FILE"
fi
