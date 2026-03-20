#!/usr/bin/env bash
# Muramasa Waybar Configuration Test Suite

set -e

CONFIG_DIR="${HOME}/.config/waybar"
CONFIG_FILE="${CONFIG_DIR}/config"
STYLE_FILE="${CONFIG_DIR}/style.css"

echo "Running Muramasa Waybar Tests..."
echo "--------------------------------"

# 1. Test JSON Validity
echo "[Test 1] Validating JSON syntax of config file..."
if jq . "$CONFIG_FILE" > /dev/null 2>&1; then
    echo "  ✓ JSON syntax is valid."
else
    echo "  ✗ ERROR: Invalid JSON syntax in config file."
    exit 1
fi

# 2. Test CSS Exists and is not empty
echo "[Test 2] Validating CSS style file..."
if [ -s "$STYLE_FILE" ]; then
    echo "  ✓ CSS file exists and is not empty."
else
    echo "  ✗ ERROR: CSS file is missing or empty."
    exit 1
fi

# 3. Test Modules Referenced
echo "[Test 3] Validating all modules referenced in layout are defined..."
defined_modules=$(jq -r 'keys[]' "$CONFIG_FILE" | grep -v 'layer\|position\|height\|spacing\|modules-left\|modules-center\|modules-right')
referenced_modules=$(jq -r '.["modules-left"][], .["modules-center"][], .["modules-right"][]' "$CONFIG_FILE" | grep -v 'sway/workspaces\|sway/mode\|tray\|network\|disk\|backlight\|idle_inhibitor\|bluetooth\|clock')

for module in $referenced_modules; do
    if [[ "$module" == group/* ]]; then
        # For groups, check if the group itself is defined
        if jq -e --arg m "$module" '.[$m]' "$CONFIG_FILE" > /dev/null 2>&1; then
            # Get submodules inside the group
            group_modules=$(jq -r --arg m "$module" '.[$m].modules[]' "$CONFIG_FILE")
            for submod in $group_modules; do
                if ! jq -e --arg sm "$submod" '.[$sm]' "$CONFIG_FILE" > /dev/null 2>&1; then
                    # Standard waybar built-ins don't need definitions, but custom ones do
                    if [[ "$submod" == custom/* ]]; then
                        echo "  ✗ ERROR: Custom module '$submod' is referenced in '$module' but not defined."
                        exit 1
                    fi
                fi
            done
        else
            echo "  ✗ ERROR: Group module '$module' is referenced but not defined."
            exit 1
        fi
    else
        # For non-groups
        if ! jq -e --arg m "$module" '.[$m]' "$CONFIG_FILE" > /dev/null 2>&1; then
             if [[ "$module" == custom/* ]]; then
                 echo "  ✗ ERROR: Custom module '$module' is referenced but not defined."
                 exit 1
             fi
        fi
    fi
done
echo "  ✓ Module definitions are valid."

# 4. Test Runtime (waybar -c)
echo "[Test 4] Verifying Waybar Runtime without critical errors..."
timeout 3 waybar -c "$CONFIG_FILE" -s "$STYLE_FILE" > /tmp/waybar_test.log 2>&1 || true

if grep -iE '\[error\]|\[critical\]' /tmp/waybar_test.log | grep -v 'GDBus' | grep -v 'requires objectValue' | grep -v 'No icon name' > /dev/null; then
    echo "  ✗ ERROR: Waybar startup generated errors:"
    grep -iE '\[error\]|\[critical\]' /tmp/waybar_test.log | grep -v 'GDBus' | grep -v 'requires objectValue' | grep -v 'No icon name'
    exit 1
else
    echo "  ✓ Waybar starts up without critical configuration errors."
fi

echo "--------------------------------"
echo "All tests passed successfully!"
exit 0
