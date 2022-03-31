with import <nixpkgs> {};

writeShellScriptBin "get_touchpad_device" ''
 echo $(xinput list | grep -e "Touchpad\|touchpad" | gawk -F '  ' '{ print $2 }' | sed 's/↳//g' | xargs)
'';

writeShellScriptBin "status_touchpad" ''
  touchpadname=$(./get_touchpad_device.sh)
  if [ -z "$touchpadname" ]
  then
    echo "NA"
  elif [ $(xinput list-props "$touchpadname" | grep 'Device Enabled' | gawk -F ':' '{ print $2 }') -eq 1 ]
  then
    echo "ﳶ"
  else
    echo "--"
  fi
'';

writeShellScriptBin "toggle_touchpad" ''
  touchpadname=$(./get_touchpad_device.sh)
  if [ $(xinput list-props "$touchpadname" | grep 'Device Enabled' | gawk -F ':' '{ print $2 }') -eq 0 ]; then
  xinput enable "$touchpadname"
  else
  xinput disable "$touchpadname"
  fi

    touchpadname=$(./get_touchpad_device.sh)
  if [ -z "$touchpadname" ]
  then
    echo "NA"
  elif [ $(xinput list-props "$touchpadname" | grep 'Device Enabled' | gawk -F ':' '{ print $2 }') -eq 1 ]
  then
    xinput disable "$touchpadname"
  else
    xinput enable "$touchpadname"
  fi

'';
