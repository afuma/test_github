Premier tuto git pour debutant:
https://www.youtube.com/watch?v=X3KCX99I2pQ

D'apres mes tests:
S'il n'y a pas de commit (alors il fait comme si tout etait mise a jour)
alors que mon repo distant ne l'est pas (j'ai fait un git add puis git push)
et ne fonctionne donc pas s'il n'y a pas de commit.
-> Donc l'étape de commit est importante !

Si je git clone ou git pull un repo
et que je le modifie, puis que je git push et qu'il y a une erreur
disant que j'ecraserais le code deja existant,
alors git push -f origin master est une solution pour "forcer" le push
sur la branche souhaité.

git config --global user.name "mon nom"
git config --global user.email mon@email.com
git config --global --list (affiche nom et mail)
git init
git add .
git status
git diff
git commit -m "explication"
git log
git log -n2
git push -u origin master
git push -f origin master
git restore
git pull

----------------------------------------------------------------------------------

Ignorer des fichiers avec Git:
https://www.youtube.com/watch?v=gkzBzBomYyI

comment ignorer des fichiers (compilation, temporaires, sensibles)
utiliser un fichier .gitignore (regles pour ignorer les fichiers)
le mettre a la racine du projet
exemple d'un .gitignore:
.env
*.tmp
/config.sample
/tmp
!/log
/log/*
!/log/.keep