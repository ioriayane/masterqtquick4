#include "randomcolorgenerator.h"
#include <QColor>
#include <QDateTime>

RandomColorGenerator::RandomColorGenerator(QObject *parent)
  : QObject(parent)
  , m_running(true)
{
  qsrand(QDateTime::currentMSecsSinceEpoch() / 1000);
  //タイマーの更新シグナルを接続
  QObject::connect(&m_timer, &QTimer::timeout
                   , this, &RandomColorGenerator::updateProperty);
  //タイマーの開始
  m_timer.start(500);
}

void RandomColorGenerator::setTarget(const QQmlProperty &prop)
{
  //値を更新するプロパティの参照を記録
  m_targetProperty = prop;
}

void RandomColorGenerator::setRunning(bool running)
{
  //タイマーの開始・停止をプロパティで変更
  if(m_timer.isActive() && !running){
    m_timer.stop();
  }else if(!m_timer.isActive() && running){
    m_timer.start(500);
  }

  if (m_running == running)
    return;
  m_running = running;
  emit runningChanged(m_running);
}

void RandomColorGenerator::updateProperty() {
  //RGBの各値をランダム値で設定                         [1]
  m_targetProperty.write(QColor::fromRgb(qrand()%256, qrand()%256, qrand()%256));
}

