import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

import QtGraphicalEffects 1.12

import 'qrc:/customize'
ApplicationWindow {
    id:mainWindow
    width: 880
    height: 680
    color: 'transparent'
    visible: true
    opacity: 1
    title: qsTr("SerialCom")
    flags: Qt.Window | Qt.FramelessWindowHint   //去标题栏

    DropShadow {
        width: mainRec.width
        height: mainRec.height-10
        anchors.bottom: mainRec.bottom
        anchors.horizontalCenter: mainRec.horizontalCenter
        radius: 16
        samples: 24
        fast: false
        color: "#808080"
        source: mainRec
    }
    Rectangle {
        id:mainRec
        x:20
        width: parent.width - 40
        height: parent.height - 20
        color: "#f3f8f9"


        CTitlebar{
            id:windowTitle
            title: mainWindow.title
            height: 32
            z:2
        }
        Rectangle{
            id:settingWindow
            width: parent.width
            height:140
            color: 'Gainsboro'
            y:-70
            z:1

            Behavior on y{ NumberAnimation{ duration: 200}}

            Grid{
                rows:3;rowSpacing: 4
                columns: 4;columnSpacing:10
                padding: 5
                width: parent.width
                Label{text:'Baudrate';font.family:'HGHZ_CNKI';verticalAlignment:Text.AlignVCenter}
                ComboBox{
                    id:baudrate
                    width:160
                    background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                    model: [4800,9600,19200,38400,57600,115200]
                    currentIndex: 5
                    onCurrentIndexChanged: {
                        SerialInterFace.setSerialPortBaudRate(currentIndex)
                    }
                }
                Label{text:'Data Bits';font.family:'HGHZ_CNKI'}
                ComboBox{
                    id:databits
                    width:140;
                    background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                    model: [5,6,7,8]
                    currentIndex: 3
                    onCurrentIndexChanged: {
                        SerialInterFace.setSerialPortDateBits(currentIndex)
                    }
                }
                Label{text:'Flow Control';font.family:'HGHZ_CNKI'}
                ComboBox{
                    id:flowcontrol
                    width:160;
                    background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                    model: ['NoFlowControl', 'HardwareControl', 'SoftwareControl']
                    onCurrentIndexChanged: {
                        SerialInterFace.setSerialFlowControl(currentIndex)
                    }
                }
                Label{text:'Parity';font.family:'HGHZ_CNKI'}
                ComboBox{
                    id:parity
                    width:140;
                    background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                    model: ['NoParity', 'EvenParity', 'OddParity', 'SpaceParity', 'MarkParity']
                    onCurrentIndexChanged: {
                        SerialInterFace.setSerialPortParity(currentIndex)
                    }
                }
                Label{text:'Open Mdoe';font.family:'HGHZ_CNKI'}
                ComboBox{
                    id:openmode
                    width:160;
                    background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                    model: ['ReadOnly', 'WriteOnly', 'ReadWrite']
                    currentIndex: 2
                }
                Label{text:'Stop Bits';font.family:'HGHZ_CNKI'}
                ComboBox{
                    id:stopbits
                    width:140;
                    background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                    model: [1,1.5,2]
                    onCurrentIndexChanged: {
                        SerialInterFace.setSerialPortStopBits(currentIndex)
                    }
                }
            }
            RowLayout{
                id: row
                width: parent.width
                anchors.bottom: settingWindow.bottom
                anchors.bottomMargin: 5
                spacing: 12

                RoundButton{
                    id:open
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 28
                    Layout.leftMargin: 5
                    Layout.alignment: Qt.AlignVCenter|Qt.AlignLeft
                    text:'Open'
                    highlighted : true
                    font.family: 'Bookman Old Style'
                    radius: 2
                    onClicked: {
                        SerialInterFace.setSerialPortBaudRate(baudrate.currentIndex)
                        SerialInterFace.setSerialPortDateBits(databits.currentIndex)
                        SerialInterFace.setSerialFlowControl(flowcontrol.currentIndex)
                        SerialInterFace.setSerialPortParity(parity.currentIndex)
                        SerialInterFace.setSerialPortStopBits(stopbits.currentIndex)
                        SerialInterFace.setSerialPortName(String(serialPortName.get(comboBox_comx.currentIndex).name))
                        SerialInterFace.openSerialPort(openmode.currentIndex)
                        console.log(String(serialPortName.get(comboBox_comx.currentIndex).name))
                    }
                }
                Label{
                    text: 'Port:'
                    Layout.alignment: Qt.AlignVCenter
                    transformOrigin: Item.Center
                    font.family: 'Bookman Old Style'
                }
                ComboBox{
                    id:comboBox_comx
                    Layout.fillWidth: true
                    Layout.rightMargin: 120
                    height: 28
                    background: Rectangle{
                        color: 'white'
                        border.color:'lightgrey'
                        radius: 4
                    }
                    textRole : "description"
                    model: ListModel{id: serialPortName}
                    onCurrentIndexChanged: {
                        SerialInterFace.setSerialPortName(String(serialPortName.get(currentIndex).name))
                    }
                }
                RoundButton{
                    id:settingButton
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 28
                    Layout.rightMargin: 5
                    text:'Setting'
                    background: Rectangle{color: 'WhiteSmoke'; radius: 2}
                    font.family: 'Bookman Old Style'
                    radius: 2
                    Layout.alignment: Qt.AlignVCenter|Qt.AlignRight
                    onClicked: {
                        if(settingWindow.y === windowTitle.height)
                        {
                            settingWindow.y = -70
                            icon.source = ''
                            settingButton.text = 'Setting'
                        } else{
                            settingWindow.y = windowTitle.height
                            icon.source = "qrc:/icon/arrow_hovered.png"
                            settingButton.text = ''
                        }
                    }
                }
            }
        }

        CSplitView{
            id:splitview
            anchors{
                top: parent.top
                topMargin: 75
                left: parent.left
                leftMargin: 8
                right: parent.right
                rightMargin: 8
                bottom:bottomlayout.top
            }
            orientation:Qt.Vertical
            handleDelegate:Rectangle{}

            Item {
                id:column1
                width: parent.width
                height: 180
                Layout.minimumHeight: 120
                TextArea{
                    id:textSend
                    background: Rectangle{border.color: 'Gainsboro';color: 'white';radius: 5 }
                    width: parent.width
                    anchors.top: parent.top
                    anchors.bottom: row1.top
                    anchors.bottomMargin: 5
                }
                Row{
                    id: row1
                    spacing: 5
                    width: parent.width
                    height:28
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    Label{text: 'InPut:'; anchors.verticalCenter: parent.verticalCenter;font.family: 'Bookman Old Style'}
                    TextArea{
                        width: 240
                        background: Rectangle{border.color: 'Gainsboro';color: 'white';radius: 5 }
                    }
                    ComboBox{
                        width: 110
                        background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                        model: ['LF','None']
                    }
                }
            }
            Flickable {
                id: flickable
                flickableDirection: Flickable.VerticalFlick
                width: parent.width
                Layout.fillHeight: true
                Layout.preferredHeight: 600
                Layout.bottomMargin: 5

                TextArea.flickable: TextArea {
                    id: textRecv
                    textFormat: Qt.RichText
                    wrapMode: TextArea.Wrap
                    focus: true
                    selectByMouse: true
                    persistentSelection: true
                    // Different styles have different padding and background
                    // decorations, but since this editor is almost taking up the
                    // entire window, we don't need them.
                    leftPadding: 6
                    rightPadding: 6
                    topPadding: 0
                    bottomPadding: 0
                    background: Rectangle{border.color: 'Gainsboro';color: 'white';radius: 5 }

                    MouseArea {
                        acceptedButtons: Qt.RightButton
                        anchors.fill: parent
                        onClicked: contextMenu.open()
                    }

                    onLinkActivated: Qt.openUrlExternally(link)
                }

                ScrollBar.vertical: ScrollBar {}
            }
//            TextArea{
//                id:textRecv
//                width: parent.width
//                Layout.fillHeight: true
//                Layout.preferredHeight: 600
//                Layout.bottomMargin: 5
//                background: Rectangle{border.color: 'Gainsboro';color: 'white';radius: 5 }
//                wrapMode:TextEdit.WrapAnywhere
//                selectByMouse : true

//                ScrollBar.vertical:  ScrollBar {
//                    id: vbar
//                    hoverEnabled: true
//                    active: hovered || pressed
//                    orientation: Qt.Vertical
//                    size: textRecv.contentHeight / textRecv.height
//                    width: 10
//                    anchors.top: parent.top
//                    anchors.right: parent.right
//                    anchors.bottom: parent.bottom
//                }
//            }
        }

        Row{
            id:bottomlayout
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.bottom: footer.top
            anchors.bottomMargin: 5
            spacing: 12
            Button{
                id:clear
                width: 91
                height: 28
                text:'Clear'
                anchors.verticalCenter: parent.verticalCenter
                background: Rectangle{color: 'White';radius: 2 }
                font.family: 'Bookman Old Style'
                Layout.alignment: Qt.AlignVCenter|Qt.AlignLeft
                onClicked: {
                    textRecv.clear()
                }
            }
            CCheckBox {
                text: qsTr("Hex OutPut")
                anchors.verticalCenter: parent.verticalCenter
                checkedState: 2
                checked: true
            }
        }

        Rectangle{
            id:footer
            width: parent.width
            height: 28
            anchors.bottom: parent.bottom
            color: 'transparent'
        }
    }

    Connections{
        target: SerialInterFace
        onSignalReceive:{
            textRecv.append(data)
        }
        //清空串口号列表
        onSignalClearComx:{ serialPortName.clear }
        //添加串口号
        onSignalAddComx:{
            serialPortName.append({"name": comName, "description": desc + '(' +comName + ')'})
        }
        Component.onCompleted: {
            SerialInterFace.upAvailablePorts()
        }
    }
}




/*##^## Designer {
    D{i:39;anchors_width:840}
}
 ##^##*/
