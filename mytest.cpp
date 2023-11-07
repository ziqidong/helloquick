#include "mytest.h"

MyTest::MyTest()
    :m_a(5)
{
    m_timer = new QTimer(this);
    connect(m_timer, SIGNAL(timeout()), this, SLOT(updateProp()));
    m_timer->start(1000);
}

int MyTest::getA()
{
    return m_a;
}

int MyTest::read_m_a()
{
    return m_a;
}

void MyTest::write_m_a(int wma)
{
    m_a = wma;
    m_a_changed();
}

void MyTest::updateProp()
{
    if (false) {
        m_a = 4;
        //write_m_a(4);
    }
}