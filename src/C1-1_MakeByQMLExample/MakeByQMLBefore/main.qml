import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ApplicationWindow {
  visible: true
  width: 400
  height: 200
  title: qsTr("Make by QML(before)")

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
        delegate: ColumnLayout {
          id: dialcontrol
          width: 80
          property string label: modelData
          property int no: model.index + 1
          //ラベル
          Label {
            visible: dialcontrol.label.length > 0 //指定されていれば表示
            text: dialcontrol.label
            font.pixelSize: dial.height * 0.2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
          }
          Label {
            visible: dialcontrol.no > 0           //指定されていれば表示
            text: qsTr("CH") + dialcontrol.no
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
      }
    }
  }
}
