import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


RowLayout {
    id: qmlparam
    property string name;
    ZQuickParam {
        id: thisdata
        name: qmlparam.name
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
    Button {
        id: button1
        text: thisdata.name
        //Layout.fillWidth: true
    }
    spacing: 20
}