#!/usr/bin/env bash
# Installs the git hooks for the Waybar configuration repository

REPO_ROOT=$(git rev-parse --show-toplevel)
HOOKS_DIR="${REPO_ROOT}/.git/hooks"
PRE_COMMIT_SRC="${REPO_ROOT}/tests/pre-commit"
PRE_COMMIT_DEST="${HOOKS_DIR}/pre-commit"

echo "Installing git hooks..."

if [ ! -d "$HOOKS_DIR" ]; then
    echo "Error: .git/hooks directory not found. Is this a git repository?"
    exit 1
fi

# Make the source hook executable
chmod +x "$PRE_COMMIT_SRC"

# Create a symlink to the hook
ln -sf "$PRE_COMMIT_SRC" "$PRE_COMMIT_DEST"

# Ensure the destination is executable (just in case)
chmod +x "$PRE_COMMIT_DEST"

echo "✅ Pre-commit hook installed successfully at $PRE_COMMIT_DEST"
