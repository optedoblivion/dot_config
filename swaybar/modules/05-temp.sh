## Temp module ##

function run() {
    TMP="$(sensors|grep CPU|awk '{ print $2 }'|cut -d '.' -f 1|sed s/+//g)"
    ICO="🌡️"
    echo "${ICO}${TMP}°C"
}
