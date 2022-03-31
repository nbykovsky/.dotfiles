with import <nixpkgs> {};


writeShellScriptBin "toggle_touchpad" ''
  touchpadname=$(get_touchpad_device)
  if [ -z "$touchpadname" ]
  then
    echo "NA"
  elif [ $(xinput list-props "$touchpadname" | grep 'Device Enabled' | gawk -F ':' '{ print $2 }') -eq 1 ]
  then
    xinput disable "$touchpadname"
  else
    xinput enable "$touchpadname"
  fi

''
