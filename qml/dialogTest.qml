// CustomDialog.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

Window {
    id: customDialog
    width: 400
    height: 200
    visible: false
    title: "对话框"
    flags: Qt.Dialog | Qt.WindowTitleHint | Qt.WindowCloseButtonHint

    Rectangle {
        width: parent.width
        height: parent.height
        color: "lightgray"

        Text {
            text: "这是一个带标题栏的可移动对话框。\n您确定要继续吗？"
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
        }

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            Button {
                text: "确定"
                onClicked: {
                    console.log("点击了确定")
                    customDialog.close()
                }
            }

            Button {
                text: "取消"
                onClicked: {
                    console.log("点击了取消")
                    customDialog.close()
                }
            }
        }
    }

    function openDialog() {
        customDialog.visible = true
    }
}
