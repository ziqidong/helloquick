import QtQuick 2.12
import QtQuick.Layouts 1.3
import ZQuickNode 1.0
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4



Rectangle {
    id: qmlnode
    property string ident
    property string name
    //property list<ZParam> params

    property int repeaterIndex

    color: "#303030"

    signal showNodeMenu(var qmlnode, var pos)

    CustomBorder
    {
        commonBorderWidth: 2
        borderColor: "black"
    }

    implicitWidth:  mainLayout.implicitWidth
    implicitHeight: mainLayout.implicitHeight

    ZQuickNode {
        id: thisnode
        name: parent.name
    }

    MouseArea {
        id: mouseArea1
        anchors.fill: parent
        drag.target: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        /*
        onPressed: {
            //qmlnode.beginDrag = Qt.point(qmlnode.x, qmlnode.y);
        }
        onReleased: {
            
        }
        */
        onClicked: {
            if (mouse.button == Qt.RightButton) {
                showNodeMenu(qmlnode, Qt.point(mouse.x, mouse.y))
            }
            qmlnode.forceActiveFocus()  //make all textInput focus out
        }
        ColumnLayout  {
            id: mainLayout
            spacing: 0
            anchors.fill: parent

            Rectangle {
                id: node_header
                color: "#246283"
                implicitWidth: header_layout.implicitWidth
                implicitHeight: 66
                Layout.fillWidth: true

                RowLayout {
                    id: header_layout
                    anchors.fill: parent

                    FixSpacer { width: 24; height: 1 }

                    Text {
                       id: btnshowparams
                       text: thisnode.name
                       font.family: "Consolas"
                       font.pixelSize: 20;
                       font.bold: true;
                       color: "white"
                    }

                    FillSpacer {}

                    StatusBtnGroup {

                    }
                }
            }

            FixSpacer { width: 1; height: 16 }

            ColumnLayout {
                id: bodyLayout
                anchors.margins: 8

                ZParam {
                    id: param1
                    name: "position"
                    control: ZQuickParam.CTRL_VEC3
                }

                ZParam {
                    id: param2
                    name: "scaleSize"
                    control: ZQuickParam.CTRL_LINEEDIT
                }

                ZParam {
                    id: param3
                    name: "rotation"
                    control: ZQuickParam.CTRL_VEC3
                }

                ZParam {
                    id: param4
                    name: "hasNormal"
                    control: ZQuickParam.CTRL_CHECKBOX
                }

                ZParam {
                    id: param5
                    name: "hasVertUV"
                    control: ZQuickParam.CTRL_CHECKBOX
                }

                ZParam {
                    id: param6
                    name: "isFlipFace"
                    control: ZQuickParam.CTRL_CHECKBOX
                }

                ZParam {
                    id: param7
                    name: "div_w"
                    control: ZQuickParam.CTRL_MULTITEXT
                }

                ZParam {
                    id: param8
                    name: "div_h"
                    control: ZQuickParam.CTRL_LINEEDIT
                }

                ZParam {
                    id: param9
                    name: "div_d"
                    control: ZQuickParam.CTRL_LINEEDIT
                }

                ZParam {
                    id: param10
                    name: "size"
                    control: ZQuickParam.CTRL_LINEEDIT
                }

                ZParam {
                    id: param11
                    name: "quads"
                    control: ZQuickParam.CTRL_CHECKBOX
                }

                ZParam {
                    id: param12
                    name: "SRC"
                }

                ZParam {
                    id: param13
                    input: false
                    name: "prim"
                }

                ZParam {
                    id: param14
                    input: false
                    name: "DST"
                }
            }
        }
    }

    Connections {
        target: thisnode
        function onNewparamCommand()
        {
            //params.add(new ZParam {name:"param3"})
            console.log("onNewparamCommand")
        }
    }
}
