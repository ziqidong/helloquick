import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4


RowLayout {
    id: qmlparam
    property alias name: thisdata.name
    property alias control: thisdata.control
    spacing: 20

    ZQuickParam {
        id: thisdata
    }

    Socket {
    }
    Text {
        text: thisdata.name
        font.pixelSize: 18
        font.bold: true
        font.family: "Consolas"
        color: "#dee6ed"
    }
    FillSpacer {}

    /*
    Button {
        id: button1
        text: thisdata.name
        //Layout.fillWidth: true
    }*/

    Component.onCompleted: {
        var component = Qt.createComponent("qrc:/qml/controls/ZLineEditor.qml");
        console.log(component.errorString())
        if (component.status == Component.Ready) {
            var controlObj = component.createObject(qmlparam)
            controlObj.Layout.fillWidth = true
        }
    }
}