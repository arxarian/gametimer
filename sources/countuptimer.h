#ifndef COUNTUPTIMER_H
#define COUNTUPTIMER_H

#include <QObject>
#include <QQmlEngine>
#include <QTimer>

class CountUpTimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int elapsedTime READ elapsedTime NOTIFY elapsedTimeChanged FINAL)
    QML_ELEMENT
public:
    explicit CountUpTimer(QObject *parent = nullptr);

    void start();
    void stop();
    void reset();

    int elapsedTime() const;

signals:
    void elapsedTimeChanged();

private:
    int m_elapsedTime = 0;
    QTimer* m_timer = nullptr;

private slots:
    void updateElapsedTime();
};

#endif // COUNTUPTIMER_H
