#include "NodesModel.h"
#include "common.h"


NodesModel::NodesModel(QObject* parent)
{

}

NodesModel::~NodesModel()
{

}

QModelIndex NodesModel::index(int row, int column, const QModelIndex& parent) const
{
    if (row < 0 || row >= rowCount())
        return QModelIndex();
    return createIndex(row, 0);
}

QModelIndex NodesModel::parent(const QModelIndex& child) const
{
    return QModelIndex();
}

int NodesModel::rowCount(const QModelIndex& parent) const
{
    return m_nodes.size();
}

int NodesModel::columnCount(const QModelIndex& parent) const
{
    return 1;
}

bool NodesModel::hasChildren(const QModelIndex& parent) const
{
    return false;
}

QVariant NodesModel::data(const QModelIndex& index, int role) const
{
    NodeItem* item = m_nodes[m_row2id[index.row()]];

    switch (role) {
    case ROLE_OBJID:    return item->ident;
    case ROLE_OBJNAME:  return item->name;
    case ROLE_PARAMS:
    {
        //todo: how to return the params model.
    }
    default:
        return QVariant();
    }
}

bool NodesModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
    return _base::setData(index, value, role);
}

QModelIndexList NodesModel::match(const QModelIndex& start, int role,
    const QVariant& value, int hits,
    Qt::MatchFlags flags) const
{
    return QModelIndexList();
}

void NodesModel::appendNode(QString ident, QString name)
{
    int nRows = m_nodes.size();
    beginInsertRows(QModelIndex(), nRows, nRows);

    NodeItem* pItem = new NodeItem;
    pItem->setParent(this);
    pItem->ident = ident;
    pItem->name = name;
    pItem->params = new ParamsModel;

    m_row2id[nRows] = ident;
    m_id2Row[ident] = nRows;
    m_nodes.insert(ident, pItem);

    endInsertRows();
}

bool NodesModel::removeRows(int row, int count, const QModelIndex& parent)
{
    beginRemoveRows(parent, row, row);

    QString id = m_row2id[row];
    NodeItem* pItem = m_nodes[id];
    pItem->params->clear();

    for (int r = row + 1; r < rowCount(); r++)
    {
        const QString& id_ = m_row2id[r];
        m_row2id[r - 1] = id_;
        m_id2Row[id_] = r - 1;
    }

    m_row2id.remove(rowCount() - 1);
    m_id2Row.remove(id);
    m_nodes.remove(id);

    delete pItem;

    endRemoveRows();
    return true;
}