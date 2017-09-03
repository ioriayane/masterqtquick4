import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Particles 2.0

ColumnLayout {
  id: root
  width: 80
  property string label: ""
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
    ParticleSystem {
      id: particle
      anchors.fill: parent
      ImageParticle {
        source: "qrc:/jp.relog.soundcontrols/imports/note.png"
        // Linuxではsourceを消して以下を使用しないと表示されない
//        sprites: [Sprite {
//            source: "qrc:/jp.relog.soundcontrols/imports/note.png"
//        }]
        colorVariation: 0.5
      }
      //パーティクルの発生源
      Emitter {
        //ダイアルの円に合わせて発生位置を調整
        x: dial.width / 2 * Math.sin(dial.angle * Math.PI / 180) + dial.width / 2
        y: -dial.height / 2 * Math.cos(dial.angle * Math.PI / 180) + dial.height / 2
        enabled:  dial.pressed
        acceleration: AngleDirection {
          angleVariation: 180     //角度の変化量
          magnitude: 80           //大きさ
          magnitudeVariation: 40  //大きさの変化量
        }
        emitRate: 20              //発生量
        lifeSpan: 1000            //1秒間存在
        size: 0                   //出現時サイズ
        endSize: 30               //最終サイズ
        sizeVariation: 4          //サイズの振れ幅
      }
    }
  }
}
