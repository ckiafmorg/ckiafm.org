# CKIAFM.ORG - l'application Web de CKIA

## Dépendances

* ruby: la version spécifiée dans le fichier `.ruby-version`, normalement c'est la dernière.
* postgresql: la version disponible sur ton poste ou la dernière version stable.

## Installation de l'environnement de développement

```shell
git clone git@github.com:ckiafmorg/ckiafm.org
```

Si bundler n'est pas installé, rouler la commande suivante :

```shell
gem install bundler
```

Ensuite installer les dépendances ruby du projet:

```shell
bundle install
```

Une fois la base de données lancée, il faut créer les tables et migrer exécuter
les migrations. Pour ce faire, rouler la commande suivante :

```shell
bin/rails db:create db:migrate
```

Pour lancer le serveur de développement, lancer la commande suivante :

```shell
bin/rails server # on peut aussi utiliser bin/rails s
```
