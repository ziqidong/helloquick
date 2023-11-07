import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickNode 1.0
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4



Rectangle {
    id: qmlnode
    property string ident
    property string name
    //property list<ZParam> params

    width: 150
    height: 250
    color: "green"
    border.color: "gray"
    border.width: 5

    ZQuickNode {
        id: thisnode
        name: parent.name
    }

    Column  {
        spacing: 15

        anchors.fill: parent
        anchors.margins: 0

        Text {
            id: btnshowparams
            text: thisnode.name
        }

        ZParam {
            id: param1
            name: "position"
        }

        ZParam {
            id: param2
            name: "scale233"
        }
    }

    MouseArea {
        id: mouseArea1
        anchors.fill: parent
        drag.target: parent
        onPressed: {
            //qmlnode.beginDrag = Qt.point(qmlnode.x, qmlnode.y);
        }
        onReleased: {
            
        }
    }
}


/*
ZQuickNode {
    id: nodeexample

    Rectangle {
        anchors.fill: parent
        color: "green"
        width: 150
        height: 250

        Column  {
            spacing: 15

            anchors.fill: parent
            anchors.margins: 0

            Text {
                id: btnshowparams
                text: nodeexample.name
            }

            ZParam {
                id: param1
                name: "position"
            }
        
            ZParam {
                id: param2
                name: "scale233"
            }
        }
    }

    Connections {
        target: nodeexample
        function onNewparamCommand()
        {
            //params.add(new ZParam {name:"param3"})
            console.log("onNewparamCommand")
        }
    }
}
*/