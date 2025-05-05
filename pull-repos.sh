#!/bin/bash

# List of repository URLs (replace with your GitHub repo URLs)
REPOS=(
	"https://github.com/rwfeldmann/zsh-rc.git"
	"https://github.com/rwfeldmann/zsh-aliases.git"
	"https://github.com/rwfeldmann/vim-rc.git"
	"https://github.com/rwfeldmann/input-rc.git"
	"https://github.com/rwfeldmann/my-tmux-conf.git"
)

# Directory to store repositories
REPO_DIR="$HOME/git"

# Create the directory if it doesn't exist
mkdir -p "$REPO_DIR"

# Loop through each repository
for REPO in "${REPOS[@]}"; do
    # Extract repo name from URL
    REPO_NAME=$(basename "$REPO" .git)

    # Check if the repository directory already exists
    if [ -d "$REPO_DIR/$REPO_NAME" ]; then
        echo "Updating $REPO_NAME..."
        cd "$REPO_DIR/$REPO_NAME" || exit
        git pull
    else
        echo "Cloning $REPO_NAME..."
        git clone "$REPO" "$REPO_DIR/$REPO_NAME"
    fi
done

echo "All repositories have been processed."

