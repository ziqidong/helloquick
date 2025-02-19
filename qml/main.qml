import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import MyTestImportUri  1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: appWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MyTestQmlName {
        id: myTest
        onM_a_changed: {
            console.log("onM_a_changed")
        }
    }

    MyTestQmlName {
        id: myTest2
    }

    Button {
        id: button
        text: "按钮:" + myTest.a_value
        onClicked: {
            console.log("修改a_value为6.")
            myTest.a_value = 6;
        }
    }

    Button {
        id: button2
        y: 100
        text: "按钮:" + myTest2.a_value
        onClicked: {
            console.log("修改a_value为6.")
            myTest2.a_value = 6;
        }
    }

}