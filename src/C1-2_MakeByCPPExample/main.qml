import QtQuick 2.8
import QtQuick.Controls 2.2
import jp.relog.component.cute 1.0     // [1]

ApplicationWindow {
  id: root
  visible: true
  width: 400
  height: 200
  title: qsTr("Make by CPP")

  Flower {                              // [2]
    anchors.centerIn: parent
    width: 100
    height: 100
    color: "#8888ff"
    rotation: root.width % 360
  }
}
