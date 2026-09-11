# Base de données tifosi

Projet de base de données MySQL pour le restaurant Tifosi (focaccias, ingrédients, marques, boissons).

## Fichiers

- sql/01_creation_tifosi.sql : crée la base, l'utilisateur tifosi et les tables
- sql/02_donnees_test_tifosi.sql : insère les données de test
- backup_tifosi.sql : sauvegarde de la base (structure + données)

## Utilisation

Créer la base :
```
mysql -u root < sql/01_creation_tifosi.sql
```

Insérer les données de test :
```
mysql -u tifosi -p tifosi < sql/02_donnees_test_tifosi.sql
```

Utilisateur : tifosi, mot de passe : tifosi

## Restaurer le backup

```
mysql -u root -e "CREATE DATABASE tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root tifosi < backup_tifosi.sql
```
