# Customisation du WD MyCloud Gen2 en serveur Debian 12

**Objectif du projet** :  
Transformer un NAS WD MyCloud Gen2 (hardware ARM limité) en vrai serveur Linux complet, avec kernel mainline et Debian 12, pour l’utiliser dans mon homelab.

**Technologies et outils utilisés** :
- Repo de référence : [Heisath/wdmc2-kernel](https://github.com/Heisath/wdmc2-kernel)
- Architecture : Marvell Armada 375 (ARM)
- Kernel : Mainline Linux (compilé avec le device tree spécifique `armada-375-wdmc-gen2.dts`)
- Système : Debian 12 (rootfs créé avec debootstrap)
- Outils : build.sh du repo, mkimage pour uImage, cross-compilation ARM

### Étapes réalisées
1. Clonage du repository et installation des dépendances sur une machine Ubuntu.
2. Exécution du script `./build.sh` pour compiler le kernel et générer le rootfs Debian 12.
<img width="1286" height="846" alt="wdmcscrpt1" src="https://github.com/user-attachments/assets/b1860cc9-22fa-476b-90d5-5e5d78652bd5" />
<img width="1286" height="845" alt="wdmcscript4" src="https://github.com/user-attachments/assets/8d8e0998-c220-4fb4-9902-6458a9d30e8f" />


   
3. Création d’un uImage + uRamdisk.
4. Formatage et partitions avec l'outil `parted`. 
5. Installation sur le WD MyCloud (Je l'ai fais directement sur le disque interne avec un adaptateur SATA-USB mais fonctionne aussi en boot USB).

### Problème rencontré et solution apportée
Au premier boot, j’obtenais une **LED rouge et/ou jaune** (indiquant un échec de boot).  
Après recherches sur les forums (Doozan, WD Community) et analyse du comportement de l’u-boot du Gen2, j’ai identifié que le problème venait de la **position physique des partitions** sur le disque dur : le rootfs (`sda3`) devait être relativement proche du début du disque pour que l’u-boot le charge correctement.

**Solution mise en œuvre** :  
J’ai repartitionné le disque HDD du WD MyCloud (en faisant attention à ne pas perdre de données inutiles) :

- `sda1` : swap → 500 Mo
- `sda2` : petite partition data → 500 Mo
- `sda3` : root (Debian 12) → 30 Go
- `sda4` : grosse partition data → ~3,5 To (anciennement `sda2` de 3,6 To)

<img width="1230" height="421" alt="wdmc_infosys" src="https://github.com/user-attachments/assets/897726eb-79b5-4069-8616-eb75003a3b62" />



Cette reconfiguration a permis de rapprocher la partition root (`sda3`) et de résoudre le problème de boot.

### Ce que j’ai appris
- Fonctionnement de l’u-boot sur hardware embarqué (ordre de recherche des partitions : USB → sda3)
- Importance de la disposition physique des partitions sur les anciens appareils (limites du bootloader)
- Cross-compilation et intégration du Device Tree (DTS)
- Création et personnalisation d’un rootfs Debian minimal
- Diagnostic de problèmes de boot via LEDs et recherches communautaires
- Hardening et configuration de base d’un serveur sur hardware contraint (ssh + ufw + Fail2Ban)

**Liens utiles** :
- Repository source : https://github.com/Heisath/wdmc2-kernel

Ce projet m’a permis de monter en compétences sur les systèmes embarqués, le boot Linux et la résolution de problèmes hardware/logiciel.
