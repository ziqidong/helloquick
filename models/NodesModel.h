#ifndef __NODESMODEL_H__
#define __NODESMODEL_H__

#include <QObject>
#include <QAbstractItemModel>
#include <QString>
#include "ParamsModel.h"

struct NodeItem : public QObject
{
    QString ident;
    QString name;
    ParamsModel* params;
};

class NodesModel : public QAbstractItemModel
{
    Q_OBJECT
    typedef QAbstractItemModel _base;
public:
    NodesModel(QObject* parent = nullptr);
    ~NodesModel();

    //QAbstractItemModel
    QModelIndex index(int row, int column, const QModelIndex& parent = QModelIndex()) const override;
    QModelIndex parent(const QModelIndex& child) const override;
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    int columnCount(const QModelIndex& parent = QModelIndex()) const override;
    bool hasChildren(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
    QModelIndexList match(const QModelIndex& start, int role,
        const QVariant& value, int hits = 1,
        Qt::MatchFlags flags =
        Qt::MatchFlags(Qt::MatchStartsWith | Qt::MatchWrap)) const override;
    bool removeRows(int row, int count, const QModelIndex& parent = QModelIndex()) override;

    //NodesModel:
    void appendNode(QString ident, QString name);

private:
    QString m_graphName;
    QHash<QString, int> m_id2Row;
    QHash<int, QString> m_row2id;
    QHash<QString, NodeItem*> m_nodes;
};

#endif