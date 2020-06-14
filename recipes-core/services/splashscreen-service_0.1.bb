SUMMARY = "Install and start a systemd service for splash screen"
SECTION = "app"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd
SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE_${PN} = "splashscreen.service"

SRC_URI_append = " file://splashscreen.service"
FILES_${PN} += "${systemd_unitdir}/system/splashscreen.service"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://psplash-davide-img.png"
FILES_${PN} += "${systemd_unitdir}/system/psplash-davide-img.png"

do_install_append() {
  install -d ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/splashscreen.service ${D}/${systemd_unitdir}/system

  # Load the splash screen in the same destination directory as the service
  install -d ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/psplash-davide-img.png ${D}/${systemd_unitdir}/system
}

REQUIRED_DISTRO_FEATURES= "systemd"
