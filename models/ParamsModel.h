#ifndef __PARAMS_MODEL_H__
#define __PARAMS_MODEL_H__

#include <QObject>
#include <QStandardItemModel>
#include "common.h"

struct ParamItem
{
    QString name;
    QString type;
    PARAM_CTRL control;
    bool bInput = true;
};

class ParamsModel : public QStandardItemModel
{
    Q_OBJECT
public:
    ParamsModel(QObject* parent = nullptr);
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
};


#endif