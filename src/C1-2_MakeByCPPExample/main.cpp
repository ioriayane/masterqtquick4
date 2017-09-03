#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "flower.h"
#include "myitem.h"

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QGuiApplication app(argc, argv);

  qmlRegisterType<Flower>("jp.relog.component.cute", 1, 0, "Flower");   // [1]
  qmlRegisterType<MyItem>("jp.relog.component.cute", 1, 0, "MyItem");

  QQmlApplicationEngine engine;
  engine.load(QUrl(QLatin1String("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
