#include "flowerextension.h"

FlowerExtension::FlowerExtension(QObject *parent)
  : QObject(parent)
  , m_flower(static_cast<Flower *>(parent))         // [1]
{
}

QColor FlowerExtension::complementaryColor() const
{
  return m_complementaryColor;
}

void FlowerExtension::setComplementaryColor(QColor complementaryColor)
{
  if (m_complementaryColor == complementaryColor)
    return;

  m_complementaryColor = complementaryColor;
  emit complementaryColorChanged(m_complementaryColor);

  if(m_flower != nullptr){
    //補色の計算                                       // [2]
    qreal hue = complementaryColor.hueF();
    hue += 0.5;
    if(hue > 1.0){
      hue -= 1.0;
    }
    //補色でcolorを設定                                 // [3]
    m_flower->setColor(
          QColor::fromHsvF(hue
                           , complementaryColor.saturationF()
                           , complementaryColor.valueF())
          );
  }
}
