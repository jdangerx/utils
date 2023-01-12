#! /usr/bin/env bash
set -x

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
mkdir -p "${HOME}/Library/Application Support/Rectangle/"
ln -s ${SCRIPT_DIR}/RectangleConfig.json "${HOME}/Library/Application Support/Rectangle/RectangleConfig.json"

CONFIG_DIR="${HOME}/.config"
mkdir -p $CONFIG_DIR

# because nvim is a directory, we link it directly into the config dir
ln -s "${SCRIPT_DIR}/nvim" "${CONFIG_DIR}"

mkdir -p "${CONFIG_DIR}/karabiner"
ln -s "${SCRIPT_DIR}/karabiner.json" "${CONFIG_DIR}/karabiner/karabiner.json"

ln -s "${SCRIPT_DIR}/tmux.conf" "${HOME}/.tmux.conf"

