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

class ParamControl
{
    Q_GADGET
public:
    explicit ParamControl() {}

    enum Value {
        None,
        Lineddit,
        Multiline,
        Pathedit,
        Combobox,
        Checkbox,
        Vec2edit,
        Vec3edit,
        Vec4edit
    };
    Q_ENUM(Value)
};

struct SOCKET_DESCRIPTOR
{
    QString name;
    QString type;
    ParamControl::Value control = ParamControl::None;
};

struct NODE_DESCRIPTOR
{
    QString name;

    QList<SOCKET_DESCRIPTOR> inputs;
    QList<SOCKET_DESCRIPTOR> outputs;
};