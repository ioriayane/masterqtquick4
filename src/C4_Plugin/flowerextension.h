#ifndef FLOWEREXTENSION_H
#define FLOWEREXTENSION_H

#include "flower.h"

class FlowerExtension : public QObject
{
  Q_OBJECT

  Q_PROPERTY(QColor complementaryColor
             READ complementaryColor
             WRITE setComplementaryColor
             NOTIFY complementaryColorChanged)        // [1]

public:
  explicit FlowerExtension(QObject *parent = nullptr);

  QColor complementaryColor() const;

signals:
  void complementaryColorChanged(QColor complementaryColor);

public slots:
  void setComplementaryColor(QColor complementaryColor);

private:
  Flower *m_flower;                                   // [2]
  QColor m_complementaryColor;
};

#endif // FLOWEREXTENSION_H
