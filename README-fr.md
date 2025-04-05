
# Inzoi Mods Manager

Un gestionnaire de mods pour le jeu Inzoi, développé avec Flutter pour la plateforme Windows.

## Fonctionnalités

- Gestion des mods pour Inzoi
- Support des formats de fichiers .pak, .ucas et .utoc
- Détection automatique des fichiers de mod associés
- Personnalisation de l'ordre de chargement des mods
- Interface bilingue (russe et anglais)
- Thèmes clair et sombre
- Renommage des mods dans l'interface
- Sauvegarde des paramètres entre les sessions
- Gestion des mods par glisser-déposer (drag-and-drop)

## Installation des Mods

Les mods sont installés à l'emplacement suivant : `{game}\BlueClient\Content\Paks\~mods`

## Utilisation

1. Lors du premier lancement, sélectionnez le dossier du jeu
2. Utilisez le bouton "+" pour ajouter des mods
3. Faites glisser les mods entre les colonnes ou utilisez les boutons "Activer"/"Désactiver"
4. Utilisez les boutons "Renommer" et "Supprimer" pour gérer les mods
5. Utilisez le bouton "Ordre de chargement" pour ajuster l'ordre de chargement des mods

## Compilation du projet

```bash
# Obtenir les dépendances
flutter pub get

# Lancer en mode debug
flutter run -d windows

# Compiler la version de production
flutter build windows
```

## Prérequis

- Flutter 3.0.0 ou version supérieure
- Windows 10 ou version supérieure
