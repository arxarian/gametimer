#include "applicationdata.h"

ApplicationData::ApplicationData(QObject *parent)
    : QObject{parent}
{
    //
}

int ApplicationData::turn() const
{
    return m_turn;
}

void ApplicationData::setTurn(int turn)
{
    if (m_turn != turn)
    {
        m_turn = turn;
        emit turnChanged();
    }
}

int ApplicationData::totalTime() const
{
    return m_totalTime;
}

void ApplicationData::setTotalTime(int totalTime)
{
    if (m_totalTime != totalTime)
    {
        m_totalTime = totalTime;
        emit totalTimeChanged();
    }
}

bool ApplicationData::running() const
{
    return m_running;
}

void ApplicationData::setRunning(bool running)
{
    if (m_running != running)
    {
        m_running = running;
        emit runningChanged();
    }

    if (m_running)
    {
        // m_totalTimer.
    }
}
