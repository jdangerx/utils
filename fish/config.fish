set fish_greeting
set -x MOZ_ENABLE_WAYLAND 1
set -x GDK_SCALE 1

set -x PATH ~/.local/bin ~/.emacs.d/bin $PATH

set -x FZF_DEFAULT_COMMAND "ag -l --ignore 'Larian Studios' --ignore 'Bitwig Studio' --ignore 'aur' --hidden"

set -x GTK_IM_MODULE ibus
set -x XMODIFIERS ibus
set -x QT_IM_MODULE ibus
