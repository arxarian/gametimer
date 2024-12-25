#include "playermodel.h"
#include "playeritem.h"
#include "gamedata.h"

PlayerModel::PlayerModel(QObject *parent)
    : QAbstractListModel{parent}
{
    for (int i = 0; i < 5; ++i)
    {
        m_items.append(new PlayerItem(QString("Player %1").arg(i + 1), this));
    }

    reset();

    GameData* gameData = qobject_cast<GameData*>(parent);
    connect(gameData, &GameData::runningChanged, this, [this, gameData]
    {
        std::for_each(m_items.begin(), m_items.end(), [gameData](PlayerItem* item)
        {
            if (gameData->running())
            {
                item->startTimerIfActive();
            }
            else
            {
                item->stopTimer();
            }
        });
    });
}


int PlayerModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent)

    return m_items.count();
}

QVariant PlayerModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid() || index.row() >= rowCount())
    {
        return QVariant();
    }

    PlayerItem* pItem = m_items.at(index.row());
    if (role == Roles::ObjectRole)
    {
        return QVariant::fromValue(pItem);
    }

    return QVariant();
}

QHash<int, QByteArray> PlayerModel::roleNames() const
{
    return {{Roles::ObjectRole, "object"}};
}

void PlayerModel::setNextPlayer()
{
    int nextPlayerIndex = (m_currentPlayerIndex + 1) % m_items.count();
    PlayerItem* nextPlayer = m_items.at(nextPlayerIndex);

    if (nextPlayer == currentPlayer())
    {
        emit newTurnStarted();
        return;
    }

    if (nextPlayerIndex == 0)
    {
        emit newTurnStarted();
    }

    if (!nextPlayer->alive())
    {
        m_currentPlayerIndex++;
        setNextPlayer();
        return;
    }

    setCurrentPlayer(nextPlayer);
    setCurrentPlayerIndex(nextPlayerIndex);
}

void PlayerModel::appendPlayer()
{
    emit beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items.append(new PlayerItem(QString("Player %1").arg(rowCount() + 1), this));
    emit endInsertRows();

    emit countChanged();
}

void PlayerModel::removeLastPlayer()
{
    if (rowCount() > 0)
    {
        emit beginRemoveRows(QModelIndex(), rowCount() - 1, rowCount() - 1);
        // PlayerItem* item = m_items.last();
        // item->deleteLater(); // TODO - memory leak?
        m_items.removeLast();
        emit endRemoveRows();

        emit countChanged();
    }
}

void PlayerModel::reset()
{
    std::for_each(m_items.begin(), m_items.end(), [](PlayerItem* item)
    {
      item->setActive(false);
      item->setAlive(true);
      item->resetTimer();
    });

    setCurrentPlayerIndex(0);
    m_currentPlayer = nullptr;
    setCurrentPlayer(m_items.first());
    m_currentPlayer->stopTimer();
}


PlayerItem *PlayerModel::currentPlayer() const
{
    return m_currentPlayer;
}

void PlayerModel::setCurrentPlayer(PlayerItem *currentPlayer)
{
    if (m_currentPlayer != currentPlayer)
    {
        m_currentPlayer = currentPlayer;
        emit currentPlayerChanged(m_currentPlayer);
    }
}

int PlayerModel::currentPlayerIndex() const
{
    return m_currentPlayerIndex;
}

void PlayerModel::setCurrentPlayerIndex(int currentPlayerIndex)
{
    if (m_currentPlayerIndex != currentPlayerIndex)
    {
        m_currentPlayerIndex = currentPlayerIndex;
        emit currentPlayerIndexChanged();
    }
}

int PlayerModel::count() const
{
    return rowCount();
}
