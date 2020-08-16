############################################################################
##
## Copyright (C) 2016 The Qt Company Ltd.
## Contact: https://www.qt.io/licensing/
##
## This file is part of the Boot to Qt meta layer.
##
## $QT_BEGIN_LICENSE:GPL$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see https://www.qt.io/terms-conditions. For further
## information use the contact form at https://www.qt.io/contact-us.
##
## GNU General Public License Usage
## Alternatively, this file may be used under the terms of the GNU
## General Public License version 3 or (at your option) any later version
## approved by the KDE Free Qt Foundation. The licenses are as published by
## the Free Software Foundation and appearing in the file LICENSE.GPL3
## included in the packaging of this file. Please review the following
## information to ensure the GNU General Public License requirements will
## be met: https://www.gnu.org/licenses/gpl-3.0.html.
##
## $QT_END_LICENSE$
##
############################################################################

DESCRIPTION = "B2Qt embedded Qt5 SDK toolchain"

LICENSE = "The-Qt-Company-Commercial"
LIC_FILES_CHKSUM = "file://${QT_LICENSE};md5=948f8877345cd66106f11031977a4625"

inherit populate_b2qt_qt5_sdk

TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-b2qt-embedded-qt5-toolchain-host"
TOOLCHAIN_TARGET_TASK += "packagegroup-b2qt-embedded-qt5-toolchain-target"

TOOLCHAIN_TARGET_TASK_append = " opencv"


