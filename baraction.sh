#!/bin/bash

Date() {
	date -u +"󱪹 %a %d-%m-%Y"   
}

Time() {
	date -u +"󱑋 %H:%M:%S"
} 

Memory() {
mem=$(free -m | grep Mem | awk '{print $3}')
swap=$(free -m | grep Swap | awk '{print $3}')
	echo "$mem   $swap MiB" 
}

disk_usage() {

    disk=$(df -m /dev/sda3 | grep /dev/ | awk '{print ($3 / 1000)} ')
    echo " $disk"GB
}

ActiveWindow(){
	len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
	max_len=250
	if [ "$len" -gt "$max_len" ];then
		echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
	else
		echo -n "$(xdotool getwindowfocus getwindowname)"
	fi
}

#!/bin/bash

Battery() {
BATTERY_CAPACITY() {
 cat /sys/class/power_supply/BAT0/capacity
}
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

	for i in $(BATTERY_CAPACITY); do
		if [[ $i -le 100 ]] && [[ $i -ge 90 ]]; then
			case $BATTERY_STATUS in
				"Charging") echo "󰂅 $i%"
					    if [[ $i -eq 99 ]]; then
					    notify-send "Your battery is fully charged" "You can plug out your device ^_^"
					    fi ;;
				"Discharging") echo "󰁹 $i%";;
			esac
		elif [[ $i -le 90 ]] && [[ $i -ge 75 ]]; then
			case $BATTERY_STATUS in
				"Charging") echo "󰂋 $i%" ;;
				"Discharging") echo "󰂂 $i%"  ;;
			esac

		elif [[ $i -le 75 ]] && [[ $i -ge 60 ]]; then
			case $BATTERY_STATUS in
				"Charging") echo "󰂊 $i%" ;;
				"Discharging") echo "󰂀 $i%" ;;
			esac
		elif [[ $i -le 60 ]] && [[ $i -ge 50 ]]; then
			case $BATTERY_STATUS in
				"Charging") echo "󰂉 $i%" ;;
				"Discharging") echo "󰁿 $i%" ;;
			esac 
		elif [[ $i -le 50 ]] && [[ $i -ge 40 ]]; then
			case $BATTERY_STATUS in
				"Charging") echo "󰂉 $i%" ;;
				"Discharging") echo "󰁾 $i%" ;;
			esac
		elif [[ $i -le 40 ]] && [[ $i -ge 25 ]]; then
			case $BATTERY_STATUS in
				"Charging") echo "󰂈 $i%" ;;
				"Discharging") echo "󰁼 $i%" ;;
			esac
		elif [[ $i -le 25 ]] && [[ $i -ge 12 ]]; then
			case $BATTERY_STATUS in
				"Charging") echo "󰂆 $i%" ;;
				"Discharging") echo "󰁻 $i%"
					    if [[ $i -eq 25 ]]; then 
					    notify-send "Your battery is 25%!" "Hurry up to plug in your device"
					    fi ;;
			esac
		elif [[ $i -le 12 ]] && [[ $i -ge 1 ]]; then
			case $BATTERY_STATUS in
				"Charging") echo "+@bg=2; 󰂆 $i%" ;;
				"Discharging") echo "+@bg=2; 󰁺$i%"
					    notify-send -u critical "ATTENTION!" "YOUR BATTERY IS LOW!" ;;
			esac
		fi
		
	done
}

while true; do
    echo "+@bg=1; $(ActiveWindow) +|R$(disk_usage) $(Memory) $(Battery) +@bg=4; $(Date) +@bg=0; $(Time) "
	sleep 1
done

#    


