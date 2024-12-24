#ifndef APPLICATIONDATA_H
#define APPLICATIONDATA_H

#include <QObject>
#include <qelapsedtimer.h>
#include <qqml.h>
#include <QtQml/qqmlregistration.h>

#include "playermodel.h"

class ApplicationData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool running READ running WRITE setRunning NOTIFY runningChanged FINAL)
    Q_PROPERTY(int turn READ turn WRITE setTurn NOTIFY turnChanged FINAL)
    Q_PROPERTY(int totalTime READ totalTime WRITE setTotalTime NOTIFY totalTimeChanged FINAL)
    Q_PROPERTY(PlayerModel* players READ players WRITE setPlayers NOTIFY playersChanged FINAL)
    QML_SINGLETON
    QML_ELEMENT
public:
    explicit ApplicationData(QObject *parent = nullptr);

    int turn() const;
    void setTurn(int turn);
    void newTurn();

    int totalTime() const;
    void setTotalTime(int totalTime);

    bool running() const;
    void setRunning(bool running);

    PlayerModel *players() const;
    void setPlayers(PlayerModel *playerModel);

signals:
    void turnChanged();
    void totalTimeChanged();
    void runningChanged();
    void playersChanged();

private:
    int m_turn = 1;
    int m_totalTime = 0;
    bool m_running = false;
    PlayerModel *m_playerModel = nullptr;
};

#endif // APPLICATIONDATA_H
