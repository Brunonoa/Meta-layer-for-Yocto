SUMMARY = "Install and start a systemd service"
SECTION = "app"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd
SYSTEMD_AUTO_ENABLE = "disable"
SYSTEMD_SERVICE_${PN} = "fbcp.service"

SRC_URI_append = " file://fbcp.service "
FILES_${PN} += "${systemd_unitdir}/system/fbcp.service"

do_install_append() {
  install -d ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/fbcp.service ${D}/${systemd_unitdir}/system
}

#RDEPENDS_${PN} += "fbcp"

REQUIRED_DISTRO_FEATURES= "systemd"
