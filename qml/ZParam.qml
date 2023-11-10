import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
//import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4


RowLayout {
    id: qmlparam
    property alias name: thisdata.name
    property alias control: thisdata.control
    spacing: 10

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

    Component.onCompleted: {
        var component = null;
        var controlObj = null;

        if (thisdata.control == ZQuickParam.CTRL_LINEEDIT)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZLineEditor.qml");
        }
        else if (thisdata.control == ZQuickParam.CTRL_COMBOBOX)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZCombobox.qml");
        }
        else if (thisdata.control == ZQuickParam.CTRL_MULTITEXT)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZTextEditor.qml");
        }
        else if (thisdata.control == ZQuickParam.CTRL_CHECKBOX)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZCheckBox.qml");
        }
        else if (thisdata.control == ZQuickParam.CTRL_VEC2)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZVec2Editor.qml");
        }
        else if (thisdata.control == ZQuickParam.CTRL_VEC3)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZVec3Editor.qml");
        }
        else if (thisdata.control == ZQuickParam.CTRL_VEC4)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZVec4Editor.qml");
        }

        if (component.status == Component.Ready) {
            var controlObj = component.createObject(qmlparam)
            if (thisdata.control == ZQuickParam.CTRL_LINEEDIT || thisdata.control == ZQuickParam.CTRL_MULTITEXT)
                controlObj.Layout.fillWidth = true
        }
    }
}