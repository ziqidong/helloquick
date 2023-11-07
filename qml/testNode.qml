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


    ZNode {
        id: yyy_CreateCube
        name: "CreateCube"
    }

    ZNode {
        id: xxx_CreateSphere
        name: "CreateSphere"
        x: 200
        y: 150
    }
}