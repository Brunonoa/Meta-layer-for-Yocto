SUMMARY = "Install and start the application"
SECTION = "app"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd
SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE_${PN} = "application.service"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

#Service for starting the main application
SRC_URI_append = " file://application.service \
		   file://application.timer \
		   file://application.sh \
		   file://psplash \
		   file://gallery-mobile \
"
FILES_${PN} += "${systemd_unitdir}/system/application.service \
		${systemd_unitdir}/system/application.timer \
		/usr/bin/application.sh \
		/usr/bin/pslash \
		/usr/bin/gallery-mobile \
"	

do_install_append() {
  install -d ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/application.service ${D}/${systemd_unitdir}/system
  install -m 0644 ${WORKDIR}/application.timer ${D}/${systemd_unitdir}/system

  # Install the application files
  install -d ${D}/usr/bin
  install -m 0755 ${WORKDIR}/application.sh ${D}/usr/bin

  # Install the application files
  install -d ${D}/usr/bin
  install -m 0755 ${WORKDIR}/gallery-mobile ${D}/usr/bin
  install -m 0755 ${WORKDIR}/psplash ${D}/usr/bin
}

REQUIRED_DISTRO_FEATURES= "systemd"

RDEPENDS_${PN} += "bash libraries qt5-env"

