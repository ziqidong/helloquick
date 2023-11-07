import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: appWindow
    visible: true
    title: qsTr("Hello World")
    Rectangle {
        width: 360;
        height: 240;
        color: "#EEEEEE";
        id: rootItem;

        Text {
            id: centerText;
            text: "A Single Text.";
            anchors.centerIn: parent;
            font.pixelSize: 24;
            font.bold: true;
        }

        function setTextColor(clr){
            centerText.color = clr;
        }

        Row {
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 4;
            spacing: 4;

            Rectangle {
                width: 50;
                height: 30;
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
            }

            Rectangle {
                width: 50;
                height: 30;
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
            }

            Rectangle {
                width: 50;
                height: 30;
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
            }
        }
    }
}