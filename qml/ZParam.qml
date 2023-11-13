import QtQuick 2.12
import QtQuick.Layouts 1.3
import ZQuickParam 1.0
import QtQuick.Controls.Styles 1.4


RowLayout {
    id: qmlparam
    property string arg_name
    property string arg_control
    property string arg_isinput

    spacing: 10

    /*
    Socket {}
    Text {
        text: qmlparam.arg_name
    }
    */

    function createSocket(isInput) {
        var component = Qt.createComponent("qrc:/qml/Socket.qml");
        if (component.status == Component.Ready) {
            var obj = component.createObject(qmlparam)
            obj.input = isInput
        }
    }

    function createName() {
        //只有这种写法能binding c++类扩展的数据
        var item = Qt.createQmlObject('
            import QtQuick 2.12;
            SocketName {
                text: qmlparam.name
            }'
            ,qmlparam);
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

        if (qmlparam.arg_control == ZQuickParam.CTRL_LINEEDIT)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZLineEditor.qml");
        }
        else if (qmlparam.arg_control == ZQuickParam.CTRL_COMBOBOX)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZCombobox.qml");
        }
        else if (qmlparam.arg_control == ZQuickParam.CTRL_MULTITEXT)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZTextEditor.qml");
        }
        else if (qmlparam.arg_control == ZQuickParam.CTRL_CHECKBOX)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZCheckBox.qml");
        }
        else if (qmlparam.arg_control == ZQuickParam.CTRL_VEC2)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZVec2Editor.qml");
        }
        else if (qmlparam.arg_control == ZQuickParam.CTRL_VEC3)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZVec3Editor.qml");
        }
        else if (qmlparam.arg_control == ZQuickParam.CTRL_VEC4)
        {
            component = Qt.createComponent("qrc:/qml/controls/ZVec4Editor.qml");
        }
        if (component) {
            if (component.status == Component.Ready) {
                var controlObj = component.createObject(qmlparam)
                if (qmlparam.arg_control == ZQuickParam.CTRL_LINEEDIT || qmlparam.arg_control == ZQuickParam.CTRL_MULTITEXT)
                    controlObj.Layout.fillWidth = true
            }
        }
    }

    Component.onCompleted: {
        if (qmlparam.arg_isinput) {
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
