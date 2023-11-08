import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.6


Item {
    id: comp
    property int xoffset: 22
    property int side: 35

    implicitWidth: 3 * comp.side
    implicitHeight: parent.height

    StatusBtn {
        id: once_btn
        color: "#FFBD21"
        height: parent.height
        xoffset: comp.xoffset
        side: comp.side
    }

    StatusBtn {
        id: mute_btn
        color: "#E302F8"
        height: parent.height
        xoffset: comp.xoffset
        side: comp.side
        x: comp.side
    }

    StatusBtn {
        id: view_btn
        color: "#30BDD4"
        height: parent.height
        xoffset: comp.xoffset
        side: comp.side
        lastBtn: true
        x: comp.side * 2
    }
}