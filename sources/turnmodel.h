#ifndef TURNMODEL_H
#define TURNMODEL_H

#include <QAbstractListModel>
#include <QtQml/qqmlregistration.h>

#include "turnitem.h"

class TurnModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged FINAL)
    QML_ELEMENT

public:
    enum Roles
    {
        ObjectRole = Qt::UserRole
    };
    Q_ENUM(Roles)

    explicit TurnModel(QObject *parent = nullptr);

    Q_INVOKABLE virtual int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    Q_INVOKABLE virtual QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE virtual QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void newTurn();

    void reset();

    int count() const;

signals:
    void countChanged();

private:
    QList<TurnItem*> m_items;
    int m_currentTurn = 0;
};

#endif // TURNMODEL_H
