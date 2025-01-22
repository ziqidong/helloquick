import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts           1.3
ApplicationWindow {
    visible: true
    width: 500
    height: 400

    // 顶层容器使用 ColumnLayout
    ColumnLayout {
        width: parent.width
        height: parent.height

        // 上部 - Header
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true  // 占据剩余空间
            color: "lightgreen"
            Text {
                anchors.centerIn: parent
                text: "Header"
            }
        }

        // 中间部分 - ScrollView
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true  // 占据剩余空间

            ScrollView {
                anchors.fill: parent
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                clip:true

                // 创建内容区域
                Column {
                    width: parent.width
                    spacing: 10

                    // 创建50个条目
                    Repeater {
                        model: 50
                        delegate: Rectangle {
                            width: parent.width
                            height: 40
                            color: "lightblue"
                            Text {
                                anchors.centerIn: parent
                                text: "Item " + index
                            }
                        }
                    }
                }
            }
        }

        // 下部 - Footer
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true  // 占据剩余空间
            color: "lightcoral"
            Text {
                anchors.centerIn: parent
                text: "Footer"
            }
        }
    }
}
