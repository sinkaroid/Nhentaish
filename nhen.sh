#!/bin/bash
#sin

#view
RED=$(tput setaf 1) 
GREEN=$(tput setaf 2) 
CYAN=$(tput setaf 6) 
WHITE=$(tput setaf 7) 
MAGENTA=$(tput setaf 5) 

begin=$(date +"%s")

echo -e "${RED}
        _                _        _       _     
       | |              | |      (_)     | |    
  _ __ | |__   ___ _ __ | |_ __ _ _   ___| |__  
 | '_ \| '_ \ / _ \ '_ \| __/ _' | | / __| '_ \ 
 | | | | | | |  __/ | | | || (_| | |_\__ \ | | |
 |_| |_|_| |_|\___|_| |_|\__\__._|_(_)___/_| |_|                                                                                                                                          
"
echo "![Nhentai stealer]!"

#get
read -p "${WHITE}code: " kode
echo -e "\n"
read -p "${MAGENTA}${kode} Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
echo -e "reading source for /${GREEN}$kode ..
${WHITE}"

wget -O ${kode}.html https://nhentai.net/g/${kode};

#do
mkdir $kode
cat ${kode}.html | grep img | grep -Po '<img src="\K.*?(?=")' | sed 's/\?.*//' | sed 's/t.nhentai/i.nhentai/' | sed 's/t.jpg/.jpg/' | sed 's/t.png/.png/' > ${kode}/links.txt; 
cd $kode;
wget -i links.txt

#length
termin=$(date +"%s")
difftimelps=$(($termin-$begin))
echo "${WHITE}$(($difftimelps / 60)) minutes and $(($difftimelps % 60)) sec. elapsed ${RED}nhentai stealer"

