import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout {            // [1]
  id: root
  width: 80
  property string label: ""     // [2]
  property int no: 0
  property alias value: dial.value
  //ラベル
  Label {
    visible: root.label.length > 0    //指定されていれば表示
    text: root.label
    font.pixelSize: dial.height * 0.2
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
  }
  //チャンネル番号
  Label {
    visible: root.no > 0              //指定されていれば表示
    text: qsTr("CH") + root.no
    font.pixelSize: dial.height * 0.15
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
  }
  //ダイヤル
  Dial {
    id: dial
    Layout.maximumHeight: parent.width
    Layout.maximumWidth: parent.width
    //ダイヤルの値
    Label {
      anchors.centerIn: parent
      text: Math.round(dial.value * 100)
      font.pixelSize: dial.height * 0.2
    }
  }
}
