#ifndef GAMEDATA_H
#define GAMEDATA_H

#include <QObject>
#include <qqml.h>
#include <QtQml/qqmlregistration.h>

#include "playermodel.h"
#include "countuptimer.h"

class GameData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool running READ running WRITE setRunning NOTIFY runningChanged FINAL)
    Q_PROPERTY(int turn READ turn WRITE setTurn NOTIFY turnChanged FINAL)
    Q_PROPERTY(int totalTime READ totalTime WRITE setTotalTime NOTIFY totalTimeChanged FINAL)
    Q_PROPERTY(PlayerModel* players READ players WRITE setPlayers NOTIFY playersChanged FINAL)
    Q_PROPERTY(QString elapsedTime READ elapsedTime NOTIFY elapsedTimeChanged FINAL)
    QML_SINGLETON
    QML_ELEMENT
public:
    explicit GameData(QObject *parent = nullptr);

    Q_INVOKABLE void reset();

    int turn() const;
    void setTurn(int turn);
    void newTurn();

    int totalTime() const;
    void setTotalTime(int totalTime);

    bool running() const;
    void setRunning(bool running);

    PlayerModel *players() const;
    void setPlayers(PlayerModel *playerModel);

    QString elapsedTime() const;

signals:
    void turnChanged();
    void totalTimeChanged();
    void runningChanged();
    void playersChanged();
    void elapsedTimeChanged();

private:
    CountUpTimer* m_timer = nullptr;
    int m_turn = 1;
    int m_totalTime = 0;
    bool m_running = false;
    PlayerModel *m_playerModel = nullptr;
};

#endif // GAMEDATA_H
