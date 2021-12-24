
source ./system_common.sh

sudo nixos-rebuild --upgrade-all "$REBUILD_COMMAND" -I $SYS_CONFIG_PATH

