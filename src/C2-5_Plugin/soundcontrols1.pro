TEMPLATE = lib
TARGET = SoundControls
QT += qml quick
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = jp.relog.soundcontrols                # [1]

# Input
SOURCES += \
    soundcontrols_plugin.cpp \
    flower.cpp

HEADERS += \
    soundcontrols_plugin.h \
    flower.h

QML_FILES = DialControl.qml                 # [2]

DISTFILES = qmldir

OTHER_FILES += $$QML_FILES                  # [3]

#!equals(_PRO_FILE_PWD_, $$OUT_PWD) {       # [4]
#    copy_qmldir.target = $$OUT_PWD/qmldir
#    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
#    copy_qmldir.commands = $(COPY_FILE) \
#                        \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \
#                        \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
#    QMAKE_EXTRA_TARGETS += copy_qmldir
#    PRE_TARGETDEPS += $$copy_qmldir.target
#}

# install setting
qmldir.files = qmldir
qmlfiles.files = $$QML_FILES                # [5]

# install path(qt-qml-dir)
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)

android {                                   # [6]
  # Android
  # copy to build-dir                       # [7]
  OUT_LIB_DIR = libs/$$ANDROID_TARGET_ARCH/
  qmldir.path = /$$OUT_LIB_DIR
  qmlfiles.path = /$$OUT_LIB_DIR
  INSTALLS += qmldir qmlfiles
  # copy build-dir to qt-qml-dir            # [8]
  OUT_DIR = $$OUT_PWD/android-build/$$OUT_LIB_DIR
  # make dir
  !contains(QMAKE_HOST.os,Windows):CHK_DIR_EXISTS_SEP = ||
  android_install_mkdir.target = android_install_mkdir
  android_install_mkdir.commands = $(CHK_DIR_EXISTS) \
                        $$replace(installPath, /, $$QMAKE_DIR_SEP) \
                        $$CHK_DIR_EXISTS_SEP \
                        $(MKDIR) $$replace(installPath, /, $$QMAKE_DIR_SEP)
  # copy
  android_install.target = android_install
  android_install.depends = android_install_mkdir
  android_install.commands = $(COPY_FILE) \
                        $$replace(OUT_DIR, /, $$QMAKE_DIR_SEP)* \
                        $$replace(installPath, /, $$QMAKE_DIR_SEP)
  QMAKE_EXTRA_TARGETS += android_install android_install_mkdir
} else {
  # other Platform
  qmldir.path = $$installPath
  qmlfiles.path = $$installPath             # [9]
  target.path = $$installPath
  INSTALLS += target qmldir qmlfiles        # [10]
}
