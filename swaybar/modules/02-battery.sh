## Battery Module ##

function run() {
    TIME=""
    STATE=$(acpi | awk '{ print $3 }' | sed s/,//g)
    if [ "$STATE" != "Discharging" ]; then
        PERCENT=$(acpi | awk ' {print $4 }' | sed s/,//g)
        ICO="⚡"
    else
        PERCENT=$(acpi | awk ' {print $4 }' | sed s/,//g)
        NUM=$(echo $PERCENT|sed s/\%//)
        if [ "$NUM" -gt "75" ]; then
            ICO="🔋"
            BATTERY_CRITICAL=$(ls /tmp|grep battery_critical)
            if [ "$BATTERY_CRITICAL" != "" ]; then
                rm /tmp/battery_critical
            fi
        elif [ "$NUM" -gt "20" ]; then
            ICO="🔋"
            BATTERY_CRITICAL=$(ls /tmp|grep battery_critical)
            if [ "$BATTERY_CRITICAL" != "" ]; then
                rm /tmp/battery_critical
            fi
        elif [ "$NUM" -gt 5 ]; then
            ICO="🪫"
            BATTERY_CRITICAL=$(ls /tmp|grep battery_critical)
            if [ "$BATTERY_CRITICAL" == "" ]; then
                swaynag -m "You battery state is critical $PERCENT left."
                touch /tmp/battery_critical
            fi
            COLOR="$COLOR_ERROR"
        else
            ICO="🪫"
            swaynag -m "You battery state is critical $PERCENT left; System hibernating!"
            sleep 5
            systemctl suspend-then-hibernate
        fi
    fi
    echo "${ICO}${PERCENT}"
}
