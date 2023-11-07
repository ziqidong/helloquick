import QtQuick 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3
import ZQuickNode 1.0
import ZQuickParam 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Rectangle {
    id: nodetemplate
    property string ident
    property string name
    property list

    ZQuickNode {
        id: nodedata
        name: nodetemplate.name
    }


}

ZQuickNode {
    id: nodeexample

    params: [
        ZParam {name:"param1"},
        ZParam {name:"param2"}
    ]

    /*
    Rectangle {
        anchors.fill: parent

        Column  {
            spacing: 0

            anchors.fill: parent
            anchors.margins: 0

            ZParam {
                id: param1
                name: "position"
            }
        
            ZParam {
                id: param2
                name: "scale233"
            }
        }
    }
    */

    Button {
        id: btnshowparams
        text: params.length
    }

    Connections {
        target: nodeexample
        function onNewparamCommand()
        {
            //params.add(new ZParam {name:"param3"})
            console.log("onNewparamCommand")
        }
    }
}