## wifi monitoring module ##

## Colors

run() {
    MAX="255"
    SIGNAL=$(iwconfig wlp0s20f3 | grep Signal | cut -d '=' -f 3 | awk '{ print $1}' | sed s/-//g)
    PERCENT=$(echo "scale=2; ($SIGNAL/$MAX) * 100" | bc)
    PERCENT=$(echo "$PERCENT" | cut -d '.' -f 1)
    PERCENT=$(echo "100 - $PERCENT" | bc)
    ICO="📶"
    COLOR="$COLOR_WIFI_FULL"
    if [ $PERCENT -lt 66 ]; then
        ICO="^i($ICONPATH/wifi_half.xbm)"
        COLOR="$COLOR_WIFI_HALF"
        if [ $PERCENT -lt 33 ]; then
            ICO="^i($ICONPATH/wifi_low.xbm)"
            COLOR="$COLOR_WIFI_LOW"
        fi
    fi
    echo "${ICO}${PERCENT}%"
}
