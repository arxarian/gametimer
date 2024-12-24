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
