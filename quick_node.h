#ifndef QUICK_NODE_H
#define QUICK_NODE_H

#include <QObject>
#include <QQuickItem>
#include <QQmlListProperty>
#include "common.h"
#include "quick_parameter.h"

class ZQuickNode : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY name_changed)
    Q_PROPERTY(QQmlListProperty<ZQuickParam> params READ params NOTIFY params_changed)

public:
    ZQuickNode();
    QString getName();
    void setName(QString name);
    QQmlListProperty<ZQuickParam> params();
    void appendParam(ZQuickParam* par);
    int paramCount() const;
    ZQuickParam* param(int) const;
    void clearParam();

private:
    static void appendParam(QQmlListProperty<ZQuickParam>* list, ZQuickParam* s);
    static int paramCount(QQmlListProperty<ZQuickParam>*);
    static ZQuickParam* param(QQmlListProperty<ZQuickParam>*, int);
    static void clearParam(QQmlListProperty<ZQuickParam>*);

signals:
    void name_changed();
    void params_changed();
    void newparamCommand(QString paramName);

private slots:
    void onMockCoreCallback();

private:
    QString m_name;
    QList<ZQuickParam*> m_params;
    QTimer* m_timer;
};

#endif