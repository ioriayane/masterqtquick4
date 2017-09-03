import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ApplicationWindow {
  visible: true
  width: 400
  height: 200
  title: qsTr("Make by QML(after)")

  GroupBox {
    title: qsTr("Microphone")
    anchors.fill: parent
    anchors.margins: 5

    RowLayout {
      anchors.centerIn: parent
      spacing: 20
      Repeater {
        //3種類の値を調整するボリュームを配置
        model: [qsTr("Jun"), qsTr("Nozomi"), qsTr("Sola")]
        //ダイヤルコントロール                                        // [1]
        delegate: DialControl {
          label: modelData
          no: model.index + 1
        }
      }
    }
  }
}
