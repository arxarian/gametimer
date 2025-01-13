#include "turnmodel.h"
#include "turnitem.h"
#include "gamedata.h"

constexpr const int DefaultTurnsCount = 20;

TurnModel::TurnModel(QObject *parent)
    : QAbstractListModel{parent}
{
    for (int i = 0; i < DefaultTurnsCount; i++) {
        m_items.append(new TurnItem(this));
    }

    GameData* gameData = qobject_cast<GameData*>(parent);
    connect(gameData, &GameData::runningChanged, this, [this, gameData]
    {
        if (gameData->running())
        {
            m_items.at(m_currentTurn)->startTimer();
        }
        else
        {
            m_items.at(m_currentTurn)->stopTimer();
        }
    });
}


int TurnModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent)

    return m_items.count();
}

QVariant TurnModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid() || index.row() >= rowCount())
    {
        return QVariant();
    }

    TurnItem* item = m_items.at(index.row());
    if (role == Roles::ObjectRole)
    {
        return QVariant::fromValue(item);
    }

    return QVariant();
}

QHash<int, QByteArray> TurnModel::roleNames() const
{
    return {{Roles::ObjectRole, "object"}};
}

void TurnModel::newTurn()
{
    m_items.at(m_currentTurn)->stopTimer();

    if (m_currentTurn == m_items.count() - 1)
    {
        emit beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_items.append(new TurnItem(this));
        emit endInsertRows();

    }

    m_currentTurn++;
    m_items.at(m_currentTurn)->startTimer();

    emit countChanged();
}

void TurnModel::reset()
{
    for (int i = 0; i < DefaultTurnsCount; ++i)
    {
        m_items[i]->reset();
    }

    if (m_items.count() > DefaultTurnsCount)
    {
        emit beginRemoveRows(QModelIndex(), DefaultTurnsCount, rowCount() - 1);

        for (int i = DefaultTurnsCount; i < rowCount(); ++i)
        {
            m_items[i]->deleteLater();
        }

         m_items.remove(DefaultTurnsCount, rowCount() - DefaultTurnsCount);

        emit endRemoveRows();
    }

    m_currentTurn = 0;

    emit countChanged();
}

int TurnModel::count() const
{
    return m_currentTurn;
}
