import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.6


ApplicationWindow {
    id: appWindow
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rcid
        width: 200
        height: 64
        color: "black"

        StatusBtnGroup {
            anchors.top : parent.top
            anchors.bottom : parent.bottom
            anchors.right: rcid.right
            //height: 64
        }

        /*
        Shape {
            id: shapeid
            //width: 22+35
            //height: rcid.height
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            ShapePath {
                id: path
                strokeColor: "transparent"
                strokeWidth: 0
                fillColor: "red"
                capStyle: ShapePath.RoundCap

                property int joinStyleIndex: 0

                property variant styles: [
                    ShapePath.BevelJoin,
                    ShapePath.MiterJoin,
                    ShapePath.RoundJoin
                ]

                joinStyle: styles[joinStyleIndex]

                startX: 22
                startY: 0
                PathLine { x: 22 + 35; y: 0 }
                PathLine { x: 22 + 35 - 22; y: rcid.height}
                PathLine { x: 0; y: rcid.height }
            }
        }
        

        StatusBtn {
            id: view_btn
            color: "#30BDD4"
            height: parent.height
            xoffset: 22
            side: 35

            anchors.right: rcid.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            //x:12
        }
        */
    }


}