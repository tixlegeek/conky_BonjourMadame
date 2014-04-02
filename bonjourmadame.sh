#!/bin/bash 
################################################################################
#             SCRIPT DE RÉCUPÉRATION AUTOMATIQUE DE LA DERNIERE
#                       DEMOISELLE DE BONJOURMADAME
################################################################################
#                                       
# Par Tixlegeek, http://www.tixlegeek.com - tixlegeek[aT]whoarehackers[dot]com
#                          Aucune revendication particulière
#
# Lignes à insérer dans le conkyrc:
#  ${texeci 200 ~/.conkybonjourmadame > /dev/null}     # Exécution periodique
#  ${image ~/.bonjour_madame/LATEST.png -p 40,730 -f 20}  # Affichage
#
#   LATEST.png     : Miniature carrée de la photo
#
FEEDURL="http://feeds.feedburner.com/BonjourMadame?format=xml"
# Teste la connexion à internet
if ping google.com -q -w 2 -c 1 > /dev/null 2>/dev/null; then
	# Dossier de destination.
	BMPATH="/home/tixlegeek/.bonjour_madame"
	THSIZE=250
	# Récupère l'URL de la dernière photo publiée à partir du flux Rss (xml)
	URL=`wget $FEEDURL -q -O -  | grep -o 'src="http[^"]*"'| cut -d\" -f2 | head -n1`
	# Récupère le nom du fichier
	NAME=$(basename $URL)
	# Extrait l'extension
	EXT=${NAME#*.}
	# Si le fichier existe déjà, pas besoin de le re-télécharger
	if [ -f "$BMPATH/$NAME" ]
	then
		exit
	else
		wget $URL -q -O "$BMPATH/$NAME"
		# Copie le fichier en résolution normale pour une utilisation
		# future... Comme l'affichage en grand.
		cp "$BMPATH/$NAME" "$BMPATH/LATEST_Big.${NAME#*.}"
	#	echo	"$BMPATH/LATEST_Big.$EXT"
	fi 
	# Télécharge la dernière madame
	wget $URL -q -O "$BMPATH/$NAME"
	# Recadre la demoiselle en un joli carré bien propre
	convert "$BMPATH/$NAME" -thumbnail $THSIZEx$THSIZE^ -gravity center -extent $THSIZEx$THSIZE "$BMPATH/LATEST.png"
fi
