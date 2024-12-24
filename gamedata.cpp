#include "gamedata.h"
#include "playeritem.h"

GameData::GameData(QObject *parent)
    : QObject{parent}
{
    m_playerModel = new PlayerModel(this);
    connect(m_playerModel, &PlayerModel::newTurnStarted, this, &GameData::newTurn);
}

int GameData::turn() const
{
    return m_turn;
}

void GameData::setTurn(int turn)
{
    if (m_turn != turn)
    {
        m_turn = turn;
        emit turnChanged();
    }
}

void GameData::newTurn()
{
    m_turn++;
    emit turnChanged();
}

int GameData::totalTime() const
{
    return m_totalTime;
}

void GameData::setTotalTime(int totalTime)
{
    if (m_totalTime != totalTime)
    {
        m_totalTime = totalTime;
        emit totalTimeChanged();
    }
}

bool GameData::running() const
{
    return m_running;
}

void GameData::setRunning(bool running)
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

PlayerModel *GameData::players() const
{
    return m_playerModel;
}

void GameData::setPlayers(PlayerModel *playerModel)
{
    if (m_playerModel != playerModel)
    {
        m_playerModel = playerModel;
        emit playersChanged();
    }
}
