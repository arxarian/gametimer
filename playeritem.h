#ifndef PLAYERITEM_H
#define PLAYERITEM_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class PlayerItem : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit PlayerItem(QObject *parent = nullptr);

signals:
};

#endif // PLAYERITEM_H
