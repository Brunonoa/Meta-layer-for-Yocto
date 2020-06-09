SUMMARY = "Raspberry Pi Framebuffer Copy"
DESCRIPTION = "This program used for copy primary framebuffer to secondary framebuffer (eg. FBTFT). It require lastest raspberry pi firmware (> 2013-07-11) to working properly."
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI = "git://github.com/tasanakorn/rpi-fbcp.git;protocol=https \
		   file://0001-Use-pkgconfig-to-detect-EGL.patch \
"

DEPENDS = "virtual/libgles2"

# Modify these as desired
PV = "1.0+git${SRCPV}"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

inherit cmake

# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
EXTRA_OECMAKE = ""