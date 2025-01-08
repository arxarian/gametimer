#ifndef GAMEDATA_H
#define GAMEDATA_H

#include <QObject>
#include <qqml.h>
#include <QtQml/qqmlregistration.h>

#include "playermodel.h"
#include "turnmodel.h"
#include "countuptimer.h"

class GameData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool running READ running WRITE setRunning NOTIFY runningChanged FINAL)
    Q_PROPERTY(int turn READ turn NOTIFY turnChanged FINAL)
    Q_PROPERTY(int totalTime READ totalTime WRITE setTotalTime NOTIFY totalTimeChanged FINAL)
    Q_PROPERTY(PlayerModel* players READ players WRITE setPlayers NOTIFY playersChanged FINAL)
    Q_PROPERTY(TurnModel* turns READ turns WRITE setTurns NOTIFY turnsChanged FINAL)
    Q_PROPERTY(QString elapsedTime READ elapsedTime NOTIFY elapsedTimeChanged FINAL)
    Q_PROPERTY(int controlPaneIndex READ controlPaneIndex NOTIFY controlPaneIndexChanged FINAL)
    QML_SINGLETON
    QML_ELEMENT
public:
    explicit GameData(QObject *parent = nullptr);

    Q_INVOKABLE void reset();
    Q_INVOKABLE void start();

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

    TurnModel *turns() const;
    void setTurns(TurnModel *turns);

    int controlPaneIndex() const;
    void setControlPaneIndex(int newControlPaneIndex);

signals:
    void turnChanged();
    void totalTimeChanged();
    void runningChanged();
    void playersChanged();
    void elapsedTimeChanged();
    void turnsChanged();

    void controlPaneIndexChanged();

private:
    CountUpTimer* m_timer = nullptr;
    int m_turn = 1;
    int m_totalTime = 0;
    bool m_running = false;
    PlayerModel *m_playerModel = nullptr;
    TurnModel *m_turnsModel = nullptr;
    int m_controlPaneIndex = 0;
};

#endif // GAMEDATA_H
