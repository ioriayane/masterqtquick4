import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import jp.relog.soundcontrols 1.4

ColumnLayout {
    property alias titleText: titleText
    property alias authorText: authorText
    property alias progressBar: progressBar
    property alias prevButton: prevButton
    property alias stopButton: stopButton
    property alias playButton: playButton
    property alias nextButton: nextButton
    property alias volumeDial: volumeDial
    property alias flower: flower
    property alias listView: listView
    property alias playLabel: playLabel
    property alias openButton: openButton
    anchors.fill: parent
    anchors.margins: 5

    Frame {
        Layout.fillWidth: true
        ColumnLayout {
            anchors.fill: parent
            //曲のタイトル
            Text {
                id: titleText
                font.pointSize: 16
            }
            //アーティスト
            Text {
                id: authorText
                font.pointSize: 12
            }
            //再生ポイントのプログレスバー
            ProgressBar {
                id: progressBar
                Layout.fillWidth: true
            }
        }
    }

    RowLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        //開く
        RoundButton {
            id: openButton
            width: 60
            radius: 10
            text: "Open"
            Layout.minimumHeight: 50
            Layout.minimumWidth: 60
        }
        //前の曲
        RoundButton {
            id: prevButton
            text: "|<"
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
        }
        //停止
        RoundButton {
            id: stopButton
            text: "□"
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
        }
        //再生・一時停止
        Item {
            id: item1
            Layout.preferredHeight: 70
            Layout.preferredWidth: 70
            Flower {
                id: flower
                anchors.centerIn: parent
                width: 90
                height: 90
                color: "#8888ff"
            }
            MouseArea {
                id: playButton
                anchors.fill: parent
            }
            Text {
                id: playLabel
                anchors.centerIn: flower
                text: ">"
            }
        }
        //次の曲
        RoundButton {
            id: nextButton
            width: 50
            height: 50
            text: ">|"
            Layout.minimumHeight: 50
            Layout.minimumWidth: 50
        }
        //開く
        Item {
            id: item2
            Layout.minimumHeight: 10
            Layout.minimumWidth: 20
            Layout.maximumHeight: 10
            Layout.maximumWidth: 20
        }
        //ボリューム
        DialControl {
            id: volumeDial
            value: 0.5
            width: 70
        }
    }
    //プレイリスト
    GroupBox {
        id: frame
        title: qsTr("PlayList")
        Layout.fillWidth: true
        Layout.fillHeight: true
        ListView {
            id: listView
            anchors.fill: parent
            delegate: Text {
                font.pixelSize: 16
            }
        }
    }
}
