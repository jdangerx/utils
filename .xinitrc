if [ -f ~/.ibus-env.sh ]; then
    . ~/.ibus-env.sh
fi

feh --bg-fill ~/.wallpaper/barkley2_concept_ridge.png &
xrdb -merge ~/.xresources &
# redshift -l 37.42:-122.14 & # Palo Alto
redshift -l 40.71:-74.01 & # New York
xset b off &
setxkbmap -option ctrl:nocaps -option compose:ralt &
ibus-daemon -drx &
xss-lock -- i3lock -c c7e2db &
exec i3
