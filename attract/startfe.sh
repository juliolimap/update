#!/bin/bash
source /opt/gatools/include/includes.sh

video=

[[ -z $FE ]] && FE=$(get_config_value "$GA_CONF" frontend)

FE=${FE:-attract}

# Make sure the frontend exists if it's not LXDE
if [[ ! -d "$MOTHER_OF_ALL"/frontends/"$FE" ]] && [[ ! "$FE" =~ "lxde" ]] ; then
  log_ko "Can't start frontend $FE as it doesn't exist"
  return 1
fi

# Determine running environment
if [[ ! -z $DISPLAY ]] ; then
  video=X
else
  video=kms
fi

case "$FE" in
  attract) 
sudo cp -r "/home/arcade/shared/frontends/attract/bkp/attract.cfg" "/home/arcade/shared/frontends/attract"

    attract --config "$MOTHER_OF_ALL"/frontends/attract &>> "$LOG_DIR"/attract.log
    ;;
  lxde)
    startlxde
    ;;
  retrofe)
    RETROFE_PATH="$MOTHER_OF_ALL"/frontends/retrofe retrofe
    ;;
  pegasus)
    if [[ $video = kms ]] ; then
      pegasus_opts="-platform eglfs"
    fi
    pegasus-fe $pegasus_opts &>> "$LOG_DIR"/pegasus.log
    ;;
  *)
    log_ko "Atttempted to start a non existant frontend: $FE"
    exit 1
    ;;
esac
