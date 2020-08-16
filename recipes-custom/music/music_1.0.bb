SUMMARY = "Install and start the application"
SECTION = "app"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI += "file://Music file://ExtraMusic"

do_install() {
    install -d ${D}/home/root
    cp -r ${WORKDIR}/Music ${D}/home/root
    cp -r ${WORKDIR}/ExtraMusic ${D}/home/root
}
FILES_${PN} += "/home/root/Music /home/root/ExtraMusic"
