SUMMARY = "Install and start a systemd service"
SECTION = "app"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd
SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE_${PN} = "psplash-start.service"

SRC_URI_append = " file://psplash-start.service"
FILES_${PN} += "${systemd_unitdir}/system/psplash-start.service \
		${systemd_unitdir}/system/sysinit.target.wants \
"	

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://psplash-davide-img.png"
FILES_${PN} += "${systemd_unitdir}/system/psplash-davide-img.png"

do_install_append() {
  install -d ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/psplash-start.service ${D}/${systemd_unitdir}/system
  install -d ${D}/${systemd_unitdir}/system/sysinit.target.wants
  ln -sf  ../psplash-start.service ${D}/${systemd_unitdir}/system/sysinit.target.wants

  # Load the splash screen in the same destination directory as the service
  install -d ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/psplash-davide-img.png ${D}/${systemd_unitdir}/system
}

RDEPENDS_${PN} += "fbida"

REQUIRED_DISTRO_FEATURES= "systemd"

