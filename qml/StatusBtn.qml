import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.6


Item {
    id: comp
    property alias color: path.fillColor
    property int xoffset: 22
    property int side: 35
    Shape {
        ShapePath {
            id: path
            strokeColor: "transparent"
            strokeWidth: 0
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap

            property int joinStyleIndex: 0

            property variant styles: [
                ShapePath.BevelJoin,
                ShapePath.MiterJoin,
                ShapePath.RoundJoin
            ]

            joinStyle: styles[joinStyleIndex]

            startX: comp.xoffset
            startY: 0
            PathLine { x: comp.xoffset + comp.side; y: 0 }
            PathLine { x: comp.xoffset + comp.side - comp.xoffset; y: comp.height}
            PathLine { x: 0; y: comp.height }
        }
    }
}


