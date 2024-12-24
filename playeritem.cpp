#include "playeritem.h"

PlayerItem::PlayerItem(QObject *parent)
    : QObject{parent}
{
    //
}

PlayerItem::PlayerItem(const QString name, QObject *parent)
    : m_name{name}, QObject{parent}
{
    //
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

int PlayerItem::timePlayed() const
{
    return m_timePlayed;
}

void PlayerItem::setTimePlayed(int timePlayed)
{
    if (m_timePlayed != timePlayed)
    {
        m_timePlayed = timePlayed;
        emit timePlayedChanged();
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
}
