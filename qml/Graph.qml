import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Rectangle {
    id: graph
    property var nodes: {0:0}
    color: "#13191F"

    MouseArea {
        id: menuMouse
        anchors.fill: parent
        acceptedButtons: Qt.RightButton

        onClicked: {
            contextMenu.popup()
        }

        Menu {
            id: contextMenu
            MenuItem {
                text: "Hit Test!"
                onTriggered:
                {
                    if ("yyy_CreateCube" in nodes)
                    {
                        var obj = nodes["yyy_CreateCube"]
                        obj.name = "damidami"
                        console.log("hit callback")
                    }
                }
            }
        }
    }

    //todo: desc args
    function createNode(ident, name)
    {
        /*
        ZNode {
            id: yyy_CreateCube
            name: "CreateCube"
        }
        */

        var component = Qt.createComponent("qrc:/qml/ZNode.qml");
        if (component.status == Component.Ready) {
            var obj = component.createObject(graph)
            obj.ident = ident
            obj.name = name
            nodes[ident] = obj
            return obj
        }
        return null
    }

    Component.onCompleted: {
        var node1 = createNode("yyy_CreateCube", "CreateCube")
        var node2 = createNode("xxx_CreateSphere", "CreateSphere")
    }
}