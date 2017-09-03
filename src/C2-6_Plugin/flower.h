#ifndef FLOWER_H
#define FLOWER_H

#include <QQuickPaintedItem>
#include <QPainter>

class Flower : public QQuickPaintedItem
{
  Q_OBJECT

  Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
  QColor m_color;

  QPointF rotatePoint(double x, double y, double rad);
public:
  Flower(QQuickPaintedItem *parent = nullptr);

  virtual void paint(QPainter *painter);

  QColor color() const;
public slots:
  void setColor(QColor color);
signals:
  void colorChanged(QColor color);
};

#endif // FLOWER_H
