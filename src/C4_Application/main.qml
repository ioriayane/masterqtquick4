import QtQuick 2.8
import QtQuick.Controls 2.2

ApplicationWindow {
  visible: true
  width: 450
  height: 300
  title: qsTr("Audio Player")

  //プレーヤー
  Player {
    anchors.fill: parent
  }
}
