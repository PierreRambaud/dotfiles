#!/usr/bin/env bash

# Works only for dual screen in 1920x1080
COMMAND="$1"
TEXT="$(xrandr | grep Screen)"
if [[ $TEXT =~ "current "([[:digit:]]+)[[:space:]]x[[:space:]]([[:digit:]]+) ]]; then
    WINDOW_X=${BASH_REMATCH[1]}
    WINDOW_Y=${BASH_REMATCH[2]}
fi

if [[ -z $WINDOW_X || -z $WINDOW_Y ]]; then
    echo "Failed..."
    exit 1
fi

function maximize {
    if [[ $1 -eq 1 ]]; then
        fluxbox-remote "Maximize"
    fi
}

pidof fluxbox &> /dev/null && {
    shopt -s nocasematch
    CURRENT_POSITION=$(xwininfo -id $(xdotool getactivewindow) -all)
    CURRENT_X=$([[ $CURRENT_POSITION =~ "Absolute upper-left X:  "([[:digit:]]+) ]] && echo ${BASH_REMATCH[1]})
    CURRENT_WIDTH=$([[ $CURRENT_POSITION =~ "Width: "([[:digit:]]+) ]] && echo ${BASH_REMATCH[1]})
    IS_MAXIMIZE=$([[ $CURRENT_POSITION =~ "Window state:" ]] && echo 1)

    HALF_WINDOW=$(echo $WINDOW_X / 2 | bc)

    case $COMMAND in
        left)
            if [[ $CURRENT_X -ge $HALF_WINDOW ]]; then
                maximize $IS_MAXIMIZE
                VALUE=$(echo $HALF_WINDOW-$CURRENT_WIDTH | bc)
                if [[ $VALUE == 0 ]]; then
                    VALUE=$HALF_WINDOW
                fi

                fluxbox-remote "MoveTo -$VALUE * Left"
                maximize $IS_MAXIMIZE
            fi
            ;;
        right)
            if [[ $CURRENT_X -le $HALF_WINDOW ]]; then
                maximize $IS_MAXIMIZE
                VALUE=$(echo $HALF_WINDOW+$CURRENT_WIDTH | bc)
                fluxbox-remote "MoveTo $VALUE * Left"
                maximize $IS_MAXIMIZE
            fi
            ;;
        *)
            echo "$PROG: <command> must be Left, Right, Top or Bottom" >&2
            exit 1
    esac

    exit 0
}
