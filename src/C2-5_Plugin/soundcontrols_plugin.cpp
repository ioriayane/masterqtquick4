#include "soundcontrols_plugin.h"
#include "flower.h"
#include <qqml.h>

void SoundControlsPlugin::registerTypes(const char *uri)
{
  // @uri jp.relog.soundcontrols
  qmlRegisterType<Flower>(uri, 1, 0, "Flower");

  qmlRegisterType(QUrl(baseUrl().toString() + QStringLiteral("/DialControl.qml"))
                  , uri, 1, 0, "DialControl");
}

