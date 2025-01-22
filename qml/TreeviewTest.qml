import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: rootItem
    visible: true
    width: 400
    height: 600
    title: "树状结构示例"


    ListModel {
        id: treeModel
        ListElement {
            name: "Root 1"
            children: [
                ListElement {
                    name: "Child 1.1"
                    childrenn: [
                        ListElement { name: "Grandchild 1.1.1" },
                        ListElement { name: "Grandchild 1.1.2" },
                        ListElement { name: "Grandchild 1.1.3" }
                    ]
                },
                ListElement {
                    name: "Child 1.2"
                    childrenn: [
                        ListElement { name: "Grandchild 1.2.1" },
                        ListElement { name: "Grandchild 1.2.2" }
                    ]
                }
            ]
        }
    }

    property int currentIndex: -1 // 当前右键点击的条目索引
    Menu {
        id: contextMenu
        property var curidx : undefined
        MenuItem {
            text: "新增条目"
            onTriggered: {
                curidx.insert(currentIndex + 1, { name: "New Item", selected: false });
            }
        }
        MenuItem {
            text: "删除条目"
            onTriggered: {
                curidx.remove(currentIndex);
            }
        }
    }


    ScrollView {
        anchors.fill: parent

        contentItem: Flickable {
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: treeLayout.height
            clip: true

            ColumnLayout {
                id: treeLayout
                width: parent.width // 确保宽度与 ScrollView 一致
                spacing: 5
                Repeater {
                    model: treeModel
                    delegate: Loader {
                        Layout.fillWidth: true
                        sourceComponent: tabComp
                        onLoaded: {
                            item.nodeName = model.name
                            item.childrenNodes = model.children
                            item.indent = 0
                        }
                    }
                }
            }
        }
        
        
    }

    // treeNode：用于显示每个节点及其子节点
    Component {
        id: tabComp

        ColumnLayout {
            spacing: 2
            property string nodeName: ""
            property var childrenNodes: []
            property int indent: 0

            Rectangle {
                //width: parent.width
                height: 40
                color: "lightgray"
                Layout.fillWidth: true
                Layout.leftMargin: indent // 设置缩进

                Row {
                    spacing: 10
                    //anchors.fill: parent
                    CheckBox {
                        //id: toggle
                        text: nodeName
                        checked: true
                        onCheckedChanged: groupComp.visible = checked
                    }
                }
            }

            // 子节点递归显示
            ColumnLayout {
                id: groupComp
                Layout.fillWidth: true
                Layout.leftMargin: indent // 设置缩进
                visible: true
                spacing: 5
                Repeater {
                    model: childrenNodes
                    delegate: ColumnLayout {
                        Layout.fillWidth: true
                        Layout.leftMargin: 20 // 设置缩进

                        Rectangle {
                            //width: parent.width
                            height: 40
                            color: "lightblue"
                            Layout.fillWidth: true
                            //Layout.leftMargin: 20 // 设置缩进

                            Row {
                                spacing: 10
                                //anchors.fill: parent
                                CheckBox {
                                    //id: toggle
                                    text: name
                                    checked: true
                                    onCheckedChanged: paramComp.visible = checked
                                }
                            }
                        }
                        ColumnLayout {
                            id: paramComp
                            Layout.fillWidth: true
                            Layout.leftMargin: 20 // 设置缩进
                            spacing: 2
                            property string nodeName: ""
                            property int indent: 20

                            Repeater {
                                model: childrenn
                                delegate: Rectangle {
                                    id:param
                                    //width: parent.width
                                    height: 40
                                    color: "lightgreen"
                                    Layout.fillWidth: true
                                    //Layout.leftMargin: 20 // 设置缩进

                                    Row {
                                        spacing: 10
                                        //anchors.fill: parent
                                        CheckBox {
                                            //id: toggle
                                            text: name
                                            checked: true
                                        }
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        acceptedButtons: Qt.AllButtons
                                        onClicked: {
                                            // 单击选中条目
                                            for (let i = 0; i < childrenNodes.count; i++) {
                                                childrenNodes.setProperty(i, "selected", false);
                                            }
                                            childrenNodes.setProperty(index, "selected", true);
                                        }

                                        // 右键弹出菜单
                                        onPressed: if (mouse.button === Qt.RightButton) {
                                            currentIndex = index; // 保存当前条目索引
                                            contextMenu.x = mouse.x + param.mapToItem(null, 0, 0).x; // 使用全局坐标
                                            contextMenu.y = mouse.y + param.mapToItem(null, 0, 0).y;
                                            contextMenu.open();
                                        }
                                    }


                                }
                            }
                        }

                    }
                }
            }
        }
    }

}
