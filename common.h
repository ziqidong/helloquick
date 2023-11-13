#pragma once

#include <QtWidgets>

//enum CONTROL_TYPE {
//    CTRL_NONE,
//    CTRL_LINEEDIT,
//    CTRL_MULTITEXT,
//    CTRL_PATH,
//    CTRL_COMBOBOX,
//    CTRL_VEC3
//};

enum PARAM_TYPE {
    ZPARAM_INT,
    ZPARAM_FLOAT,
    ZPARAM_STRING,
    ZPARAM_VEC3F,
};

enum MODEL_ROLE {
    ROLE_OBJID = Qt::UserRole + 1,
    ROLE_OBJNAME,
    ROLE_PARAMS,        //paramsmodel
    ROLE_PARAM_TYPE,
    ROLE_PARAM_CONTROL,
    ROLE_ISINPUT
};

enum PARAM_CTRL
{
    PARAM_CTRL_NONE,
    PARAM_CTRL_LINEEDIT,
    PARAM_CTRL_MULTITEXT,
    PARAM_CTRL_PATH,
    PARAM_CTRL_COMBOBOX,
    PARAM_CTRL_VEC2,
    PARAM_CTRL_VEC3,
    PARAM_CTRL_VEC4,
    PARAM_CTRL_CHECKBOX,
};
Q_ENUMS(PARAM_CTRL)

struct SOCKET_DESCRIPTOR
{
    QString name;
    QString type;
    PARAM_CTRL control;
};

struct NODE_DESCRIPTOR
{
    QString name;

    QList<SOCKET_DESCRIPTOR> inputs;
    QList<SOCKET_DESCRIPTOR> outputs;
};