#include "gamedata.h"

GameData::GameData(QObject *parent)
    : QObject{parent}, m_timer(new CountUpTimer(this))
{
    m_playerModel = new PlayerModel(this);
    connect(m_timer, &CountUpTimer::elapsedTimeChanged, this, &GameData::elapsedTimeChanged);
    setRunning(false);

    m_turnsModel = new TurnModel(this);
    connect(m_playerModel, &PlayerModel::newTurnStarted, m_turnsModel, &TurnModel::newTurn);
    connect(m_turnsModel, &TurnModel::countChanged, this, &GameData::turnChanged);
}

void GameData::start()
{
    setControlPaneIndex(2);
    setRunning(true);
    setPaused(false);
}

void GameData::resume()
{
    setPaused(false);
}

void GameData::pause()
{
    setPaused(true);
}

void GameData::stop()
{
    setControlPaneIndex(1);
    setRunning(false);
}

void GameData::end()
{
    setControlPaneIndex(0);

    m_timer->reset();
    m_playerModel->reset();
    m_turnsModel->reset();

}

QString GameData::formatTime(const int seconds) const
{
    const int hour = seconds / 3600;
    const int minute = (seconds % 3600) / 60;
    const int second = seconds % 60;

    if (seconds < 60)
    {
        return QString("%1").arg(second);
    }
    else if (seconds < 3600)
    {
        return QString("%1:%2").arg(minute).arg(second, 2, 10, QLatin1Char('0'));
    }

    return QString("%1:%2:%3").arg(hour).arg(minute, 2, 10, QLatin1Char('0')).arg(second, 2, 10, QLatin1Char('0'));
}

int GameData::turn() const
{
    return m_turnsModel->count() + 1;
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
        m_timer->start();
    }
    else
    {
        m_timer->stop();
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

int GameData::elapsedTime() const
{
    return m_timer->elapsedTime();
}

TurnModel *GameData::turns() const
{
    return m_turnsModel;
}

void GameData::setTurns(TurnModel *turns)
{
    if (m_turnsModel != turns)
    {
        m_turnsModel = turns;
        emit turnsChanged();
    }
}

int GameData::controlPaneIndex() const
{
    return m_controlPaneIndex;
}

void GameData::setControlPaneIndex(int newControlPaneIndex)
{
    if (m_controlPaneIndex != newControlPaneIndex)
    {
        m_controlPaneIndex = newControlPaneIndex;
        emit controlPaneIndexChanged();
    }
}

bool GameData::paused() const
{
    return m_paused;
}

void GameData::setPaused(bool paused)
{
    if (m_paused != paused)
    {
        m_paused = paused;
        emit pausedChanged();
    }
}
