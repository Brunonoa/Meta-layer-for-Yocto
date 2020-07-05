#!/bin/sh

export PATH=${PATH}:/usr/bin/qt5

# the other option is linuxfb if just using qt widgets
export QT_QPA_PLATFORM=eglfs

# physical width and height units are mm

# for the official Pi 7" touchscreen
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=155
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=86

# for the pitft35r 480x320 touchscreen
#export QT_QPA_EGLFS_WIDTH=480
#export QT_QPA_EGLFS_HEIGHT=320
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=85
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=50
# set a rotate value appropriate with the one used in the overlay 
#export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/touchscreen0:rotate=90

# for the pitft28r 320x240 touchscreen
#export QT_QPA_EGLFS_WIDTH=320
#export QT_QPA_EGLFS_HEIGHT=240
#export QT_QPA_EGLFS_PHYSICAL_WIDTH=78
#export QT_QPA_EGLFS_PHYSICAL_HEIGHT=50
# set a rotate value appropriate with the one used in the overlay 
#export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/touchscreen0:rotate=90

export TSLIB_CONFFILE=/etc/ts.conf
export TSLIB_CALIBFILE=/etc/pointercal
export TSLIB_CONSOLEDEVICE=none
export TSLIB_FBDEVICE=/dev/fb0
export TSLIB_TSDEVICE=/dev/input/touchscreen0
export TSLIB_PLUGINDIR=/usr/lib/ts
#export QWS_MOUSE_PROTO='Tslib:/dev/input/event0'

#export QT_QPA_EGLFS_DISABLE_INPUT=1
export QT_QPA_EGLFS_NO_LIBINPUT=1
export QT_QPA_FB_TSLIB=1
#export QT_QPA_EGLFS_HIDECURSOR=1
#export QT_QPA_EVDEV_MOUSE_PARAMETERS=abs
export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=/dev/input/touchscreen0:rotate=270

if [ -z "${XDG_RUNTIME_DIR}" ]; then
    export XDG_RUNTIME_DIR=/tmp/user/${UID}

    if [ ! -d ${XDG_RUNTIME_DIR} ]; then
        mkdir -p ${XDG_RUNTIME_DIR}
    fi
fi
