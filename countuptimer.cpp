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

void CountUpTimer::updateElapsedTime()
{
    m_elapsedTime++;
    emit elapsedTimeChanged();
}

QString CountUpTimer::elapsedTime() const
{
    const int hours = m_elapsedTime / 3600;
    const int minutes = (m_elapsedTime % 3600) / 60;
    const int seconds = m_elapsedTime % 60;

    if (m_elapsedTime < 60)
    {
        return QString("%1 s").arg(seconds);
    }
    else if (m_elapsedTime < 3600)
    {
        return QString("%1:%2").arg(minutes).arg(seconds, 2, 10, QLatin1Char('0'));
    }

    return QString("%1:%2:%3").arg(hours).arg(minutes, 2, 10, QLatin1Char('0')).arg(seconds, 2, 10, QLatin1Char('0'));
}

int CountUpTimer::elapsedTimeNumber() const
{
    return m_elapsedTime;
}
