#
# Yocto recipe to build a kernel module out of the kernel tree
# kernmodule.bb  
# Marco Cavallini - KOAN sas - www.koansoftware.com
#

DESCRIPTION = "Hello kernel module out of the kernel tree"
SECTION = "kernel loadable module"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit module

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI =   "file://gpio_keys_device.c \
			file://Makefile \
			"

S = "${WORKDIR}"

MACHINE_EXTRA_RRECOMMENDS += "kernel-module-gpio_keys_device"
KERNEL_MODULE_AUTOLOAD += "gpio_keys_device"

