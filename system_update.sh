
THIS_SCRIPT=$(readlink -f "$0")
THIS_SCRIPT_PATH=$(dirname "$THIS_SCRIPT")
. "$THIS_SCRIPT_PATH/system_common.sh"

sudo nixos-rebuild --upgrade-all "$REBUILD_COMMAND" -I $SYS_CONFIG_PATH

