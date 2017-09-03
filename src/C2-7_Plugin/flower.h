#ifndef FLOWER_H
#define FLOWER_H

#include <QQuickPaintedItem>
#include <QPainter>

class Flower : public QQuickPaintedItem
{
  Q_OBJECT

  Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
  Q_PROPERTY(int petalCount READ petalCount WRITE setPetalCount
                                      NOTIFY petalCountChanged REVISION 1)  // [1]

  QColor m_color;
  int m_petalCount;

protected:
  QPointF rotatePoint(double x, double y, double rad);

public:
  Flower(QQuickPaintedItem *parent = nullptr);

  virtual void paint(QPainter *painter);

  Q_REVISION(2) Q_INVOKABLE void play();          // [2]

  QColor color() const;
  int petalCount() const;
public slots:
  void setColor(QColor color);
  void setPetalCount(int petalCount);
signals:
  void colorChanged(QColor color);
  void petalCountChanged(int petalCount);
};

#endif // FLOWER_H
