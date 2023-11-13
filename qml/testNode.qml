import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    //Graph {
    //    anchors.fill: parent
    //}

    //ZNode {
    //    id: yyy_CreateCube
    //    name: "CreateCube"
    //}

    Repeater{
        model: nodesModel

        delegate: ZNode {
            required property string name
            required property string ident
            required property variant params
            arg_name: name
            arg_ident: ident
            paramModel: params
            x: 200
            y: 150
        }
    }

    /*
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

        onClicked: mouseArea.forceActiveFocus()  //make all textInput focus out: https://stackoverflow.com/questions/55101332/how-to-achieve-click-an-area-outside-the-textfield-to-make-the-textfield-lose-fo

        ZNode {
            id: yyy_CreateCube
            name: "CreateCube"
        }

        ZNode {
            id: xxx_CreateSphere
            name: "CreateSphereCreateSphereCreateSphere"
            x: 200
            y: 150
        }

        Edge {
            id: edgetest
            visible: true
            point1x: yyy_CreateCube.x
            point1y: yyy_CreateCube.y
            point2x: xxx_CreateSphere.x
            point2y: xxx_CreateSphere.y
            color: "blue"
            thickness: 2
        }
    }
    */
}