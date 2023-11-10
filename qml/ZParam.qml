import QtQuick 2.12
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
import QtQuick.Controls.Styles 1.4


RowLayout {
    id: qmlparam
    property alias name: thisdata.name
    property alias control: thisdata.control
    property alias input: thisdata.input

    spacing: 10

    ZQuickParam {
        id: thisdata
    }

    function createSocket(isInput) {
        var component = Qt.createComponent("qrc:/qml/Socket.qml");
        if (component.status == Component.Ready) {
            var obj = component.createObject(qmlparam)
            obj.input = isInput
    }
    }

    function createName() {
        var component = Qt.createComponent("qrc:/qml/SocketName.qml");
        if (component.status == Component.Ready) {
            var obj = component.createObject(qmlparam)
            obj.text = thisdata.name
        }
    }

    function createFillSpacer() {
        var component = Qt.createComponent("qrc:/qml/FillSpacer.qml");
        if (component.status == Component.Ready) {
            var obj = component.createObject(qmlparam)
        }
    }

    function createFixSpacer() {
        var item = Qt.createQmlObject('import QtQuick 2.12; Rectangle {color: "transparent"; width: 6; height: 1}',qmlparam);
    }

    function createControl() {
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
        if (component) {
        if (component.status == Component.Ready) {
            var controlObj = component.createObject(qmlparam)
            if (thisdata.control == ZQuickParam.CTRL_LINEEDIT || thisdata.control == ZQuickParam.CTRL_MULTITEXT)
                controlObj.Layout.fillWidth = true
        }
    }
    }

    Component.onCompleted: {
        if (thisdata.input) {
            createSocket(true)
            createName()
            createFillSpacer()
            createControl()
            createFixSpacer()
        }
        else {
            createFillSpacer()
            createName()
            createSocket(false)
        }
    }
}