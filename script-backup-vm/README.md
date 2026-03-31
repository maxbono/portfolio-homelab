# Script de backup automatisé vers le WD MyCloud Gen2 (Debian 12)

**Objectif du projet** :  
Automatiser la sauvegarde sécurisée et fiable d’un répertoire contenant des données sensibles (scripts et fichiers secrets) vers le serveur WD MyCloud Gen2 qui fait office de NAS dans mon homelab.

### Description du script
Le script effectue une sauvegarde incrémentielle avec `rsync` via SSH vers le serveur Debian 12 installé sur le WD MyCloud Gen2.  
Il inclut la création d’un dossier horodaté, la journalisation détaillée et une vérification du succès de l’opération.

### Fonctionnalités principales
- Utilisation de `rsync` avec les options `-avzP --delete` pour une synchronisation efficace et sécurisée
- Transfert chiffré via SSH
- Création automatique d’un dossier de backup horodaté (`backup_AAAA-MM-JJ`)
- Journalisation complète dans un fichier de log horodaté
- Gestion robuste des erreurs grâce à `set -euo pipefail`
- Vérification du code de retour pour confirmer le succès ou l’échec de la sauvegarde

### Variables principales
- `USER_SSH` : Utilisateur et IP du serveur cible (WD MyCloud)
- `BACKUP_DIR` : Chemin de destination horodaté sur le serveur distant
- `LOG_FILE` : Fichier de log local avec horodatage

### Utilisation

**Exécution manuelle** :
./backup-vm-ubuntu.sh

**Exécution automatique (cron)** :
Le script est prévu pour être exécuté périodiquement via cron. Cette automatisation peut etre fait de la manière suivante (avec une sortie dans les logs): `0 3 * * * /chemin/complet/vers/backup-vm-ubuntu.sh >> /var/log/backup.log 2>&1`

### Sécurité mise en place
-Transfert des données via SSH (chiffrement du trafic)
-Utilisation de clés SSH (recommandé) au lieu du mot de passe
- `--delete` pour supprimer les fichiers supprimés localement (synchronisation miroir)
-Logs détaillés pour audit et dépannage

### Améliorations futures possibles
-Ajout de notifications (email ou Telegram)
-Rotation des backups (conservation des X derniers jours)
-Compression des backups (tar + gzip)
-Vérification d’intégrité des fichiers après transfert (checksum)
-Backup de plusieurs répertoires

### Ce que j’ai appris
-Automatisation de tâches avec des scripts Bash
-Utilisation avancée de rsync pour des backups incrémentiels sécurisés
-Gestion des logs et vérification des codes de retour
-Configuration de tâches planifiées avec cron
-Bonnes pratiques de sécurité pour les transferts de données (SSH, clés SSH)
-Conception d’un backup fiable vers un serveur Linux distant

##Fichier du script : (script-backup-vm/scriptbackup)
