#!/bin/bash

# Restore colors
RESTORE="\033[0m"       

# Regular Colors
BLACK="\e[0;30m"        # Black
RED="\e[0;31m"          # Red
GREEN="\e[0;32m"        # Green
YELLOW="\e[0;33m"       # Yellow
BLUE="\e[0;34m"         # Blue
PURPLe="\e[0;35m"       # Purple
CYAN="\e[0;36m"         # Cyan
WHITE="\e[0;37m"        # White

# Bold
BBLACK="\e[1;30m"       # Black
BRED="\e[1;31m"         # Red
BGREEN="\e[1;32m"       # Green
BYELLOW="\e[1;33m"      # Yellow
BBLUE="\e[1;34m"        # Blue
BPURPLE="\e[1;35m"      # Purple
BCYAN="\e[1;36m"        # Cyan
BWHITE="\e[1;37m"       # White

# Underline
UBLACK="\e[4;30m"       # Black
URED="\e[4;31m"         # Red
UGREEN="\e[4;32m"       # Green
UYELLOW="\e[4;33m"      # Yellow
UBLUE="\e[4;34m"        # Blue
UPURPLE="\e[4;35m"      # Purple
UCYAN="\e[4;36m"        # Cyan
UWHITE="\e[4;37m"       # White

# Background
ON_BLACK="\e[40m"       # Black
ON_RED="\e[41m"         # Red
ON_GREEN="\e[42m"       # Green
ON_YELLOW="\e[43m"      # Yellow
ON_BLUE="\e[44m"        # Blue
ON_PURPLE="\e[45m"      # Purple
ON_CYAN="\e[46m"        # Cyan
ON_WHITE="\e[47m"       # White

# High Intensity
IBLACK="\e[0;90m"       # Black
IRED="\e[0;91m"         # Red
IGREEN="\e[0;92m"       # Green
IYELLOW="\e[0;93m"      # Yellow
IBLUE="\e[0;94m"        # Blue
IPURPLE="\e[0;95m"      # Purple
ICYAN="\e[0;96m"        # Cyan
IWHITE="\e[0;97m"       # White

# Bold High Intensity
BIBLACK="\e[1;90m"      # Black
BIRED="\e[1;91m"        # Red
BIGREEN="\e[1;92m"      # Green
BIYELLOW="\e[1;93m"     # Yellow
BIBLUE="\e[1;94m"       # Blue
BIPURPLE="\e[1;95m"     # Purple
BICYAN="\e[1;96m"       # Cyan
BIWHITE="\e[1;97m"      # White

# High Intensity backgrounds
ON_IBLACK="\e[0;100m"   # Black
ON_IRED="\e[0;101m"     # Red
ON_IGREEN="\e[0;102m"   # Green
ON_IYELLOW="\e[0;103m"  # Yellow
ON_IBLUE="\e[0;104m"    # Blue
ON_IPURPLE="\e[0;105m"  # Purple
ON_ICYAN="\e[0;106m"    # Cyan
ON_IWHITE="\e[0;107m"   # White

colors() 
{
    echo -e "${RESTORE}Restoring colors:${RESTORE}"
    echo -e "${RESTORE}RESTORE${RESTORE}"

    echo -e "\n${RESTORE}Regular Colors:${RESTORE}"
    echo -e "${BLACK}BLACK${RESTORE}"
    echo -e "${RED}RED${RESTORE}"
    echo -e "${GREEN}GREEN${RESTORE}"
    echo -e "${YELLOW}YELLOW${RESTORE}"
    echo -e "${BLUE}BLUE${RESTORE}"
    echo -e "${PURPLE}PURPLE${RESTORE}"
    echo -e "${CYAN}CYAN${RESTORE}"
    echo -e "${WHITE}WHITE${RESTORE}"

    echo -e "\n${RESTORE}Bold:${RESTORE}"
    echo -e "${BBLACK}BBLACK${RESTORE}"
    echo -e "${BRED}BRED${RESTORE}"
    echo -e "${BGREEN}BGREEN${RESTORE}"
    echo -e "${BYELLOW}BYELLOW${RESTORE}"
    echo -e "${BBLUE}BBLUE${RESTORE}"
    echo -e "${BPURPLE}BPURPLE${RESTORE}"
    echo -e "${BCYAN}BCYAN${RESTORE}"
    echo -e "${BWHITE}BWHITE${RESTORE}"

    echo -e "\n${RESTORE}Underline:${RESTORE}"
    echo -e "${UBLACK}UBLACK${RESTORE}"
    echo -e "${URED}URED${RESTORE}"
    echo -e "${UGREEN}UGREEN${RESTORE}"
    echo -e "${UYELLOW}UYELLOW${RESTORE}"
    echo -e "${UBLUE}UBLUE${RESTORE}"
    echo -e "${UPURPLE}UPURPLE${RESTORE}"
    echo -e "${UCYAN}UCYAN${RESTORE}"
    echo -e "${UWHITE}UWHITE${RESTORE}"

    echo -e "\n${RESTORE}Background:${RESTORE}"
    echo -e "${ON_BLACK}ON_BLACK${RESTORE}"
    echo -e "${ON_RED}ON_RED${RESTORE}"
    echo -e "${ON_GREEN}ON_GREEN${RESTORE}"
    echo -e "${ON_YELLOW}ON_YELLOW${RESTORE}"
    echo -e "${ON_BLUE}ON_BLUE${RESTORE}"
    echo -e "${ON_PURPLE}ON_PURPLE${RESTORE}"
    echo -e "${ON_CYAN}ON_CYAN${RESTORE}"
    echo -e "${ON_WHITE}ON_WHITE${RESTORE}"

    echo -e "\n${RESTORE}High Intensity:${RESTORE}"
    echo -e "${IBLACK}IBLACK${RESTORE}"
    echo -e "${IRED}IRED${RESTORE}"
    echo -e "${IGREEN}IGREEN${RESTORE}"
    echo -e "${IYELLOW}IYELLOW${RESTORE}"
    echo -e "${IBLUE}IBLUE${RESTORE}"
    echo -e "${IPURPLE}IPURPLE${RESTORE}"
    echo -e "${ICYAN}ICYAN${RESTORE}"
    echo -e "${IWHITE}IWHITE${RESTORE}"

    echo -e "\n${RESTORE}Bold High Intensity:${RESTORE}"
    echo -e "${BIBLACK}BBLACK${RESTORE}"
    echo -e "${BIRED}BRED${RESTORE}"
    echo -e "${BIGREEN}BGREEN${RESTORE}"
    echo -e "${BIYELLOW}BYELLOY${RESTORE}"
    echo -e "${BIBLUE}BBLUE${RESTORE}"
    echo -e "${BIPURPLE}BPURPLE${RESTORE}"
    echo -e "${BICYAN}BCYAN${RESTORE}"
    echo -e "${BIWHITE}BWHITE${RESTORE}"

    echo -e "\n${RESTORE}High Intensity backgrounds:${RESTORE}"
    echo -e "${ON_IBLACK}ON_IBLACK${RESTORE}"
    echo -e "${ON_IRED}ON_IRED${RESTORE}"
    echo -e "${ON_IGREEN}ON_IGREEN${RESTORE}"
    echo -e "${ON_IYELLOW}ON_IYELLOW${RESTORE}"
    echo -e "${ON_IBLUE}ON_IBLUE${RESTORE}"
    echo -e "${ON_IPURPLE}ON_IPURPLE${RESTORE}"
    echo -e "${ON_ICYAN}ON_ICYAN${RESTORE}"
    echo -e "${ON_IWHITE}ON_IWHITE${RESTORE}"
}
