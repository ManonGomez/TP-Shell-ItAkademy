#!/bin/sh

#Vous devez faire la réalisation d'un script en BASH qui permettra, au lancement : 

# De pouvoir lister tous les dossiers/fichiers qui se trouvent où vous vous situez

#De pouvoir vous déplacer de dossiers en dossiers à volonté

#Créer ou Supprimer un fichier
#Si cette option est choisie, proposer ensuite de soit créer, soit supprimer un fichier.
#Ensuite, lui demander le nom du fichier en question.

#Créer ou Supprimer un dossier

#Si cette option est choisie, proposer ensuite de soit créer, soit supprimer un dossier.

#Ensuite, lui demander le nom du dossier en question.

#NB : L'utilisation de 'case' pourrait grandement vous aider. :>

#Tout ceci doit être contenu dans une boucle, qui durera jusqu'à ce que le mot "STOP" soit écrit.

 menu(){
    #clear pour tout effacer, propre
    clear
        echo "choissisez une option"
        echo "1) Lister les dossier d'où vous êtes"
        echo "2) Se déplacer"
        echo "3) Créer ou supprimer un fichier"
        echo "4) Créer ou supprimer un dossier"
        echo "5) Chercher un mot dans un fichier"
        echo "6) Modifier les droits"
        echo "7) Quitter le programme"
        read -p "Votre choix: " response
}

#Pose la question, et stocke la réponse dans la variable $response
# read -p "Peut-on aller à Disney ?" response
menu
 while [[ $response != 7 ]]
do
#case liste possibilités/in structure du case dans un par ex il y aura ça
    case $response in
    1)
    clear
    echo "vous êtes ici"
    pwd
    echo "--"
    ls
    read -p "Tapez entrée pour retourner au menu"
    menu
    ;;
    2)
    clear
    echo "vous êtes ici"
    pwd
    echo "--"
    read -p "Où voulez-vous aller dans ce dossier ?" where
    cd $where
    read -p "Tapez entrée pour retourner au menu"
    menu
    ;;
    3)
    clear
    echo "vous êtes ici"
    pwd
    echo "--"
    echo "1)Supprimer un fichier dans ce dossier "
    echo "2)Créer un ficher dans ce dossier"
    read -p "Choisissez l'un ou l'autre" trois
        case $trois in
            1)
            read -p "Supprimer quel fichier dans ce dossier (donner le nom complet et l'extension par ex index.html )?" supp
            rm $supp && echo "$supp à bien été supprimé" || echo "il y a eu une erreur, recommencez et vérifiez bien"
            read -p "Tapez entrée pour retourner au menu"
            menu
            ;;
            2)
            read -p "Donner le nom et l'exension du fichier que vous voulez créer dans ce dossier" create
            touch $create && echo "$create à bien été crée" || echo "il y a eu une erreur, recommencez et vérifiez bien"
            read -p "Tapez entrée pour retourner au menu"
            menu
            ;;
    4)
    clear
    echo "vous êtes ici"
    pwd
    echo "--"
    echo "1)Supprimer un dossier dans ce dossier "
    echo "2)Créer un dossier dans ce dossier"
    read -p "Choisissez l'un ou l'autre" quatre
        case $quatre in
            1)
            read -p "Supprimer quel dossier dans ce dossier (donner le nom complet)?" suppFolder
            rm -rf $suppFolder && echo "$suppFolder à bien été supprimé" || echo "il y a eu une erreur, recommencez et vérifiez bien"
            read -p "Tapez entrée pour retourner au menu"
            menu
            ;;
            2)
            read -p "Donner le nom du dossier que vous voulez créer dans ce dossier" createFolder
            mkdir $createFolder && echo "$createFolder à bien été crée" || echo "il y a eu une erreur, recommencez et vérifiez bien"
            read -p "Tapez entrée pour retourner au menu"
            menu
            ;;
    5)
    #grep pour nom fichier et -c pour combien de fois il appparait
    clear
    echo "vous êtes ici"
    pwd
    echo "--"
    read -p "Donner le mot que vous cherchez" word
    read -p "Dans quel fichier voulez-vous chercher le mot" File
    count=$(grep -c $word $file)
    if [[ $count == 0 ]]
    then
    echo "Il n'y a aucun mot"
    fi
    if [[ $count >= 1 ]]
    then
    echo "Résultat: $count"
    fi
    echo "--"
    read -p "Tapez entrée pour retourner au menu"
    menu
    ;;
6)
            clear
            echo "Pour info vous etes ici : "
            pwd
            echo " "
            ls
            echo " "
            echo "------------------"
            echo " A) À qui s'applique le changement"
            echo "      u- Utilisateur"
            echo "      g- groupe"
            echo "      o- autres"
            echo "      a- tous"
            read -p "Votre Choix (u, g, o, a) : " who_chmod
            clear
            echo "Pour info vous etes ici : "
            pwd
            echo " "
            ls
            echo " "
            echo "------------------"
            echo " A) La modification que l'on veut faire"
            echo "      +- Ajouter"
            echo "      -- Supprimer"
            echo "      =- Affectation"
            read -p "Votre Choix (+, -, =) : " action_chmod
            clear
            echo "Pour info vous etes ici : "
            pwd
            echo " "
            ls
            echo " "
            echo "------------------"
            echo " A) Le droit que l'on veut modifier"
            echo "      r- lecture"
            echo "      w- écriture"
            echo "      x- exécution"
            read -p "Votre Choix (r, w, x) : " right_chmod
            clear
            echo "Pour info vous etes ici : "
            pwd
            echo " "
            ls
            echo " "
            echo "------------------"
            read -p "Quelle est le nom de fichier/dossier cible : " target_chmod
            chmod $who_chmod$action_chmod$right_chmod $target_chmod && echo "Le fichier/dossier $target_chmod a été modifié" || echo "Le dossier n'a pas pu être modifié"
            read -p "On continue ?"
        menu;;
        7)
        break ;;
        stop)
        break;;
        *)
        echo "Erreur lors de la saisie" && sleep 2;;





#fin du case
    esac
done
echo "Vous avez quitté le programme"
