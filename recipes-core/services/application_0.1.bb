SUMMARY = "Install and start the application"
SECTION = "app"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd
SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE_${PN} = "application.service"

SRC_URI_append = " file://application.service"
FILES_${PN} += "${systemd_unitdir}/system/application.service"	

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://application.sh"
FILES_${PN} += "/usr/bin/application.sh"

do_install_append() {
  install -d ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/application.service ${D}/${systemd_unitdir}/system

  # Load the splash screen in the same destination directory as the service
  install -d ${D}/usr/bin
  chmod +x ${WORKDIR}/application.sh
  install -m 0644 ${WORKDIR}/application.sh ${D}/usr/bin
}

REQUIRED_DISTRO_FEATURES= "systemd"

