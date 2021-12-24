
source ./system_common.sh

sudo nixos-rebuild "$REBUILD_COMMAND" -I $SYS_CONFIG_PATH
