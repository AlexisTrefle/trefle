#Script permettant de lancer le script python app.py de synapse qui va récupérer
#les mails du compte configurer dans synapse et les transformer en cases sur thehive

#!bin/bash

echo "...On rentre dans le répertoire de synapse"
cd /PATH_TO_DIRECTORY || exit

echo "...On lance le script app.py de synapse"
commande= nohup python3.7 app.py &
&commande || exit
sleep 5 || exit

echo "...On lance le curl de recupération des mails de l'adresse configurée"
curl ADRESSE_IP:PORT/ews2case || exit
sleep 5 || exit

pid=$( ps ax | grep python3.7 | grep -v grep | awk '{print $1}') || exit
sleep 1 || exit

echo "... On tue le service synapse" || exit
kill $pid || exit

echo "...Fin du script"
