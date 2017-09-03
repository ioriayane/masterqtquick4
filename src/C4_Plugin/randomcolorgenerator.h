#ifndef RANDOMCOLORGENERATOR_H
#define RANDOMCOLORGENERATOR_H

#include <QObject>
#include <QQmlPropertyValueSource>
#include <QQmlProperty>
#include <QTimer>

class RandomColorGenerator : public QObject, public QQmlPropertyValueSource // [1]
{
  Q_OBJECT
  Q_INTERFACES(QQmlPropertyValueSource)             // [2]

  Q_PROPERTY(bool running MEMBER m_running WRITE setRunning NOTIFY runningChanged)

public:
  explicit RandomColorGenerator(QObject *parent = nullptr);

  //更新対象のプロパティの参照が指定されて呼び出される             // [3]
  virtual void setTarget(const QQmlProperty &prop);

signals:
  void runningChanged(bool running);

public slots:
  void setRunning(bool running);
  //タイマーでプロパティの値を更新するスロット
  void updateProperty();

private:
  QQmlProperty m_targetProperty;
  QTimer m_timer;
  bool m_running;
};

#endif // RANDOMCOLORGENERATOR_H
