#!/bin/sh

THIS_SCRIPT=$(readlink -f "$0")
THIS_SCRIPT_PATH=$(dirname "$THIS_SCRIPT")
. "$THIS_SCRIPT_PATH/user_common.sh"

home-manager switch
