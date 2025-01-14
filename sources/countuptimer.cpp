#include "countuptimer.h"

constexpr const int TimeInterval = 1000;

CountUpTimer::CountUpTimer(QObject *parent)
    : QObject{parent}, m_timer(new QTimer(this))
{
    connect(m_timer, &QTimer::timeout, this, &CountUpTimer::updateElapsedTime);
}

void CountUpTimer::start()
{
    m_timer->start(TimeInterval);
}

void CountUpTimer::stop()
{
    m_timer->stop();
}

void CountUpTimer::reset()
{
    stop();
    m_elapsedTime = 0;
    emit elapsedTimeChanged();
}

void CountUpTimer::updateElapsedTime()
{
    m_elapsedTime++;
    emit elapsedTimeChanged();
}

int CountUpTimer::elapsedTime() const
{
    return m_elapsedTime;
}
