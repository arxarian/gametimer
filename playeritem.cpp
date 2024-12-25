#include "playeritem.h"
#include "playermodel.h"

PlayerItem::PlayerItem(QObject *parent)
    : QObject{parent}
{
    //
}

PlayerItem::PlayerItem(const QString name, QObject *parent)
    : m_name{name}, QObject{parent}
{
    PlayerModel* model = qobject_cast<PlayerModel*>(parent);
    connect(model, &PlayerModel::currentPlayerChanged, this, [this](PlayerItem* player){
        setActive(player == this);
    });

    m_timer = new CountUpTimer(this);
    connect(m_timer, &CountUpTimer::elapsedTimeChanged, this, &PlayerItem::elapsedTimeChanged);
    connect(m_timer, &CountUpTimer::elapsedTimeChanged, this, &PlayerItem::elapsedTimeNumberChanged);

    connect(this, &PlayerItem::aliveChanged, this, [this]{
        if (alive())
        {
            startTimerIfActive();
        }
        else
        {
            stopTimer();
        }
    });
}

void PlayerItem::stopTimer()
{
    m_timer->stop();
}

void PlayerItem::startTimerIfActive()
{
    if (m_active && m_alive)
    {
        m_timer->start();
    }
}

void PlayerItem::resetTimer()
{
    m_timer->stop();
    m_timer->reset();
}

QString PlayerItem::name() const
{
    return m_name;
}

void PlayerItem::setName(const QString &name)
{
    if (m_name != name)
    {
        m_name = name;
        emit nameChanged();
    }
}

bool PlayerItem::alive() const
{
    return m_alive;
}

void PlayerItem::setAlive(bool alive)
{
    if (m_alive != alive)
    {
        m_alive = alive;
        emit aliveChanged();
    }
}

bool PlayerItem::active() const
{
    return m_active;
}

void PlayerItem::setActive(bool active)
{
    if (m_active != active)
    {
        m_active = active;
        emit activeChanged();
    }

    if (m_active)
    {
        m_timer->start();
    }
    else
    {
        m_timer->stop();
    }
}

QString PlayerItem::elapsedTime() const
{
    return m_timer->elapsedTime();
}

int PlayerItem::elapsedTimeNumber() const
{
    return m_timer->elapsedTimeNumber();
}
