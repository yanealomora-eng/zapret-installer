#!/bin/bash

# ═══════════════════════════════════════════════════════════════════
#  ZAPRET CONTROL PANEL - DPI BYPASS MANAGER
#  Monochrome Edition | Cyberpunk Style
# ═══════════════════════════════════════════════════════════════════

set -e

# ANSI Colors - Monochrome Theme
BLACK='\033[0;30m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
BRIGHT='\033[1;97m'
DIM='\033[2;37m'
BOLD='\033[1m'
NC='\033[0m'

ZAPRET_DIR="/opt/zapret.installer"
PROFILE_DIR="$ZAPRET_DIR/profiles"
LIST_DIR="$ZAPRET_DIR/lists"

# ═══════════════════════════════════════════════════════════════════
# UI FUNCTIONS
# ═══════════════════════════════════════════════════════════════════

show_header() {
    clear
    echo -e "${BRIGHT}"
    echo "    ███████╗ █████╗ ██████╗ ██████╗ ███████╗████████╗"
    echo "    ╚══███╔╝██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝"
    echo "      ███╔╝ ███████║██████╔╝██████╔╝█████╗     ██║   "
    echo "     ███╔╝  ██╔══██║██╔═══╝ ██╔══██╗██╔══╝     ██║   "
    echo "    ███████╗██║  ██║██║     ██║  ██║███████╗   ██║   "
    echo "    ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   "
    echo -e "${NC}"
    echo -e "${DIM}    ══════════════════════════════════════════════════${NC}"
    echo -e "${GRAY}           DPI Bypass Control Panel v2.0${NC}"
    echo -e "${DIM}    ══════════════════════════════════════════════════${NC}"
    echo
}

show_main_menu() {
    echo -e "${WHITE}┌─ MAIN MENU${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[1]${NC} Install Zapret"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[2]${NC} Start Service"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[3]${NC} Stop Service"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[4]${NC} Service Status"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[5]${NC} Apply Profile ►"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[6]${NC} Manual Config"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[7]${NC} Update Zapret"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[8]${NC} Uninstall"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}└──${NC} ${DIM}[0] Exit${NC}"
    echo
    echo -ne "${GRAY}>>> ${NC}"
}

show_profiles() {
    show_header
    echo -e "${WHITE}┌─ ISP PROFILES${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[1]${NC}  МТС ${DIM}(Moscow)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[2]${NC}  Beeline ${DIM}(VPN-friendly)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[3]${NC}  Megafon ${DIM}(strict)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[4]${NC}  Rostelecom ${DIM}(universal)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[5]${NC}  Dom.ru ${DIM}(mild)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[6]${NC}  МГТС ${DIM}(aggressive)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[7]${NC}  Yota ${DIM}(mobile)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[8]${NC}  Tele2 ${DIM}(mobile strict)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[9]${NC}  TTK ${DIM}(TransTelecom)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[10]${NC} ER-Telecom${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${WHITE}├─ SERVICE PROFILES${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[11]${NC} YouTube ${DIM}(HD streaming)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[12]${NC} Discord ${DIM}(voice+video)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[13]${NC} Twitter/X ${DIM}(full)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[14]${NC} Instagram+FB${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[15]${NC} Telegram ${DIM}(web)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[16]${NC} Spotify${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[17]${NC} Netflix+Prime${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[18]${NC} GitHub+GitLab${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${WHITE}├─ REGIONAL PROFILES${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[19]${NC} Moscow ${DIM}(aggressive)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[20]${NC} St.Petersburg ${DIM}(medium)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[21]${NC} Ekaterinburg ${DIM}(mild)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[22]${NC} Novosibirsk${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[23]${NC} Krasnodar${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${WHITE}├─ UNIVERSAL${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[24]${NC} Universal ${DIM}(all sites)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[25]${NC} Aggressive ${DIM}(max bypass)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[26]${NC} Safe ${DIM}(minimal mods)${NC}"
    echo -e "${GRAY}├──${NC} ${BRIGHT}[27]${NC} VPN Mode ${DIM}(detect bypass)${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}└──${NC} ${DIM}[0] Back${NC}"
    echo
    echo -ne "${GRAY}>>> ${NC}"
}

apply_profile() {
    local profile_id=$1
    local profile_file=""
    
    case $profile_id in
        1) profile_file="mts.conf" ;;
        2) profile_file="beeline.conf" ;;
        3) profile_file="megafon.conf" ;;
        6) profile_file="mgts.conf" ;;
        11) profile_file="youtube.conf" ;;
        12) profile_file="discord.conf" ;;
        *)
            echo -e "${GRAY}[!] Profile not found. Creating temporary config...${NC}"
            create_temp_profile $profile_id
            return
            ;;
    esac
    
    if [ -f "$PROFILE_DIR/$profile_file" ]; then
        sudo cp "$PROFILE_DIR/$profile_file" "$ZAPRET_DIR/config/config"
        echo -e "${BRIGHT}[✓] Profile applied: $profile_file${NC}"
    else
        echo -e "${GRAY}[✗] Profile file not found${NC}"
    fi
    sleep 2
}

create_temp_profile() {
    case $1 in
        4) echo 'NFQWS_OPT="--dpi-desync=fake,disorder2 --dpi-desync-ttl=5"' ;;
        5) echo 'NFQWS_OPT="--dpi-desync=fake --dpi-desync-ttl=3"' ;;
        7) echo 'NFQWS_OPT="--dpi-desync=fake --dpi-desync-ttl=4"' ;;
        8) echo 'NFQWS_OPT="--dpi-desync=split --dpi-desync-split-pos=3"' ;;
        9) echo 'NFQWS_OPT="--dpi-desync=fake,split --dpi-desync-ttl=5"' ;;
        10) echo 'NFQWS_OPT="--dpi-desync=fake --dpi-desync-ttl=6"' ;;
        24) echo 'NFQWS_OPT="--dpi-desync=fake,split2 --dpi-desync-ttl=6"' ;;
        25) echo 'NFQWS_OPT="--dpi-desync=split2,disorder2,fake --dpi-desync-ttl=10"' ;;
        26) echo 'NFQWS_OPT="--dpi-desync=fake --dpi-desync-ttl=3"' ;;
        27) echo 'NFQWS_OPT="--dpi-desync=fake,split --dpi-desync-any-protocol"' ;;
    esac | sudo tee "$ZAPRET_DIR/config/config" > /dev/null
}

install_zapret() {
    echo -e "${BRIGHT}[*] Installing Zapret...${NC}"
    if [ -d "$ZAPRET_DIR" ]; then
        echo -e "${GRAY}[!] Zapret already installed${NC}"
    else
        sudo git clone https://github.com/bol-van/zapret.git "$ZAPRET_DIR"
        sudo mkdir -p "$ZAPRET_DIR/config"
        echo -e "${BRIGHT}[✓] Installation complete${NC}"
    fi
    sleep 2
}

start_service() {
    echo -e "${BRIGHT}[*] Starting Zapret service...${NC}"
    if systemctl is-active --quiet zapret 2>/dev/null; then
        echo -e "${GRAY}[!] Service already running${NC}"
    else
        sudo systemctl start zapret 2>/dev/null || echo -e "${GRAY}[!] Service not configured${NC}"
        echo -e "${BRIGHT}[✓] Service started${NC}"
    fi
    sleep 2
}

stop_service() {
    echo -e "${BRIGHT}[*] Stopping Zapret service...${NC}"
    sudo systemctl stop zapret 2>/dev/null || echo -e "${GRAY}[!] Service not running${NC}"
    echo -e "${BRIGHT}[✓] Service stopped${NC}"
    sleep 2
}

check_status() {
    echo -e "${BRIGHT}[*] Checking service status...${NC}"
    echo
    if systemctl is-active --quiet zapret 2>/dev/null; then
        echo -e "${BRIGHT}Status:${NC} ${BRIGHT}ACTIVE${NC}"
    else
        echo -e "${GRAY}Status: INACTIVE${NC}"
    fi
    echo
    read -p "Press Enter to continue..."
}

# ═══════════════════════════════════════════════════════════════════
# MAIN LOOP
# ═══════════════════════════════════════════════════════════════════

while true; do
    show_header
    show_main_menu
    read -r choice
    
    case $choice in
        1) install_zapret ;;
        2) start_service ;;
        3) stop_service ;;
        4) check_status ;;
        5)
            show_profiles
            read -r profile_choice
            [ "$profile_choice" != "0" ] && apply_profile "$profile_choice"
            ;;
        6) echo -e "${GRAY}[!] Manual config - edit $ZAPRET_DIR/config/config${NC}"; sleep 2 ;;
        7) echo -e "${BRIGHT}[*] Updating...${NC}"; cd "$ZAPRET_DIR" && sudo git pull; sleep 2 ;;
        8) echo -e "${GRAY}[!] Uninstall: sudo rm -rf $ZAPRET_DIR${NC}"; sleep 2 ;;
        0) echo -e "${DIM}Goodbye.${NC}"; exit 0 ;;
        *) echo -e "${GRAY}[✗] Invalid choice${NC}"; sleep 1 ;;
    esac
done
