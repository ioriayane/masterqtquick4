#ifndef MYITEM_H
#define MYITEM_H

#include <QQuickItem>
#include <QSGGeometryNode>

class MyItem : public QQuickItem
{
  Q_OBJECT
public:
  MyItem(QQuickItem *parent = nullptr)
    : QQuickItem(parent)
  {
    //このフラグ設定でupdatePaintNodeが呼ばれるようになる       [1]
    setFlag(ItemHasContents, true);
  }

protected:
  //描画処理                                          [2]
  virtual QSGNode *updatePaintNode(QSGNode *oldNode
                     , UpdatePaintNodeData *updatePaintNodeData){
    //描画処理を記述
    return oldNode;
  }

signals:
public slots:
};

#endif // MYITEM_H
