#ifndef __PARAMS_MODEL_H__
#define __PARAMS_MODEL_H__

#include <QObject>
#include <QStandardItemModel>
#include <QQuickItem>
#include "common.h"

struct ParamItem
{
    QString name;
    QString type;
    ParamControl::Value control = ParamControl::None;
    bool bInput = true;
};

class ParamsModel : public QStandardItemModel
{
    Q_OBJECT
    QML_ELEMENT

public:
    ParamsModel(NODE_DESCRIPTOR desc, QObject* parent = nullptr);
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
    QHash<int, QByteArray> roleNames() const override;
};


#endif