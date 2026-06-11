#!/bin/bash

# Temperatur
TEMP=$(sensors 2>/dev/null | awk '
/Package id 0:/ {
    gsub("\\+","",$4)
    gsub("°C","",$4)
    print int($4)
    exit
}
/Tctl:/ {
    gsub("\\+","",$2)
    gsub("°C","",$2)
    print int($2)
    exit
}')

[ -z "$TEMP" ] && TEMP="?"

# CPU-Auslastung
CPU=$(top -bn1 | awk '/Cpu\(s\)/ {print int(100-$8)}')

# RAM-Nutzung
RAM=$(free -h | awk '/Mem:/ {print $3}')

# Farbe je nach Temperatur
if [ "$TEMP" != "?" ]; then
    if [ "$TEMP" -lt 50 ]; then
        COLOR="lime"
    elif [ "$TEMP" -lt 70 ]; then
        COLOR="orange"
    else
        COLOR="red"
    fi
else
    COLOR="white"
fi

echo "<txt><span foreground='$COLOR'>${TEMP}°C</span> | CPU ${CPU}% | RAM ${RAM}</txt>"

echo "<tool>
System-Monitor

Temperatur: ${TEMP}°C
CPU: ${CPU}%
RAM: ${RAM}

Grün   = unter 50°C
Orange = 50-69°C
Rot    = ab 70°C
</tool>"