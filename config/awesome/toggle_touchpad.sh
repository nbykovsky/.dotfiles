# toggle-touchpad script
#
# Toggles the touchpad on and off. Bind this script to a key to turn on and off
# your touchpad/trackpad. The F7 key is a good choice on the XPS13.

# This is the version for Ubuntu MATE on the Dell XPS13 9360
# ##########################################################
# Larry Bushey
#
if [ $(xinput list-props "DLL06E4:01 06CB:7A13 Touchpad" | grep 'Device Enabled' | gawk -F ':' '{ print $2 }') -eq 0 ]; then
xinput enable "DLL06E4:01 06CB:7A13 Touchpad"
#notify-send --icon=/usr/share/icons/mate/scalable/actions/touchpad-enabled.svg "Enabled" "Your computer's touchpad is enabled."
else
xinput disable "DLL06E4:01 06CB:7A13 Touchpad"
# notify-send --icon=/usr/share/icons/mate/scalable/actions/touchpad-disabled.svg "Disabled" "Your computer's touchpad is disabled."
fi
