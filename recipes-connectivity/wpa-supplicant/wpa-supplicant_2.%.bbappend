FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://wpa_supplicant.conf-sane"

SYSTEMD_AUTO_ENABLE = "enable"
