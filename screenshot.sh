
# You can specify own directory for moving pics
dir=~/Photos/Screenshots/$(date +"%Y%d%m-%H%M%S").jpg

# this script take your screen in high quality
shot=$(scrot -q 100 $dir)

# if you have dunst, you can make a notify where is your picture placed
notify-send  -i $dir "Your screen" "dsa"

