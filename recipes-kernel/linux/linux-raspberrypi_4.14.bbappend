SUMMARY = "Add tft waveshare 3.5a"
SECTION = "patch"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-raspberrypi_4.14:"

SRC_URI += "file://0002-Update-dtb-overlays-makefile.patch \
	    file://waveshare35a.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
	    file://tft24-resistive.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
"

RPI_PITFT35 ?= ""
RPI_NO_CONSOLE ?= ""

# per aggiungere cosole su seriale console=serial0,115200
CMDLINE="dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait fbcon=font:ProFont6x11 logo.nologo"

CMDLINE_append = ' ${@oe.utils.conditional("RPI_NO_CONSOLE", "1", "consoleblank=0 loglevel=1 quiet", "", d)}'
#CMDLINE_append += ' ${@oe.utils.conditional("RPI_PITFT35", "1", "fbcon=map:10", "", d)}'

do_deploy_append() {
	install -d ${DEPLOYDIR}/bcm2835-bootfiles
	echo "${CMDLINE}" > ${DEPLOYDIR}/bcm2835-bootfiles/cmdline.txt
}





