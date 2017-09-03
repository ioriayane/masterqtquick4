#ifndef COLORFULFLOWER_H
#define COLORFULFLOWER_H

#include "flower.h"

class ColorfulFlower : public Flower
{
  Q_OBJECT

public:
  explicit ColorfulFlower(Flower *parent = nullptr);

  virtual void paint(QPainter *painter);

public slots:
signals:

};

#endif // COLORFULFLOWER_H
