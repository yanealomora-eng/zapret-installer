#!/bin/bash

# Цвета для интерфейса
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m'

ZAPRET_DIR="/opt/zapret.installer"
CONFIG_DIR="$ZAPRET_DIR/config"

clear

echo -e "${MAGENTA}"
echo "██╗   ██╗ █████╗ ███╗   ██╗███████╗ █████╗ ██╗      ██████╗ ███╗   ███╗ ██████╗ ██████╗  █████╗ "
echo "╚██╗ ██╔╝██╔══██╗████╗  ██║██╔════╝██╔══██╗██║     ██╔═══██╗████╗ ████║██╔═══██╗██╔══██╗██╔══██╗"
echo " ╚████╔╝ ███████║██╔██╗ ██║█████╗  ███████║██║     ██║   ██║██╔████╔██║██║   ██║██████╔╝███████║"
echo "  ╚██╔╝  ██╔══██║██║╚██╗██║██╔══╝  ██╔══██║██║     ██║   ██║██║╚██╔╝██║██║   ██║██╔══██╗██╔══██║"
echo "   ██║   ██║  ██║██║ ╚████║███████╗██║  ██║███████╗╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██║  ██║██║  ██║"
echo "   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝"
echo -e "${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${WHITE}                    Zapret Control Panel - DPI Bypass Solution${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo

show_menu() {
    echo -e "${YELLOW}┌─ ОСНОВНОЕ МЕНЮ${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├─${NC} ${GREEN}[1]${NC} Установить Zapret"
    echo -e "${GRAY}├─${NC} ${GREEN}[2]${NC} Запустить Zapret"
    echo -e "${GRAY}├─${NC} ${RED}[3]${NC} Остановить Zapret"
    echo -e "${GRAY}├─${NC} ${CYAN}[4]${NC} Статус Zapret"
    echo -e "${GRAY}├─${NC} ${BLUE}[5]${NC} Применить готовую стратегию"
    echo -e "${GRAY}├─${NC} ${MAGENTA}[6]${NC} Настроить вручную"
    echo -e "${GRAY}├─${NC} ${YELLOW}[7]${NC} Обновить Zapret"
    echo -e "${GRAY}├─${NC} ${RED}[8]${NC} Удалить Zapret"
    echo -e "${GRAY}├─${NC} ${WHITE}[0]${NC} Выход"
    echo -e "${GRAY}└─${NC}"
    echo
    echo -ne "${CYAN}╰─ Выберите действие:${NC} "
}

show_strategies() {
    clear
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${WHITE}                          ГОТОВЫЕ СТРАТЕГИИ ДЛЯ ПРОВАЙДЕРОВ${NC}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    echo -e "${YELLOW}┌─ Провайдеры России${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├─${NC} ${GREEN}[1]${NC}  МТС (Moscow, regions)"
    echo -e "${GRAY}├─${NC} ${GREEN}[2]${NC}  Билайн (Beeline, VPN friendly)"
    echo -e "${GRAY}├─${NC} ${GREEN}[3]${NC}  Мегафон (Megafon, strict DPI)"
    echo -e "${GRAY}├─${NC} ${GREEN}[4]${NC}  Ростелеком (Rostelecom, universal)"
    echo -e "${GRAY}├─${NC} ${GREEN}[5]${NC}  Дом.ру (Dom.ru, mild filtering)"
    echo -e "${GRAY}├─${NC} ${GREEN}[6]${NC}  МГТС (MGTS Moscow, aggressive)"
    echo -e "${GRAY}├─${NC} ${GREEN}[7]${NC}  Yota (mobile optimized)"
    echo -e "${GRAY}├─${NC} ${GREEN}[8]${NC}  Tele2 (mobile strict)"
    echo -e "${GRAY}├─${NC} ${GREEN}[9]${NC}  TTK (TransTelecom)"
    echo -e "${GRAY}├─${NC} ${GREEN}[10]${NC} ЭР-Телеком (provider alliance)"
    echo -e "${GRAY}│${NC}"
    echo -e "${YELLOW}├─ Сервисы${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├─${NC} ${BLUE}[11]${NC} YouTube (HD streaming)"
    echo -e "${GRAY}├─${NC} ${BLUE}[12]${NC} Discord (voice + video)"
    echo -e "${GRAY}├─${NC} ${BLUE}[13]${NC} Twitter/X (full access)"
    echo -e "${GRAY}├─${NC} ${BLUE}[14]${NC} Instagram + Facebook"
    echo -e "${GRAY}├─${NC} ${BLUE}[15]${NC} Telegram (web version)"
    echo -e "${GRAY}├─${NC} ${BLUE}[16]${NC} Spotify (streaming)"
    echo -e "${GRAY}├─${NC} ${BLUE}[17]${NC} Netflix + Prime Video"
    echo -e "${GRAY}├─${NC} ${BLUE}[18]${NC} GitHub + GitLab"
    echo -e "${GRAY}│${NC}"
    echo -e "${YELLOW}├─ Регионы${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├─${NC} ${CYAN}[19]${NC} Москва (агрессивная фильтрация)"
    echo -e "${GRAY}├─${NC} ${CYAN}[20]${NC} Санкт-Петербург (средняя)"
    echo -e "${GRAY}├─${NC} ${CYAN}[21]${NC} Екатеринбург (мягкая)"
    echo -e "${GRAY}├─${NC} ${CYAN}[22]${NC} Новосибирск (средняя)"
    echo -e "${GRAY}├─${NC} ${CYAN}[23]${NC} Краснодар (агрессивная)"
    echo -e "${GRAY}│${NC}"
    echo -e "${YELLOW}├─ Универсальные${NC}"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}├─${NC} ${MAGENTA}[24]${NC} Универсальная (все сайты)"
    echo -e "${GRAY}├─${NC} ${MAGENTA}[25]${NC} Агрессивная (макс. обход)"
    echo -e "${GRAY}├─${NC} ${MAGENTA}[26]${NC} Безопасная (минимум модификаций)"
    echo -e "${GRAY}├─${NC} ${MAGENTA}[27]${NC} VPN Режим (обход детекта)"
    echo -e "${GRAY}│${NC}"
    echo -e "${GRAY}└─${NC} ${WHITE}[0]${NC} Назад"
    echo
    echo -ne "${CYAN}╰─ Выберите стратегию:${NC} "
}

apply_strategy() {
    case $1 in
        1) echo "--dpi-desync=fake,split2 --dpi-desync-ttl=6 --dpi-desync-fooling=badsum" > "$CONFIG_DIR/strategy.conf" ;;
        2) echo "--dpi-desync=fake --dpi-desync-ttl=4 --dpi-desync-autottl=2" > "$CONFIG_DIR/strategy.conf" ;;
        3) echo "--dpi-desync=split --dpi-desync-split-pos=2 --dpi-desync-ttl=8" > "$CONFIG_DIR/strategy.conf" ;;
        4) echo "--dpi-desync=fake,disorder2 --dpi-desync-ttl=5 --dpi-desync-fooling=md5sig" > "$CONFIG_DIR/strategy.conf" ;;
        5) echo "--dpi-desync=fake --dpi-desync-ttl=3 --dpi-desync-autottl=1" > "$CONFIG_DIR/strategy.conf" ;;
        6) echo "--dpi-desync=split2 --dpi-desync-split-pos=1 --dpi-desync-ttl=10 --dpi-desync-fooling=badsum" > "$CONFIG_DIR/strategy.conf" ;;
        7) echo "--dpi-desync=fake --dpi-desync-ttl=4 --dpi-desync-autottl" > "$CONFIG_DIR/strategy.conf" ;;
        8) echo "--dpi-desync=split --dpi-desync-split-pos=3 --dpi-desync-ttl=7" > "$CONFIG_DIR/strategy.conf" ;;
        9) echo "--dpi-desync=fake,split --dpi-desync-ttl=5" > "$CONFIG_DIR/strategy.conf" ;;
        10) echo "--dpi-desync=fake --dpi-desync-ttl=6 --dpi-desync-fooling=badseq" > "$CONFIG_DIR/strategy.conf" ;;
        11) echo "--dpi-desync=split2 --dpi-desync-split-pos=2 --hostlist=$ZAPRET_DIR/lists/youtube.txt" > "$CONFIG_DIR/strategy.conf" ;;
        12) echo "--dpi-desync=fake,split --dpi-desync-ttl=6 --hostlist=$ZAPRET_DIR/lists/discord.txt" > "$CONFIG_DIR/strategy.conf" ;;
        13) echo "--dpi-desync=fake --dpi-desync-ttl=5 --hostlist=$ZAPRET_DIR/lists/twitter.txt" > "$CONFIG_DIR/strategy.conf" ;;
        14) echo "--dpi-desync=split --dpi-desync-split-pos=3 --hostlist=$ZAPRET_DIR/lists/facebook.txt" > "$CONFIG_DIR/strategy.conf" ;;
        15) echo "--dpi-desync=fake,split2 --hostlist=$ZAPRET_DIR/lists/telegram.txt" > "$CONFIG_DIR/strategy.conf" ;;
        16) echo "--dpi-desync=fake --dpi-desync-ttl=4 --hostlist=$ZAPRET_DIR/lists/spotify.txt" > "$CONFIG_DIR/strategy.conf" ;;
        17) echo "--dpi-desync=split2 --dpi-desync-split-pos=2 --hostlist=$ZAPRET_DIR/lists/streaming.txt" > "$CONFIG_DIR/strategy.conf" ;;
        18) echo "--dpi-desync=fake --hostlist=$ZAPRET_DIR/lists/dev.txt" > "$CONFIG_DIR/strategy.conf" ;;
        19) echo "--dpi-desync=split2,fake --dpi-desync-ttl=8 --dpi-desync-fooling=badsum,md5sig" > "$CONFIG_DIR/strategy.conf" ;;
        20) echo "--dpi-desync=fake,split --dpi-desync-ttl=6" > "$CONFIG_DIR/strategy.conf" ;;
        21) echo "--dpi-desync=fake --dpi-desync-ttl=4" > "$CONFIG_DIR/strategy.conf" ;;
        22) echo "--dpi-desync=split --dpi-desync-split-pos=2 --dpi-desync-ttl=5" > "$CONFIG_DIR/strategy.conf" ;;
        23) echo "--dpi-desync=fake,disorder --dpi-desync-ttl=7 --dpi-desync-fooling=badsum" > "$CONFIG_DIR/strategy.conf" ;;
        24) echo "--dpi-desync=fake,split2 --dpi-desync-ttl=6" > "$CONFIG_DIR/strategy.conf" ;;
        25) echo "--dpi-desync=split2,disorder2,fake --dpi-desync-ttl=10 --dpi-desync-fooling=badsum,md5sig,ts" > "$CONFIG_DIR/strategy.conf" ;;
        26) echo "--dpi-desync=fake --dpi-desync-ttl=3" > "$CONFIG_DIR/strategy.conf" ;;
        27) echo "--dpi-desync=fake,split --dpi-desync-any-protocol --dpi-desync-ttl=5" > "$CONFIG_DIR/strategy.conf" ;;
        *) echo -e "${RED}✗ Неверный выбор${NC}"; return 1 ;;
    esac
    echo -e "${GREEN}✓ Стратегия применена успешно!${NC}"
    sleep 2
}

while true; do
    clear
    show_menu
    read -r choice
    
    case $choice in
        1) echo -e "${GREEN}Установка Zapret...${NC}" ;;
        2) echo -e "${GREEN}Запуск Zapret...${NC}" ;;
        3) echo -e "${RED}Остановка Zapret...${NC}" ;;
        4) echo -e "${CYAN}Проверка статуса...${NC}" ;;
        5) 
            show_strategies
            read -r strategy_choice
            if [ "$strategy_choice" != "0" ]; then
                apply_strategy "$strategy_choice"
            fi
            ;;
        6) echo -e "${MAGENTA}Ручная настройка...${NC}" ;;
        7) echo -e "${YELLOW}Обновление Zapret...${NC}" ;;
        8) echo -e "${RED}Удаление Zapret...${NC}" ;;
        0) echo -e "${WHITE}Выход...${NC}"; exit 0 ;;
        *) echo -e "${RED}✗ Неверный выбор. Попробуйте снова.${NC}"; sleep 2 ;;
    esac
done
