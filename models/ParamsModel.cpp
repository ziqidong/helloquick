#include "ParamsModel.h"


ParamsModel::ParamsModel(QObject* parent)
    : QStandardItemModel(parent)
{

}

QVariant ParamsModel::data(const QModelIndex& index, int role) const
{
    return QStandardItemModel::data(index, role);
}

bool ParamsModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
    return QStandardItemModel::setData(index, value, role);
}