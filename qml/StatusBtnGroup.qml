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
        basefillcolor: "#FFBD21"
        height: parent.height
        xoffset: comp.xoffset
        side: comp.side
    }

    StatusBtnSeperator {
        xoffset: comp.xoffset
        x: comp.side
    }

    StatusBtn {
        id: mute_btn
        basefillcolor: "#E302F8"
        height: parent.height
        xoffset: comp.xoffset
        side: comp.side
        x: comp.side + 1
    }

    StatusBtnSeperator {
        xoffset: comp.xoffset
        x: 2 * comp.side + 1
    }

    StatusBtn {
        id: view_btn
        basefillcolor: "#30BDD4"
        height: parent.height
        xoffset: comp.xoffset
        side: comp.side
        lastBtn: true
        x: comp.side * 2 + 2
    }
}