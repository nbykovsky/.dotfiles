with import <nixpkgs> {};

writeShellScriptBin "get_touchpad_device" ''
 echo $(xinput list | grep -e "Touchpad\|touchpad" | gawk -F '  ' '{ print $2 }' | sed 's/↳//g' | xargs)
''

