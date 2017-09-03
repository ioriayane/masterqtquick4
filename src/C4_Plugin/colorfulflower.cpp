#include "colorfulflower.h"
#include <QPointF>
#include <QtMath>

ColorfulFlower::ColorfulFlower(Flower *parent)
  : Flower(parent)
{
}

void ColorfulFlower::paint(QPainter *painter)
{
  //花びらの間隔（ラジアン）
  double rad = 2 * M_PI / petalCount();
  //花びらの中心を配置する20角形が内接する円の半径
  int r = qMin(boundingRect().width(), boundingRect().height()) / 2.7;
  //花びらの半径
  int petal_r = (r * qSin(rad) / qSin((M_PI - rad)/2)) / 1.8;
  //花びらの中心を配置する円の半径
  int petal_revo_r = r *qSin((M_PI - rad)/2);

  //アンチエイリアスと色の設定
  painter->setRenderHint(QPainter::Antialiasing, true);
  QColor petal_color = QColor::fromHslF(0, 1.0, 1.0);
  //花びらをぐるっと１周描画
  for(int i=0; i<petalCount(); i++){
      QPointF p = rotatePoint(0, -1*petal_revo_r, i*(rad))
                + boundingRect().center();
      petal_color.setHsvF(static_cast<double>(i)/static_cast<double>(petalCount()), 1.0, 1.0);
      painter->setBrush(petal_color);
      painter->setPen(petal_color);
      painter->drawEllipse(p, petal_r, petal_r);
  }

  //中心の円の描画
  painter->setBrush(color());
  painter->setPen(color());
  painter->drawEllipse(boundingRect().center(), r - petal_r*1.2, r - petal_r*1.2);

}

