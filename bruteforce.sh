#!/bin/bash

PADRAO="\x1b["
FORMATACOR=$PADRAO"39;49;00m"
RED=$PADRAO"01;31;01m"
GREEN=$PADRAO"01;32;01m"
YELLOW=$PADRAO"01;33;01m"
BLUE=$PADRAO"01;34;01m"
ROSA=$PADRAO"01;35;01m"

#variavel de tamanho
len=$(cat /usr/share/dirb/wordlists/common.txt | wc -l)

#variavel de calculo

for linha in $(cat /usr/share/dirb/wordlists/common.txt);
do resposta=$(curl -s -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.5359.125 Safari/537.36" -o /dev/null -w "%{http_code}" $1/$linha/)
if [ $resposta == "200" ]
then
echo -e "$GREEN diretorio encontrado: $1/$linha $FORMATACOR"
else
echo -e "$RED diretorio testado: $1/$linha $FORMATACOR"
fi
done
