#include "NodesModel.h"
#include "common.h"
#include "Descriptors.h"


NodesModel::NodesModel(const QString& graphName, QObject* parent)
    : m_graphName(graphName)
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
        return QVariant::fromValue(item->params);
    }
    default:
        return QVariant();
    }
}

bool NodesModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
    NodeItem* item = m_nodes[m_row2id[index.row()]];

    switch (role) {
    case ROLE_OBJNAME:
        item->name = value.toString();
        emit dataChanged(index, index, QVector<int>{role});
        return true;
    }

    return false;
}

QModelIndexList NodesModel::match(const QModelIndex& start, int role,
    const QVariant& value, int hits,
    Qt::MatchFlags flags) const
{
    return QModelIndexList();
}

void NodesModel::appendNode(QString ident, QString name)
{
    auto* pDescs = Descriptors::instance();
    NODE_DESCRIPTOR desc = pDescs->getDescriptor(name);

    int nRows = m_nodes.size();
    beginInsertRows(QModelIndex(), nRows, nRows);

    NodeItem* pItem = new NodeItem;
    pItem->setParent(this);
    pItem->ident = ident;
    pItem->name = name;
    pItem->params = new ParamsModel(desc);

    m_row2id[nRows] = ident;
    m_id2Row[ident] = nRows;
    m_nodes.insert(ident, pItem);

    endInsertRows();
}

QHash<int, QByteArray> NodesModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ROLE_OBJNAME] = "name";
    roles[ROLE_OBJID] = "ident";
    roles[ROLE_PARAMS] = "params";
    return roles;
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


void NodesModel::updateParamName(QModelIndex nodeIdx, int row, QString newName)
{
    NodeItem* item = m_nodes[m_row2id[nodeIdx.row()]];
    QModelIndex paramIdx = item->params->index(row, 0);
    item->params->setData(paramIdx, newName, ROLE_OBJNAME);
}

void NodesModel::removeParam(QModelIndex nodeIdx, int row)
{
    NodeItem* item = m_nodes[m_row2id[nodeIdx.row()]];
    item->params->removeRow(row);
}

ParamsModel* NodesModel::params(QModelIndex nodeIdx)
{
    NodeItem* item = m_nodes[m_row2id[nodeIdx.row()]];
    return item->params;
}
