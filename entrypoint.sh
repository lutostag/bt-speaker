#!/bin/sh

#dbus-daemon --system
#/usr/lib/bluetooth/bluetoothd
su - pulse -c "dbus-daemon --session --fork; pulseaudio --fail -D; bt_speaker; sh"
sh
