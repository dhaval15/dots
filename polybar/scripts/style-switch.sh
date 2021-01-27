#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/scripts"

# Launch Rofi
MENU="$(printf "Default\nNord\nGruvbox\nDark\nCherry\nTransperent" | dmenu -i -p 'Theme')"
            case "$MENU" in
				*Default) "$SDIR"/styles.sh --default ;;
				*Nord) "$SDIR"/styles.sh --nord ;;
				*Gruvbox) "$SDIR"/styles.sh --gruvbox ;;
				*Dark) "$SDIR"/styles.sh --dark ;;
				*Cherry) "$SDIR"/styles.sh --cherry ;;
				*Transperent) "$SDIR"/styles.sh --transperent ;;
            esac
