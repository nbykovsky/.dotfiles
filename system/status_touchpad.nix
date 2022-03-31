with import <nixpkgs> {};


writeShellScriptBin "status_touchpad" ''
  touchpadname=$(get_touchpad_device)
  if [ -z "$touchpadname" ]
  then
    echo "NA"
  elif [ $(xinput list-props "$touchpadname" | grep 'Device Enabled' | gawk -F ':' '{ print $2 }') -eq 1 ]
  then
    echo "ﳶ"
  else
    echo "--"
  fi
''

