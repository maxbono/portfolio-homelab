# Mon Homelab Portfolio – Compétences en Informatique

**Autodidacte** | Systèmes Linux • Réseaux • Hardware • Cybersécurité

J’ai construit de A à Z un environnement homelab complet pour acquérir et démontrer mes compétences en systèmes d’exploitation, réseaux, hardware et principes de cybersécurité.

### Architecture globale de mon homelab

- **Hôte principal** : PC sous Debian 13
- **NAS / Serveur custom** : WD MyCloud Gen2 transformé en serveur Debian 12 (kernel custom)
- **Firewall / Routeur** : VM OPNsense sous VirtualBox
- **Serveurs** : 2 × VM Ubuntu Server + 1 × VM Kali Linux
- **Réseau** : LAN dédié virtuel isolé et sécurisé

### Projets techniques documentés

1. **[Customisation du WD MyCloud Gen2](wd-mycloud-gen2-custom)**  
   Transformation d’un NAS hardware limité en serveur Linux complet : compilation et installation d’un kernel mainline custom, résolution d’un problème de boot par repartitionnement intelligent du disque (sda1 swap, sda2 data, sda3 root, sda4 data).

2. **[Configuration d’un LAN dédié sécurisé avec OPNsense](lan-dedie-opnsense)**  
   Mise en place d’un réseau virtuel avec firewall OPNsense, règles différenciées (permissive vs restrictive), interfaces host-only, monitoring et hardening du serveur physique (UFW + Fail2Ban sur le WD MyCloud).

3. **[Script de backup automatisé vers le WD MyCloud](script-backup-vm)**  
   Script Bash robuste utilisant `rsync` via SSH avec journalisation, gestion d’erreurs et vérification du succès. Sauvegarde incrémentielle d’un répertoire sensible vers le serveur Debian distant.

### Compétences techniques mises en pratique

**Systèmes & Hardware**  
- Debian 12 / 13, Ubuntu Server, Kali Linux  
- Transformation et customisation de hardware embarqué (WD MyCloud Gen2)

**Réseaux & Sécurité**  
- Configuration firewall avancée avec OPNsense (règles stateful, interfaces multiples)  
- Segmentation réseau et principe du moindre privilège  
- Hardening Linux (UFW, Fail2Ban)  
- Monitoring réseau et logs

**Automatisation & Scripting**  
- Bash scripting (gestion d’erreurs, logs, rsync, SSH)  
- Planification de tâches avec cron  
- Backups sécurisés et incrémentiels

**Outils & Environnements**  
- VirtualBox (réseaux virtuels : NAT + Host-only)  
- SSH, rsync, GitHub

### Objectif de ce portfolio

Ce repository regroupe toutes les preuves concrètes de mes compétences : configurations, scripts, captures d’écran, schémas et explications détaillées.  
Il permet d’évaluer objectivement mon niveau technique sans diplôme formel ni expérience professionnelle.
