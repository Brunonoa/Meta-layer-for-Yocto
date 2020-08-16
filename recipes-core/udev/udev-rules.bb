DESCRIPTION = "udev rules for Freescale i.MX SOCs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " file://50-fbcp.rules \
	file://10-console.rules \
"

S = "${WORKDIR}"

do_install () {
	install -d ${D}${sysconfdir}/udev/rules.d
	install -m 0644 ${WORKDIR}/10-console.rules ${D}${sysconfdir}/udev/rules.d/
	install -m 0644 ${WORKDIR}/50-fbcp.rules ${D}${sysconfdir}/udev/rules.d/
}

#minicom -D /dev/ttyGS0 for opening console

#use /dev/ttyGS0 on the gadget side 
#use /dev/ttyACM0 on the host side
