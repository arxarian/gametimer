#ifndef PLAYERITEM_H
#define PLAYERITEM_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

#include "countuptimer.h"

class PlayerItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)
    Q_PROPERTY(bool active READ active WRITE setActive NOTIFY activeChanged FINAL)
    Q_PROPERTY(bool alive READ alive WRITE setAlive NOTIFY aliveChanged FINAL)
    Q_PROPERTY(QString elapsedTime READ elapsedTime NOTIFY elapsedTimeChanged FINAL)
    QML_ELEMENT

public:
    explicit PlayerItem(QObject *parent = nullptr);
    explicit PlayerItem(const QString name, QObject *parent = nullptr);

    QString name() const;
    void setName(const QString &name);

    bool alive() const;
    void setAlive(bool alive);

    bool active() const;
    void setActive(bool active);

    QString elapsedTime() const;

signals:
    void nameChanged();
    void aliveChanged();
    void activeChanged();
    void elapsedTimeChanged();

private:
    CountUpTimer* m_timer = nullptr;

    QString m_name;
    bool m_alive = true;
    bool m_active = false;
};

#endif // PLAYERITEM_H
