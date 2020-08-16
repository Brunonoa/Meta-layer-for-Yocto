#!/bin/bash

sleep 10

systemctl enable getty@ttyGS0.service

systemctl start fbcp.service

#Configure qt5-environment
sh /etc/profile.d/qt5-env.sh

# Maybe we can do a separate service
# forum.qt.io/topic/108039/unable-to-play-audio-on-embedded-device-using-pulseaudio-audi$
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
     echo "Starting dbus"
     export $(dbus-launch)
fi

/usr/bin/pulseaudio -D --start

#/usr/bin/psplash

#Main application
/usr/bin/gallery-mobile
