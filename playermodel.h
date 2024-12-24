#ifndef PLAYERMODEL_H
#define PLAYERMODEL_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class PlayerModel : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit PlayerModel(QObject *parent = nullptr);

signals:
};

#endif // PLAYERMODEL_H
