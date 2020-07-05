SUMMARY = "libfoo sample recipe"
SECTION = "libs"
LICENSE = "CLOSED"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI = "file://lib*.so"

COMPATIBLE_HOST = "arm.*-linux"
 
INSANE_SKIP_${PN} = "ldflags"
INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"
SOLIBS = ".so"
FILES_SOLIBSDEV = ""

do_install () {
	install -d ${D}${libdir}
	install -m 0755 ${WORKDIR}/lib*.so ${D}${libdir}
}

DEPENDS += "opencv qtmultimedia qtbase qtdeclarative"
