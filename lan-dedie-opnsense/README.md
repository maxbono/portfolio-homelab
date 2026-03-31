
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

<img width="965" height="778" alt="schema_reseau" src="https://github.com/user-attachments/assets/601c5626-55d0-4094-9877-bd9ee824d4e7" />

### Règles de firewall mises en place

J’ai configuré des règles firewall **différenciées** selon les besoins de chaque machine :

- **Ubuntu Server Permissive** :
  - Règles plus ouvertes (accès à certains services, ports autorisés, utilisation d'alias)
  - Trafic sortant généralement autorisé
<img width="2355" height="622" alt="opn_rules_perm" src="https://github.com/user-attachments/assets/50efe2b5-89d1-4286-ba10-b73037cca8b8" />


- **Ubuntu Server Restrictive** :
  - Règles très strictes (principe du moindre privilège)
  - Seuls les ports et protocoles nécessaires sont autorisés
  - Trafic sortant limité
     <img width="2352" height="1008" alt="opn_rules_rest" src="https://github.com/user-attachments/assets/7483d9b6-e063-4785-bf6e-46d832dfbc09" />
<img width="1275" height="706" alt="opnsense_alias" src="https://github.com/user-attachments/assets/8f3327d8-4149-4927-8cd1-e5b78bce77e1" />


**Fonctionnalités OPNsense utilisées** :
- Firewall stateful (pf)
- Règles d’interface spécifiques (LAN1, LAN2, LAN3)
- Monitoring : Traffic graphs, States table, Logs firewall
- IDS

### Onglet "Overview" sur le webGUI de OPNsense

<img width="2871" height="1737" alt="opnsense_overview" src="https://github.com/user-attachments/assets/f1765b3a-6350-4754-87e3-ede7fd0343ec" />


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
