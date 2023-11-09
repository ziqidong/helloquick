import QtQuick 2.12
import QtQuick.Controls 2.15

TextArea {
    id: multiline
    placeholderText: qsTr("Enter description")

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        border.color: control.enabled ? "#21be2b" : "transparent"
    }
}