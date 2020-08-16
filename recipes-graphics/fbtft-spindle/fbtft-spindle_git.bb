SUMMARY = "Raspberry Pi Keyboard with GPIO"
DESCRIPTION = "This program used for turn GPIO into keyboard button"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI[md5sum] = "2303194b786760290e36557be5c7651f"
SRC_URI = "https://github.com/Brunonoa/fbtft-spindle;protocol=https"

DEPENDS = "virtual/libgles2"

# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
EXTRA_OECMAKE = ""
