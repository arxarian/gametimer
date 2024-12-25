#include "turnitem.h"

TurnItem::TurnItem(QObject *parent)
    : QObject{parent}
{
    m_timer = new CountUpTimer(this);
    connect(m_timer, &CountUpTimer::elapsedTimeChanged, this, &TurnItem::timeChanged);
    m_timer->start();
}

void TurnItem::startTimer()
{
    m_timer->start();
}

void TurnItem::stopTimer()
{
    m_timer->stop();
}


int TurnItem::time() const
{
    return m_timer->elapsedTimeNumber();
}
