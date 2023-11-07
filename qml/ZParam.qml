import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Row {
    id: qmlparam
    property string name;
    ZQuickParam {
        id: thisdata
        name: qmlparam.name
    }
    Text {
        text: thisdata.name
        anchors.verticalCenter: parent.verticalCenter
    }
    Button {
        id: button1
        text: thisdata.name
    }
    spacing: 20
}