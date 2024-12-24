#include "applicationdata.h"
#include "playeritem.h"

ApplicationData::ApplicationData(QObject *parent)
    : QObject{parent}
{
    m_playerModel = new PlayerModel(this);
    connect(m_playerModel, &PlayerModel::newTurnStarted, this, &ApplicationData::newTurn);
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

void ApplicationData::newTurn()
{
    m_turn++;
    emit turnChanged();
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

PlayerModel *ApplicationData::players() const
{
    return m_playerModel;
}

void ApplicationData::setPlayers(PlayerModel *playerModel)
{
    if (m_playerModel != playerModel)
    {
        m_playerModel = playerModel;
        emit playersChanged();
    }
}
