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

    color: "black"

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
        }
        ColumnLayout  {
            id: mainLayout
            spacing: 1
            anchors.fill: parent

            Rectangle {
                id: node_header
                color: "#246283"
                //color: "transparent"
                implicitWidth: header_layout.implicitWidth
                implicitHeight: 66
                Layout.fillWidth: true

                RowLayout {
                    id: header_layout
                    anchors.fill: parent

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

            Rectangle {
                id: node_body
                color: "#303030"

                implicitWidth:  bodyLayout.implicitWidth
                implicitHeight: bodyLayout.implicitHeight
                Layout.fillWidth: false
                Layout.fillHeight: false

                ColumnLayout {
                    id: bodyLayout

                    ZParam {
                        id: param1
                        name: "position"
                        control: ZQuickParam.CTRL_VEC3
                    }

                    ZParam {
                        id: param2
                        name: "Noise Element Size"
                        control: ZQuickParam.CTRL_LINEEDIT
                    }
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
