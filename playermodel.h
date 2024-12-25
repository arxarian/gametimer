#ifndef PLAYERMODEL_H
#define PLAYERMODEL_H

#include <QAbstractListModel>
#include <QtQml/qqmlregistration.h>

#include "playeritem.h"

class PlayerModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(PlayerItem* currentPlayer READ currentPlayer WRITE setCurrentPlayer NOTIFY currentPlayerChanged FINAL)
    Q_PROPERTY(int currentPlayerIndex READ currentPlayerIndex WRITE setCurrentPlayerIndex NOTIFY currentPlayerIndexChanged FINAL)
    Q_PROPERTY(int count READ count NOTIFY countChanged FINAL)
    QML_ELEMENT

public:
    enum Roles
    {
        ObjectRole = Qt::UserRole
    };
    Q_ENUM(Roles)

    explicit PlayerModel(QObject *parent = nullptr);

    Q_INVOKABLE virtual int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    Q_INVOKABLE virtual QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE virtual QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void setNextPlayer();

    Q_INVOKABLE void appendPlayer();
    Q_INVOKABLE void removeLastPlayer();

    void reset();

    PlayerItem *currentPlayer() const;
    void setCurrentPlayer(PlayerItem *currentPlayer);

    int currentPlayerIndex() const;
    void setCurrentPlayerIndex(int currentPlayerIndex);

    int count() const;

signals:
    void newTurnStarted();
    void currentPlayerChanged(PlayerItem *currentPlayer);
    void currentPlayerIndexChanged();
    void countChanged();

private:
    QList<PlayerItem*> m_items;

    PlayerItem *m_currentPlayer = nullptr;
    int m_currentPlayerIndex = 0;
};

#endif // PLAYERMODEL_H
