#!/bin/bash

#Configure the qt5 environment in particular the touchscreen
/etc/profile.d/qt5-env.sh

#enable serial getty console service
systemctl enable getty@ttyGS0.service

#Main application
/usr/bin/gallery-mobile


#while :
#do
#       echo "BAU" > /dev/ttyGS0
#       sleep 10
#done

#minicom -D /dev/ttyGS0 for opening console

#use /dev/ttyGS0 on the gadget side 
#use /dev/ttyACM0 on the host side


