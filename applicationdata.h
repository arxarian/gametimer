#ifndef APPLICATIONDATA_H
#define APPLICATIONDATA_H

#include <QObject>
#include <qqml.h>
#include <QtQml/qqmlregistration.h>

class ApplicationData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int turn READ turn WRITE setTurn NOTIFY turnChanged)
    QML_SINGLETON
    QML_ELEMENT
public:
    explicit ApplicationData(QObject *parent = nullptr);

    int turn() const;
    void setTurn(int turn);

signals:
    void turnChanged();
private:
    int m_turn = 1;
};

#endif // APPLICATIONDATA_H
