#!/usr/bin/env bash

#cores
RESET="\e[0m"
BOLD="\e[1m"
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"
RED_ALERT="\e[41m"

#Variaveis
PARTED=$(echo print free | parted > /tmp/initial_parted.log)
ESPACO_LIVRE=$(df -h | grep "sda"| awk '{print $4}'> /tmp/initial_df.log && cat /tmp/initial_parted.log)
LIVRE_PARTED=$(echo grep "Free Space" /tmp/initial_parted.log |grep "GB" | awk '{print $3}')
PARTITION=$(df -h | grep "sda"| awk '{print $1}' > /tmp/initial_partition.log && cat /tmp/initial_partition.log)
NUMERO_DE_PART=$(grep "ext"/tmp/initial_parted.log|awk '{print $1}')

echo ${PARTED}
echo -e "${YELLOW}Você possui ${RESET}${GREEN}${ESPACO_LIVRE}${RESET}${YELLOW} livres na sua partição ${RED}${PARTITION}${RESET}.\n"
echo -e "${YELLOW}Esse valor pode ser extendido até ${RESET}${GREEN}${LIVRE_PARTED}${RESET}\n\n"
#echo -e "${YELLOW} Deseja extender completamente? Yes/No${RESET}.\n\n"
  read -r "Deseja extender completamente? Yes/No" resposta
        if [[ "$resposta" == "yes" ]] ; then
          echo -e "${GREEN}[OK] ${RESET}${YELLOW} Realizando resize da partição.. ${RESET}${RED}${PARTITION}${RESET}"
          parted "${PARTITION}" resizepart "${NUMERO_DE_PART}" "${LIVRE_PARTED}"
          echo "${BLUE}[SUCESSO] ${RESET}${YELLOW}Agora você possui ${RESET}${GREEN}${ESPACO_LIVRE} na sua particão ${RESET}${RED}${PARTITION}${RESET}"
          
        else
          echo "${GREEN}[OK]!${RESET}: ${RED_ALERT}Não foi alterado absolutamente nada, para realizar cambios deve escrever a palavra ${RESET}${BOLD}yes${RESET}"
        fi
