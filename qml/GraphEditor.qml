import QtQuick 2.3
import QtQuick.Controls 2.3
import QtQml.Models 2.1

Item {
    id: graphEditor
    anchors.fill: parent
    property real maxZoom: 2.0
    property real minZoom: 0.1

    MouseArea {
        id: graphEditorArea
        anchors.fill: parent
        property double factor: 1.15
        // Activate multisampling for edges antialiasing
        layer.enabled: true
        layer.samples: 8

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        drag.threshold: 0
        onWheel: {
            var zoomFactor = wheel.angleDelta.y > 0 ? factor : 1/factor
            var scale = draggable.scale * zoomFactor
            scale = Math.min(Math.max(minZoom, scale), maxZoom)
            if(draggable.scale == scale)
                return
            var point = mapToItem(draggable, wheel.x, wheel.y)
            draggable.x += (1-zoomFactor) * point.x * draggable.scale
            draggable.y += (1-zoomFactor) * point.y * draggable.scale
            draggable.scale = scale
        }
        onPressed: {
            if (mouse.button == Qt.MiddleButton) {
                drag.target = draggable // start drag
            }
        }
        onReleased: {
            drag.target = undefined // stop drag
        }
        Item {
            id: draggable
            // Main Layout
            MouseArea {
                id: mouseArea
                //width: 100
                //height: 100
                //drag.target: draggable
                // small drag threshold to avoid moving the node by mistake
                //drag.threshold: 2

                /*Repeater{
                    model: 100
                    delegate: NodePair{}
                }*/
                ListModel {
                    id: myModel
                    Component.onCompleted: {
                        myModel.append({nodeProp: {name: "CreateCube"}});
                        myModel.append({nodeProp: {name: "CreateSphere"}});
                    }
                }
                Repeater{
                    model: myModel
                    delegate: ZNode{
                        repeaterIndex: index    //index is managed by repeater
                        name: nodeProp.name
                        x: 200
                        y: 150
                        onShowNodeMenu:{
                            var globalPos = qmlnode.mapToItem(graphEditor, pos.x, pos.y)
                            menu.targetNodeRepeaterIndex = qmlnode.repeaterIndex
                            menu.x = globalPos.x
                            menu.y = globalPos.y
                            menu.open()
                        }
                    }
                }
            }
        }
    }

    Menu {
        id: menu
        title: "Node Menu"
        closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnEscape
        property var targetNodeRepeaterIndex: undefined
        onClosed: menu.targetNodeRepeaterIndex = undefined
        MenuItem {
            text: "Remove node"
            enabled: menu.targetNodeRepeaterIndex !== undefined
            onTriggered: {
                if (menu.targetNodeRepeaterIndex !== undefined)
                    myModel.remove(menu.targetNodeRepeaterIndex)
            }
        }
    }
}
