# Documentation - **[makyma.org](https://www.makyma.org)**

Les instructions suivantes vous aideront à la mise en route et à l'utilisation de l'application.

## Prérequis

#### NodeJS

[Installation](https://nodejs.org/en/download/) pour MacOS, Linux et Windows.

#### Version de Ruby : `2.6.5`

* [Installation](https://github.com/lewagon/setup/blob/master/macOS.md) pour MacOS
* [Installation](https://github.com/lewagon/setup/blob/master/UBUNTU.md) pour Linux
* [Installation](https://github.com/lewagon/setup/blob/master/WINDOWS.md) pour Windows

#### Version de Ruby on Rails : `5.2.4.1`

* [Installation](https://www.synbioz.com/blog/tech/installer-ruby-on-rails-sur-mac) pour MacOS
* [Installation](https://doc.ubuntu-fr.org/rubyonrails) pour Linux
* [Installation](https://gorails.com/setup/windows/10) pour Windows

#### PostgreSQL

* [Installation](https://postgresapp.com/downloads.html) pour MacOS
* [Installation](https://doc.ubuntu-fr.org/postgresql) pour Linux
* [Installation](https://www.postgresql.org/download/windows/) pour Windows

## Configuration

### Dans le dossier du projet, installer les gems

```bash
bundle install
```

## Création de la base de données

### Dans le dossier du projet, **créer** la database

```bash
rails db:create
```

Si cette commande ne fonctionne pas, exécuter la commande suivante

```bash
bundle exec rake db:create
```

### Effectuer **les migrations** de la database

```bash
rails db:migrate
```

Si cette commande ne fonctionne pas, exécuter la commande suivante

```bash
bundle exec rake db:migrate
```

## Initialisation de la base de données

Pour récupérer les données de la database, il y a **2 façons** de faire :

### Récupérer les données de la database du site en ligne

> Pour cette solution, il est impérative d'être invité en tant que collaborateur sur **Heroku**

```bash
psql DROP DATABASE "Makyma_development";
```

```bash
heroku pg:pull postgresql-aerodynamic-10743 Makyma_development --app makyma
```

### Récupérer les données de la database du site local

#### Importer les données

```bash
rails makyma:import
```

#### Créer les comptes admin

```bash
rails makyma:create_admin
```

## Comment exécuter le site

Pour **lancer** le serveur rails

```bash
rails s
```

> Les changements sur le site sont chargé automatiquement, pas besoin de relancer le serveur

## Instructions pour la mise en ligne

### Installer le CLI de Heroku

TODO

### Commandes de la mise en ligne

#### GitHub

**Ajouter** les fichiers

```bash
git add .
```

**Effectuer** le commit

```bash
git commit -m "message"
```

**Mettre** en ligne les fichiers

```bash
git push
```

#### Heroku

**Mettre** en ligne les fichiers

```bash
git push heroku master
```

**Migrer** la base de donnée

```bash
heroku run rails db:migrate
```

© [makyma.org](www.makyma.org) 2020
