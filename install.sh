#!/bin/sh -e

START_DIR="$(pwd -P)"
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "${BASE_DIR}"

for i in _*; do
        NEW_NAME="$HOME/$(echo "$i" | sed s/_/./)"
        if [ -e "$NEW_NAME" ]; then
                mv "${NEW_NAME}" "${NEW_NAME}.bak" && echo "Moved old ${NEW_NAME} to ${NEW_NAME}.bak."
        fi
done

ln -s "$BASE_DIR/_muttrc" "$HOME/.muttrc"
cp "$BASE_DIR/_mutt_secrets" "$HOME/.mutt_secrets"

cd "${START_DIR}"
