import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.1
import QtQuick.Shapes 1.6
import QtQuick.Layouts 1.3

Window {
    id:win
    visible: true
    //width: 1024
    width: 1920
    //height: 768
    height: 1080

    title: qsTr("Hello World")

    GraphEditor{}
}
