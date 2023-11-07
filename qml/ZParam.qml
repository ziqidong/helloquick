import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


/*
Row {
    property string name;
    ZQuickParam {
        id: param_template
        name: parent.name
    }
    Text {
        text: param_template.name
        anchors.verticalCenter: parent.verticalCenter
    }
    Button {
        id: button1
        text: param_template.name
    }
    spacing: 20
}
*/

ZQuickParam {
    id: param_template
    Row {
        Text {
            text: param_template.name
            anchors.verticalCenter: parent.verticalCenter
        }
        Button {
            id: button1
            text: param_template.name
        }
        spacing: 20
    }
}