## ALSA monitoring module ##

## Colors
COLOR_MUTE="^fg(red)"

function run() {

    ismute=$(amixer get Master|grep %|awk '{ print $6 }'|sed 's/\[//g'|sed 's/\]//g'|uniq)
    if [ "$ismute" == "off" ]; then
        VBS="0"
        ICO="🔇"
    else
        VBS=$(amixer get Master|grep %|awk '{ print $5 }'|sed 's/%//g'|sed 's/\[//g'|sed 's/\]//g')

        if [ $VBS -lt 50 ]; then
            ICO="🔉"
        elif [ $VBS -lt 30 ]; then
            ICO="🔈"
        else
            ICO="🔊"
        fi
    fi


    VBAR="$VBS%"
    #echo "$COLOR$VICO $VBAR"
    echo "${ICO}${VBAR}"
}
