import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.1

ApplicationWindow {
    id: rootItem
    visible: true
    width: 400
    height: 600
    title: "树状结构示例"

    Component {
        id: checkboxComp
        CheckBox {
            id: checkbox
            anchors.centerIn: parent
            checked: true
            text: ""

            onToggled: {
            }

            indicator: Rectangle {
                width: 12 // 勾选框宽度
                height: 12 // 勾选框高度
                color: "transparent"
                border.color: "black"
                Canvas {
                    id: canvas
                    anchors.fill: parent

                    onPaint: {
                        var ctx = getContext("2d");
                        ctx.clearRect(0, 0, width, height);

                        if (checkbox.checked) {
                            ctx.beginPath();
                            ctx.strokeStyle = "black"; // 设置对钩颜色
                            ctx.lineWidth = 1; // 设置对钩线条宽度
                            // 绘制对钩路径
                            ctx.moveTo(width * 0.2, height * 0.5); // 起点
                            ctx.lineTo(width * 0.4, height * 0.7); // 中间点
                            ctx.lineTo(width * 0.8, height * 0.3); // 终点
                            ctx.stroke(); // 绘制路径
                        }
                    }
                    // 确保绘制逻辑在状态变化时生效
                    Component.onCompleted: canvas.requestPaint()
                    Connections {
                        target: checkbox
                        function onCheckedChanged() {
                            canvas.requestPaint()
                        }
                    }
                }
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
            }
        }
    }

    Loader {
        id: tabcheckboxLoader
        Layout.fillWidth: true
        anchors.verticalCenter: parent.verticalCenter
        sourceComponent: checkboxComp
        onLoaded: {
            if(tabcheckboxLoader.item && tabname !== "") {
                tabcheckboxLoader.item.text = tabname
            }
        }
    }

    Component {
    id: triangleArrow
    Canvas {
        id: triangleCanvas
        width: 20
        height: 20
        signal clicked() // 自定义信号
        property bool isExpanded: true // 初始状态为展开
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height); // 清除画布
                        
            // 设置旋转中心为画布的中心
            ctx.save();
            ctx.translate(width / 2, height / 2); // 移动到中心点
            ctx.rotate(rotationAngle);  // 旋转三角形
                        
            // 绘制三角形（初始指向右侧）
            ctx.beginPath();
            ctx.moveTo(2, 0);  // 右顶点
            ctx.lineTo(-4, -6); // 左上角
            ctx.lineTo(-4, 6);  // 左下角
            ctx.closePath();
                        
            ctx.fillStyle = "gray"; // 设置填充颜色
            ctx.fill(); // 填充三角形
            ctx.restore();  // 恢复状态
        }

        property real rotationAngle: 0 // 初始角度为0

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            onClicked: {
                // 根据展开状态来旋转
                if (triangleCanvas.isExpanded) {
                    triangleCanvas.rotationAngle += Math.PI / 2; // 收起时逆时针旋转90度
                } else {
                    triangleCanvas.rotationAngle -= Math.PI / 2; // 展开时顺时针旋转90度
                }
                triangleCanvas.clicked();
                // 切换展开/收起状态
                triangleCanvas.isExpanded = !triangleCanvas.isExpanded;
                // groupComp.visible = triangleCanvas.isExpanded; // 控制子项可见性
                triangleCanvas.requestPaint(); // 请求重绘
            }
        }
    }
}
}
