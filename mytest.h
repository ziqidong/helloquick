#ifndef MYTEST_H
#define MYTEST_H

#include <QObject>
#include <QTimer>

class MyTest : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int a_value READ read_m_a WRITE write_m_a NOTIFY m_a_changed)
public:
    MyTest();
    Q_INVOKABLE int getA();
    int read_m_a();
    void write_m_a(int wma);

signals:
    void m_a_changed();

public slots:
    void updateProp();

private:
    int m_a;
    QTimer* m_timer;
};


#endif