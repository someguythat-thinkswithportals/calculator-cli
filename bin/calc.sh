#!/bin/bash

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # NC = no color

#log_file
LOG_FILE="calc_history.txt"

# clean the screen
clear

# now the code itself

PI=$(echo "scale=10; 4*a(1)" | bc -l)

while true; do
    clear
    echo -e "${BLUE}====================================${NC}"
    echo -e "${YELLOW}      a CLI bash calculator        ${NC}"
    echo -e "${BLUE}====================================${NC}"
    echo -e "1) basic math (Add/Sub/Mult/Div)"
    echo -e "2) advanced math  (Power/Sqrt/Trig)"
    echo -e "3) ${GREEN}unit conversions${NC}"
    echo -e "4) view history"
    echo -e "5) ${RED}clear History${NC}"
    echo -e "6) ${RED}exit${NC}"
    echo -e "${BLUE}------------------------------------${NC}"
    echo -e "        by ${BLUE}someguythat-thinkswithportals${NC}"
    echo -e "${BLUE}------------------------------------${NC}"

    read -p "select your option: " main_choice

    case $main_choice in
        1) # basic math
            read -p "num 1: " n1
            read -p "operator (+ - * /): " op
            read -p "num 2: " n2
            res=$(echo "scale=2; $n1 $op $n2" | bc -l)
            label="$n1 $op $n2"
            ;;

        2) # advanced math
            echo -e "a) power (^)  b) sqrt  c) Sin  d) cos"
            read -p "choice [a-d]: " adv_choice
            read -p "enter number (or degrees for sin/cos): " n1
            
            case $adv_choice in
                a) read -p "enter power: " n2
                   res=$(echo "scale=2; $n1 ^ $n2" | bc -l); label="$n1^$n2" ;;
                b) res=$(echo "scale=4; sqrt($n1)" | bc -l); label="sqrt($n1)" ;;
                c) rad=$(echo "scale=10; $n1 * ($PI/180)" | bc -l)
                   res=$(echo "scale=4; s($rad)" | bc -l); label="sin($n1)" ;;
                d) rad=$(echo "scale=10; $n1 * ($PI/180)" | bc -l)
                   res=$(echo "scale=4; c($rad)" | bc -l); label="cos($n1)" ;;
            esac
            ;;

        3) # unit conversions
            echo -e "\n1) celsius to fahrenheit   2) fahrenheit to celsius"
            echo -e "3) kilometers to miles     4) kg to lbs"
            echo -e "5) lbs to kg"
            read -p "choice: " unit_choice
            read -p "enter the value: " val
            
            case $unit_choice in
                1) res=$(echo "scale=2; ($val * 9/5) + 32" | bc -l); label="${val}C to F";;
                2) res=$(echo "scale=2; ($val - 32) * 5/9" | bc -l); label="${val}F to C";;
                3) res=$(echo "scale=2; $val * 0.621371" | bc -l); label="${val}km to miles";;
                4) res=$(echo "scale=2; $val * 2.20462" | bc -l); label="${val}kg to lbs";;
                5) res=$(echo "scale=2; $val / 2.20462" | bc -l); label="${val}lbs to kg";;
                *) echo -e "${RED}invalid unit${NC}"; sleep 1; continue;;
            esac
            ;;



        4) # view history
            echo -e "${YELLOW}--- history ---${NC}"
            [ -f "$LOG_FILE" ] && tail -n 10 "$LOG_FILE" || echo "history is empty :("
            read -p "press enter..."; continue ;;

        5) # clear history
            rm -f "$LOG_FILE"
            echo -e "${RED}history cleared!${NC}"; sleep 1; continue ;;

        6) break ;;
        *) continue ;;
    esac

    # output and the logging
    if [ ! -z "$res" ]; then
        echo -e "${GREEN}result: $res${NC}"
        echo "$(date '+%Y-%m-%d %H:%M:%S') | $label = $res" >> "$LOG_FILE"
        unset res # clear variable for next loop
    fi
    read -p "Press Enter..." p
done

# end of the code