#ifndef TURNITEM_H
#define TURNITEM_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

#include "countuptimer.h"

class TurnItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int time READ time NOTIFY timeChanged FINAL)
    QML_ELEMENT

public:
    explicit TurnItem(QObject *parent = nullptr);

    void startTimer();
    void stopTimer();
    int time() const;

signals:
    void timeChanged();

private:
    CountUpTimer* m_timer = nullptr;
};

#endif // TURNITEM_H
