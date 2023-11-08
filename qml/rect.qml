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

    StatusBtn {
        color: "yellow"
        height: 75
    }

}