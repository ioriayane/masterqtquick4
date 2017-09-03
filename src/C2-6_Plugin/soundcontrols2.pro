TEMPLATE = lib
TARGET = SoundControls
QT += qml quick
CONFIG += plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = jp.relog.soundcontrols
import_version = 1.0                      # [1]

# Input
SOURCES += \
    soundcontrols_plugin.cpp \
    flower.cpp

HEADERS += \
    soundcontrols_plugin.h \
    flower.h

QML_FILES = DialControl.qml

DISTFILES = qmldir

OTHER_FILES += $$QML_FILES \              # [2]
    dependencies.json

# install setting
qmldir.files = qmldir
qmlfiles.files = $$QML_FILES

# install path(qt-qml-dir)
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)

android {
  # Android
  # copy to build-dir
  OUT_LIB_DIR = libs/$$ANDROID_TARGET_ARCH/
  qmldir.path = /$$OUT_LIB_DIR
  qmlfiles.path = /$$OUT_LIB_DIR
  INSTALLS += qmldir qmlfiles
  # copy build-dir to qt-qml-dir
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
  qmlfiles.path = $$installPath
  target.path = $$installPath
  INSTALLS += target qmldir qmlfiles

  # make plugins.qmltypes                   # [3]
  QMLTYPE_COMMAND = $$[QT_INSTALL_BINS]/qmlplugindump
  QMLTYPE_OUT = $$installPath/plugins.qmltypes
  QMLTYPE_INSTALL = $$[QT_INSTALL_QML]
  QMLTYPE_DEPEND = $$_PRO_FILE_PWD_/dependencies.json
  qmltypes.target = qmltypes
  qmltypes.commands = $$replace(QMLTYPE_COMMAND, /, $$QMAKE_DIR_SEP) \
                    -nonrelocatable \
                    -output $$replace(QMLTYPE_OUT, /, $$QMAKE_DIR_SEP) \
                    $$uri $$import_version \
                    $$replace(QMLTYPE_INSTALL, /, $$QMAKE_DIR_SEP) \
                    -dependencies $$replace(QMLTYPE_DEPEND, /, $$QMAKE_DIR_SEP)
  QMAKE_EXTRA_TARGETS += qmltypes
}
