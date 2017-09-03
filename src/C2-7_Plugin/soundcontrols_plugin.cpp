#include "soundcontrols_plugin.h"
#include "flower.h"
#include "colorfulflower.h"
#include <qqml.h>

void SoundControlsPlugin::registerTypes(const char *uri)
{
  // @uri jp.relog.soundcontrols
  // インポート可能最大バージョンの設定
  qmlRegisterModule(uri, 1, 4);

  //ver 1.0
  qmlRegisterType<Flower>(uri, 1, 0, "Flower");
  qmlRegisterType(QUrl(baseUrl().toString() + QStringLiteral("/DialControl.qml"))
                  , uri, 1, 0, "DialControl");

  //ver 1.1
  qmlRegisterType<Flower, 1>(uri, 1, 1, "Flower");
  qmlRegisterType(QUrl(baseUrl().toString() + QStringLiteral("/DialControlEx.qml"))
                  , uri, 1, 1, "DialControl");

  //ver 1.2
  qmlRegisterType<Flower, 2>(uri, 1, 2, "Flower");

  //ver 1.3
//  qmlRegisterRevision<Flower, 0>(uri, 1, 3);
  qmlRegisterType<ColorfulFlower>(uri, 1, 3, "Flower");
}

