dir=~/Photos/Screenshots/$(date +"%Y%d%m-%H%M%S")-selected.jpg
shot=$(scrot -q 100 -s -b --freeze $dir)
notify-send "Your screenshot was uploaded in" "$dir"
