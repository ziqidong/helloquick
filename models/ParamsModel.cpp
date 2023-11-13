#include "ParamsModel.h"


ParamsModel::ParamsModel(NODE_DESCRIPTOR desc, QObject* parent)
    : QStandardItemModel(parent)
{
    for (SOCKET_DESCRIPTOR socket_desc : desc.inputs)
    {
        QStandardItem* pItem = new QStandardItem;
        pItem->setData(socket_desc.name, ROLE_OBJNAME);
        pItem->setData(socket_desc.type, ROLE_PARAM_TYPE);
        pItem->setData(socket_desc.control, ROLE_PARAM_CONTROL);
        pItem->setData(true, ROLE_ISINPUT);
        appendRow(pItem);
    }

    for (SOCKET_DESCRIPTOR socket_desc : desc.outputs)
    {
        QStandardItem* pItem = new QStandardItem;
        pItem->setData(socket_desc.name, ROLE_OBJNAME);
        pItem->setData(socket_desc.type, ROLE_PARAM_TYPE);
        pItem->setData(false, ROLE_ISINPUT);
        appendRow(pItem);
    }
}

QVariant ParamsModel::data(const QModelIndex& index, int role) const
{
    return QStandardItemModel::data(index, role);
}

bool ParamsModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
    return QStandardItemModel::setData(index, value, role);
}