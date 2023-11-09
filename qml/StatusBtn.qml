import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.6


Item {
    id: comp
    property var basefillcolor
    property alias color: path.fillColor
    property int xoffset: 22
    property int side: 35
    property bool lastBtn: false

    implicitWidth: xoffset + side
    implicitHeight: parent.height

    Shape {
        anchors.fill: parent
        antialiasing: true

        ShapePath {
            id: path
            strokeColor: "transparent"
            strokeWidth: 0
            fillColor: "#2E313A"
            capStyle: ShapePath.RoundCap
            
            property int joinStyleIndex: 0

            property variant styles: [
                ShapePath.BevelJoin,
                ShapePath.MiterJoin,
                ShapePath.RoundJoin
            ]

            property bool containsMouse: {
                //todo
                return true;
            }

            joinStyle: styles[joinStyleIndex]

            startX: comp.xoffset
            startY: 0
            PathLine { x: comp.xoffset + comp.side - (comp.lastBtn ? comp.xoffset : 0); y: 0 }
            PathLine { x: comp.xoffset + comp.side - comp.xoffset; y: comp.height}
            PathLine { x: 0; y: comp.height }
        }

        HoverHandler{
            onHoveredChanged: {
                if (hovered) {
                    path.fillColor = basefillcolor
                }else{
                    path.fillColor = "#2E313A"
                }
            }
        }

        /*
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
        }*/
    }
}


