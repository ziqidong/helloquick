import QtQuick 2.12
import QtQuick.Controls 2.0

Rectangle {
    id: backGround

    width: 96
    height: 26
    color: "#191D21"
    //border.color: "grey"

    property alias text:            textInput.text
        
    TextInput{
        id : textInput
        anchors.margins: 2
        anchors.fill: parent
        verticalAlignment: TextInput.AlignVCenter
        clip:true

        color: "#FFF"
        selectionColor: "#0078D7"
        font.pointSize: 12
        font.family: "Consolas"

        selectByMouse: true
        Keys.onEscapePressed: focus = false
    }
}