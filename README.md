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
git log: journal de log de tous les commits
git log -n2: affiche uniquement les deux derniers commits
git push -u origin master
git push -f origin master
git restore
git pull
git reset --hard (sha du git log)

si j'utilise la commande: git add .
puis que je me rend compte que je ne voulais pas l'ajouter dans le staging
alors: git reset
si git add . puis git commit -m "update"
et que l'on veut revenir en arriere: git reset HEAD~1

git branch (voir les banches du repot)
git checkout -b (nom de la nouvelle branche)
git merge (nom de la branche != master) (les fusionne localement)
git push -u origin (nom de la branche != master) (fait une demande de pull request 
    sur la branche principale)
git branch -d (nom de la branche != master) (supprime la branche)
git merge --continue (forcer le commit depuis le depot local vers le remote)
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