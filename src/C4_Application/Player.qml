import QtQuick 2.8
import QtMultimedia 5.9
import Qt.labs.platform 1.0
import jp.relog.soundcontrols 1.4

PlayerForm {
  //音楽再生機能
  Audio {
    id: player;
    playlist: Playlist {
      onItemCountChanged: {
        if(itemCount > 0){
          //曲がプレイリストに追加されたら効果音がなる！
          flower.play()
        }
      }
    }
    volume: volumeDial.value
  }

  //曲情報
  titleText.text: player.metaData.title === undefined ?
                    "" : player.metaData.title
  authorText.text: player.metaData.author === undefined ?
                     "" : player.metaData.author
  progressBar.value: player.position / player.duration

  //再生ボタンの見た目
  playLabel.text: player.playbackState == Audio.PlayingState ? "||" : ">"
  //ボタン操作
  prevButton.onClicked: player.playlist.previous()
  stopButton.onClicked: player.stop()
  playButton.onClicked: {
    if(player.playbackState == Audio.PlayingState){
      player.pause()
    }else{
      player.play()
    }
  }
  nextButton.onClicked: player.playlist.next()
  openButton.onClicked: fileOpen.open()

  //プレイリストの項目の内容とデザイン
  listView.model: player.playlist
  listView.delegate: Text {
    font.pointSize: 12
    text: {
      var items = source.toString().split("/")
      return items[items.length - 1]
    }
  }

  //再生中は回転
  RotationAnimation {
    target: flower
    duration: 4000
    from: 0
    to: 360
    loops: Animation.Infinite
    running: player.playbackState == Audio.PlayingState
  }
  //再生中はランダムカラー
  RandomColorGenerator on flower.color {
    running: player.playbackState == Audio.PlayingState
  }

  FileDialog {
    id: fileOpen
    //複数選択可
    fileMode: FileDialog.OpenFiles
    //音楽フォルダをデフォルト
    folder: StandardPaths.writableLocation(StandardPaths.MusicLocation)
    //ファイルが選択されていたらプレイリストをクリアして登録
    onAccepted: {
      if(files.length > 0){
        player.playlist.clear()
        player.playlist.addItems(files)
      }
    }
  }
}
