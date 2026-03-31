
# Configuration d’un LAN dédié sécurisé avec OPNsense

**Objectif du projet** :  
Créer un réseau virtuel isolé et sécurisé pour mon homelab afin de tester des configurations réseaux, appliquer des règles de firewall différenciées et mettre en pratique les principes de cybersécurité (segmentation, contrôle d’accès, monitoring).

### Architecture du réseau

**Environnement** :
- **Hyperviseur** : VirtualBox
- **Firewall / Routeur principal** : OPNsense (VM)
- **Machines virtuelles** : 2 × Ubuntu Server (VMs)
- **Machine physique** : WD MyCloud Gen2 (serveur Debian 12) connecté sur le réseau physique local

**Interfaces réseau OPNsense** :
- **NAT** : Interface pour l’accès à Internet (via la connexion hôte)
- **Host-only 1** : Interface dédiée à l’accès WebGUI d’OPNsense (administration isolée)
- **Host-only 2** : Interface dédiée à l’Ubuntu Server "permissive"
- **Host-only 3** : Interface dédiée à l’Ubuntu Server "restrictive"

### Schéma du réseau

<img width="965" height="778" alt="schema_reseau" src="https://github.com/user-attachments/assets/1d636b58-b621-40fc-85dc-1b013c93cde1" />

### Règles de firewall mises en place

J’ai configuré des règles firewall **différenciées** selon les besoins de chaque machine :

- **Ubuntu Server Permissive** :
  - Règles plus ouvertes (accès à certains services, ports autorisés, utilisation d'alias)
  - Trafic sortant généralement autorisé
<img width="2355" height="622" alt="opn_rules_perm" src="https://github.com/user-attachments/assets/ba89f9b4-7960-4672-8c68-9e6771740eb8" />



- **Ubuntu Server Restrictive** :
  - Règles très strictes (principe du moindre privilège)
  - Seuls les ports et protocoles nécessaires sont autorisés
  - Trafic sortant limité
<img width="2352" height="1008" alt="opn_rules_rest" src="https://github.com/user-attachments/assets/d7852b8e-d21b-4d77-ae9c-7a38fbdac9d7" />
<img width="1275" height="706" alt="opnsense_alias" src="https://github.com/user-attachments/assets/5aad279d-0773-4ae4-b9b0-a63e8df9d9eb" />



**Fonctionnalités OPNsense utilisées** :
- Firewall stateful (pf)
- Règles d’interface spécifiques (LAN1, LAN2, LAN3)
- Monitoring : Traffic graphs, States table, Logs firewall
- IDS

### Onglet "Overview" sur le webGUI de OPNsense

<img width="2871" height="1737" alt="opnsense_overview" src="https://github.com/user-attachments/assets/82d3800b-552e-472a-bf57-0497b7ed6879" />



### Sécurité sur le WD MyCloud Gen2 (machine physique)

Pour protéger le serveur physique exposé sur le réseau local :
- Installation et configuration de **UFW** (Uncomplicated Firewall) avec des règles restrictives
- Installation et configuration de **Fail2Ban** pour bloquer les tentatives d’authentification brute-force (SSH notamment)

### Ce que j’ai appris

- Conception et segmentation d’un réseau virtuel (host-only vs NAT)
- Configuration avancée de firewall avec OPNsense (règles par interface, stateful inspection)
- Application du principe de moindre privilège entre différentes machines
- Monitoring et visualisation du trafic réseau
- Hardening d’un serveur Linux physique (UFW + Fail2Ban)
- Différence entre réseau virtuel et réseau physique dans un homelab
- Importance de l’isolation administrative (interface dédiée pour le WebGUI)

### Améliorations futures possibles
- Mise en place de VLANs dans OPNsense
- Configuration d’un VPN (WireGuard ou OpenVPN)
- Ajout d’un SIEM léger ou de logs centralisés
- Tests d’attaque depuis Kali Linux

Ce projet m’a permis de mettre en pratique concrètement les bases des réseaux sécurisés et de la cybersécurité réseau.
