DESCRIPTION = "Setup a default (german) keyboard-layout for the console only"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"

inherit systemd

PV = "0.2"
PACKAGE_ARCH = "voisee"
SRCREV = "HEAD"

SRC_URI = "file://kbdlayout.service \
           file://it.bmap \
          "

do_install () {
    install -d ${D}/${sysconfdir}
    install -m 0755 ${WORKDIR}/it.bmap ${D}/${sysconfdir}/keymap.map

    install -d ${D}/${base_libdir}/systemd/system
    install -m 0644 ${WORKDIR}/kbdlayout.service ${D}/${base_libdir}/systemd/system/
}

NATIVE_SYSTEMD_SUPPORT = "1"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = "kbdlayout.service"

FILES_${PN} += "${base_libdir}/systemd"
