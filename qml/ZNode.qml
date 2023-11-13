import QtQuick 2.12
import QtQuick.Layouts 1.3
import ZQuickNode 1.0
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


ZQuickNode {
    id: thisnode

    //property list<ZParam> params

    implicitWidth:  qmlnode.implicitWidth
    implicitHeight: qmlnode.implicitHeight

    Rectangle {
        id: qmlnode

        anchors.fill: parent

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

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            drag.target: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: {
                if (mouse.button == Qt.LeftButton) {
                    console.log(thisnode.params.length);
                }

                if (mouse.button == Qt.RightButton) {
                    var component = Qt.createComponent("qrc:/qml/ZParam.qml");
                    if (component.status == Component.Ready) {
                        var obj = component.createObject()
                        obj.name = "pos"
                        thisnode.params.push(obj)
                        //
                        //console.log("ok!")
                    }
                }
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

                    /*
                    ListModel {
                        id: myModel
                        Component.onCompleted: {
                            //myModel.append({paramInfo: {name: "position"}});
                            //myModel.append({paramInfo: {name: "scale233"}});
                        }
                    }*/

                    /*
                    Repeater{
                        //model: myModel
                        model: thisnode.params
                        
                        ZParam {
                            name: modelData.name
                        }
                    }
                    */

                    /*
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
                    */
                }

                //bottom space
                FixSpacer { width: 1; height: 16 }
            }
        }

        Connections {
            target: thisnode
            function onNewparamCommand()
            {
                //params.add(new ZParam {name:"param3"})
                console.log("onNewparamCommand")
            }
            function onParams_changed()
            {
                for (let i = 0; i < thisnode.params.length; i++)
                {
                    var paramObj = thisnode.params[i]
                    paramObj.parent = mainLayout
                }
                console.log("onParams_changed")
            }
        }

        Component.onCompleted: {
            for (let i = 0; i < thisnode.params.length; i++)
            {
                var paramObj = thisnode.params[i]
                paramObj.parent = mainLayout
            }
             /*
              var component = Qt.createComponent("qrc:/qml/ZParam.qml");
              if (component.status == Component.Ready) {
                    var obj = component.createObject()
                    obj.name = "pos"
                    obj.parent = mainLayout
                    thisnode.params.push(obj)
                    console.log("ok!")
             }
             */
        }
    }
}

/*
Rectangle {
    id: qmlnode
    property string ident
    property alias name: thisnode.name
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
    }

    MouseArea {
        id: mouseArea1
        anchors.fill: parent
        drag.target: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onPressed: {
            //qmlnode.beginDrag = Qt.point(qmlnode.x, qmlnode.y);
        }
        onReleased: {
            
        }
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

            //bottom space
            FixSpacer { width: 1; height: 16 }
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
*/