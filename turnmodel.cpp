#include "turnmodel.h"
#include "turnitem.h"
#include "gamedata.h"

TurnModel::TurnModel(QObject *parent)
    : QAbstractListModel{parent}
{
    GameData* gameData = qobject_cast<GameData*>(parent);
    connect(gameData, &GameData::runningChanged, this, [this, gameData]
    {
        if (gameData->running())
        {
            if (m_items.isEmpty())
            {
                newTurn();
            }
            else
            {
                m_items.last()->startTimer();
            }
        }
        else
        {
            m_items.last()->stopTimer();
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
    if (!m_items.isEmpty())
    {
        m_items.last()->stopTimer();
    }

    emit beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_items.append(new TurnItem(this));
    emit endInsertRows();

    emit countChanged();
}

void TurnModel::reset()
{
    if (!m_items.isEmpty())
    {
        emit beginRemoveRows(QModelIndex(), 0, rowCount() - 1);
        m_items.clear();    // TODO - memory leaks!
        emit endRemoveRows();

        emit countChanged();
    }
}

int TurnModel::count() const
{
    return rowCount();
}
