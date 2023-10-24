mem=$(free -m | grep Mem | awk '{print $3}')
swap=$(free -m | grep Swap | awk '{print $3}')

echo "  $mem | $swap MiB"
