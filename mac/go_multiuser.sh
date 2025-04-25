CONFIG_DIR = "${HOME}/.config"
mkdir -p "$CONFIG_DIR/fish/functions"
ln -s "{$SCRIPT_DIR}/brew.fish" "{$CONFIG_DIR}/fish/functions/brew.fish"
