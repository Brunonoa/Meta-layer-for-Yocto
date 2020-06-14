SUMMARY = "Application Qt5 demo using QML"
AUTHOR = "Davide brunelli"
DESCRIPTION = " \
               Application development in QML and C++ to simple test \
               instalation framework Qt5 \
               "
HOMEPAGE = "https://github.com/Brunonoa"

LICENSE = "( Apache-2.0 & BSD )"
LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"

DEPENDS = " \
    qtbase qtdeclarative qtxmlpatterns qtquickcontrols2 qtgraphicaleffects qtmultimedia qtcharts qtlocation svg \
    "

SRC_URI = "\
           git://github.com/Brunonoa/MusicPlayer-QML.git;branch=master; \
    "
SRCREV = "c3603defe28d576c5863e4dca67a0f64aeb1ee68"

S = "${WORKDIR}/git"

COMPATIBLE_MACHINE = "raspberrypi0-wifi"

do_install_append() {
  install -d ${D}/opt/b2open/bin/
}

FILES_${PN} += "/opt/b2open/bin"

inherit qmake5
