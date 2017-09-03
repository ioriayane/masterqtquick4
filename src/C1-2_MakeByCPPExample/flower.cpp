#include "flower.h"
#include <QPointF>
#include <QtMath>

Flower::Flower(QQuickPaintedItem *parent)
  : QQuickPaintedItem(parent)
  , m_color(QColor(255, 55, 55))
{

}

void Flower::paint(QPainter *painter)
{
  //花びらの数
  int petal_count = 20;
  //花びらの間隔（ラジアン）
  double rad = 2 * M_PI / petal_count;
  //花びらの中心を配置する20角形が内接する円の半径
  int r = qMin(boundingRect().width(), boundingRect().height()) / 2.7;
  //花びらの半径
  int petal_r = (r * qSin(rad) / qSin((M_PI - rad)/2)) / 1.8;
  //花びらの中心を配置する円の半径
  int petal_revo_r = r *qSin((M_PI - rad)/2);

  //アンチエイリアスと色の設定
  painter->setRenderHint(QPainter::Antialiasing, true);
  painter->setBrush(color());
  painter->setPen(color());
  //花びらをぐるっと１周描画
  for(int i=0; i<petal_count; i++){
      QPointF p = rotatePoint(0, -1*petal_revo_r, i*(rad))
                + boundingRect().center();
      painter->drawEllipse(p, petal_r, petal_r);
  }
  //中心の円の描画
  painter->drawEllipse(boundingRect().center(), r - petal_r*1.2, r - petal_r*1.2);
}

QColor Flower::color() const
{
  return m_color;
}

void Flower::setColor(QColor color)
{
  if (m_color == color)
    return;

  m_color = color;
  emit colorChanged(m_color);
  update();   //色が変更されたら更新
}

QPointF Flower::rotatePoint(double x, double y, double rad)
{
  return QPointF(x * qCos(rad) - y * qSin(rad)
                 , x * qSin(rad) + y * qCos(rad));
}
