
TARGET_USER="jorri"

if [ "$USER" != "$TARGET_USER" ]; then
    echo "WARNING Running as user '$USER', but target user is '$TARGET_USER'"
fi

THIS_SCRIPT=$(readlink -f "$0")
THIS_SCRIPT_PATH=$(dirname "$THIS_SCRIPT")
HOME_MANAGER_TARGET="$THIS_SCRIPT_PATH/users/$TARGET_USER"

CONFIG_DIR="$HOME/.config"
HOME_MANAGER_LINK_NAME="$CONFIG_DIR/nixpkgs"

LINK_HOME_MANGER=1

if [ -L "$HOME_MANAGER_LINK_NAME" ]; then
# Check if the target is a link

    # Check if the current link points to our target
    LINK_TO=$(readlink -f "$HOME_MANAGER_LINK_NAME")
    if [ "$LINK_TO" = "$HOME_MANAGER_TARGET" ]; then
        LINK_HOME_MANGER=0
    else
        echo "Target '$HOME_MANAGER_LINK_NAME' is aready a link, but does not link to the expected target '$HOME_MANAGER_TARGET'"
        exit 1
    fi
elif [ -d  "$HOME_MANAGER_LINK_NAME" ]; then
    echo "Cannot create link for home-manager config at: '$HOME_MANAGER_LINK_NAME', target is a directory."
    exit 1
fi



if [ "$LINK_HOME_MANGER" -ne "0" ]; then
    ln -sv "$HOME_MANAGER_TARGET" "$HOME_MANAGER_LINK_NAME"
else
    echo "'$HOME_MANAGER_LINK_NAME' already links to '$HOME_MANAGER_TARGET'"
fi

home-manager switch
