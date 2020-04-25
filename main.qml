import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

import QtGraphicalEffects 1.12

import 'qrc:/customize'
ApplicationWindow {
    id:mainWindow
    width: 920
    height: 740
    color: 'transparent'
    visible: true
    opacity: 1
    title: qsTr("SerialCom")
    flags: Qt.Window | Qt.FramelessWindowHint

    DropShadow {
        anchors.topMargin: 2
        anchors.fill: mainRec
        radius: 14
        samples: 18
        fast: false
        color: "#505050"
        source: mainRec
    }

    Rectangle {
        id:mainRec
        x:20
        anchors.centerIn: parent
        width: parent.width-40
        height: parent.height-40
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
            height:70
            color: 'Gainsboro'
            y:0
            z:1

            Behavior on y{ NumberAnimation{ duration: 200}}
            Behavior on height{ NumberAnimation{ duration: 200}}

            property bool stateFlag: false
            property int animDuartion: 200
            property int layoutX1: 8
            property int layoutX2: 120
            property int layoutX3: 300
            property int layoutX4: 400
            property int layoutY1: 36
            property int layoutY2: 70
            property int layoutY3: 104
            Label{
                id:baudrateLabel;
                text:'BaudRate';
                font.family:'HGHZ_CNKI';
                verticalAlignment:Text.AlignVCenter
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: baudrateLabel;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges { target: baudrateLabel;x:settingWindow.layoutX1; y:settingWindow.layoutY1; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            ComboBox{
                id:baudrate
                width:160
                background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                model: [4800,9600,19200,38400,57600,115200]
                currentIndex: 5
                onCurrentIndexChanged: SerialInterFace.setSerialPortBaudRate(currentIndex)
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: baudrate;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges { target: baudrate;x:settingWindow.layoutX2; y:settingWindow.layoutY1; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            Label{
                id:dataBitsLabel
                text:'Data Bits';
                font.family:'HGHZ_CNKI'
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: dataBitsLabel;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges {target: dataBitsLabel;x:settingWindow.layoutX3; y:settingWindow.layoutY1; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]}
            ComboBox{
                id:databits
                width:140;
                background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                model: [5,6,7,8]
                currentIndex: 3
                onCurrentIndexChanged: SerialInterFace.setSerialPortDateBits(currentIndex)
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: databits;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges { target: databits;x:settingWindow.layoutX4; y:settingWindow.layoutY1; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            Label{
                id:flowControlLabel
                text:'FlowControl'
                font.family:'HGHZ_CNKI'
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: flowControlLabel;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges {target: flowControlLabel;x:8; y:settingWindow.layoutY2; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            ComboBox{
                id:flowcontrol
                width:160;
                background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                model: ['NoFlowControl', 'HardwareControl', 'SoftwareControl']
                onCurrentIndexChanged: SerialInterFace.setSerialFlowControl(currentIndex)
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: flowcontrol;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges { target: flowcontrol;x:settingWindow.layoutX2; y:settingWindow.layoutY2; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            Label{
                id:parityLabel
                text:'Parity';
                font.family:'HGHZ_CNKI'
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: parityLabel;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges {target: parityLabel;x:settingWindow.layoutX3; y:settingWindow.layoutY2; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            ComboBox{
                id:parity
                width:140;
                background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                model: ['NoParity', 'EvenParity', 'OddParity', 'SpaceParity', 'MarkParity']
                onCurrentIndexChanged: {SerialInterFace.setSerialPortParity(currentIndex)}
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: parity;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges { target: parity;x:settingWindow.layoutX4; y:settingWindow.layoutY2; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            Label{
                id:openModeLabel
                text:'Open Mdoe';
                font.family:'HGHZ_CNKI'
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: openModeLabel;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges {target: openModeLabel;x:settingWindow.layoutX1; y:settingWindow.layoutY3; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            ComboBox{
                id:openmode
                width:160;
                background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                model: ['ReadOnly', 'WriteOnly', 'ReadWrite']
                currentIndex: 2
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: openmode;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges { target: openmode;x:settingWindow.layoutX2; y:settingWindow.layoutY3; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            Label{
                id:stopBitsLabel
                text:'Stop Bits';
                font.family:'HGHZ_CNKI'
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: stopBitsLabel;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges {target: stopBitsLabel;x:settingWindow.layoutX3; y:settingWindow.layoutY3; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            ComboBox{
                id:stopbits
                width:140;
                background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                model: [1,1.5,2]
                onCurrentIndexChanged: {SerialInterFace.setSerialPortStopBits(currentIndex)}
                states: [
                    State {
                        name: "StateA"
                        when:settingWindow.stateFlag === false
                        PropertyChanges {target: stopbits;x:600; y:0; opacity:0}
                    },
                    State {
                        name: "StateB"
                        when:settingWindow.stateFlag === true
                        PropertyChanges { target: stopbits;x:settingWindow.layoutX4; y:settingWindow.layoutY3; opacity:1}
                    }
                ]
                state: "StateA"
                transitions: [
                    Transition {
                        from: "StateA";to: "StateB"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.OutCirc}
                    },
                    Transition {
                        from: "StateB";to: "StateA"
                        NumberAnimation{ properties: "x,y,opacity"; duration:settingWindow.animDuartion;easing.type: Easing.InCirc}
                    }
                ]
            }
            RowLayout{
                id: row
                width: parent.width
                anchors.bottom: settingWindow.bottom
                anchors.bottomMargin: 5
                spacing: 12

                RoundButton{
                    id:openButton
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
                        settingWindow.stateFlag = !settingWindow.stateFlag
                        if(settingWindow.height == 70)
                        {
                            settingWindow.height = 170
                        }else{
                            settingWindow.height = 70
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
                bottom: bottomlayout.top
                bottomMargin: 5
            }
            orientation:Qt.Vertical
            handleDelegate:Rectangle{}

            Item {
                id:column1
                width: parent.width
                height: 280

                ScrollView {
                    id: view
                    width: parent.width
                    anchors.top: parent.top
                    anchors.bottom: row1.top
                    anchors.bottomMargin: 5
                    TextArea {
                         background: Rectangle{width: view.width;height: view.height;
                             border.color: 'Gainsboro';color: 'white';radius: 5}
                         font{ family: 'Consolas'; pointSize: 10}
                    }
                }
                Item{
                    id: row1
                    width: parent.width; height:28
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    Label{
                        id: labelOutput
                        text: 'Output:'
                        enabled: !serialChart.checked
                        font.family: 'Bookman Old Style'
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    TextArea{
                        id:outTextArea
                        width: 240
                        enabled: !serialChart.checked
                        anchors.left: labelOutput.right
                        anchors.leftMargin: 10
                        background: Rectangle{border.color: 'Gainsboro';color: 'white';radius: 5 }
                    }
                    ComboBox{
                        width: 110
                        enabled: !serialChart.checked
                        anchors.left: outTextArea.right
                        anchors.leftMargin: 10
                        background: Rectangle{color: 'white';border.color:'lightgrey';radius: 4}
                        model: ['NONE','HEX','LF',]
                    }
                    CCheckBox {
                        id:serialChart
                        text: qsTr("SerialChart")
                        anchors.right: parent.right
                        checked: false
                    }
                }
            }

            FontLoader{ id: mfont;  source: "qrc:/font/Code.ttf" }
            Flickable {
                id: flickable
                flickableDirection: Flickable.VerticalFlick
                width: parent.width
                onHeightChanged: {background.height = height}
                TextArea.flickable:TextArea {
                    id: textRecv
                    textFormat: Qt.PlainText
                    wrapMode: TextArea.Wrap
                    focus: true
                    selectByMouse: true
                    persistentSelection: true
                    renderType:Text.NativeRendering
                    background: Rectangle {
                        id:background
                        height: 0
                        border.width: 1
                        border.color: "Gainsboro"
                        radius: 5
                    }
                    color: 'black'
                    font{ family: 'Consolas'; pointSize: 10}
                    MouseArea {
                        acceptedButtons: Qt.RightButton
                        anchors.fill: parent
                    }
                }
                ScrollBar.vertical: ScrollBar {}
            }
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
                width: 91; height: 28
                text:'Clear'
                anchors.verticalCenter: parent.verticalCenter
                background: Rectangle{color: 'White';radius: 2 }
                font.family: 'Bookman Old Style'
                Layout.alignment: Qt.AlignVCenter|Qt.AlignLeft
                onClicked: { textRecv.clear() }
            }
            CCheckBox {
                text: qsTr("HexReceive")
                anchors.verticalCenter: parent.verticalCenter
                checked: false
            }
        }

        Item {
            id:footer
            width: parent.width
            height: 28
            anchors.bottom: parent.bottom
            Canvas{
                width: 20; height: 20
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.lineWidth = 1.0
                    ctx.beginPath()
                    ctx.moveTo(0, 15)
                    ctx.lineTo(15, 0)
                    ctx.moveTo(5, 15)
                    ctx.lineTo(15, 5)
                    ctx.moveTo(10, 15)
                    ctx.lineTo(15, 10)
                    ctx.stroke();
                }
                MouseArea{

                    acceptedButtons:Qt.LeftButton
                    hoverEnabled: true
                    anchors.fill: parent
                    property real pressX
                    property real pressY
                    onEntered: {
                        cursorShape = Qt.SizeFDiagCursor
                    }
                    onExited: {
                        cursorShape = Qt.ArrowCursor
                    }
                    onClicked: {
                        pressX = mouse.x
                        pressY = mouse.y
                    }
                    onPositionChanged:{
                        if(pressedButtons === Qt.LeftButton){
                            mainWindow.width += mouse.x - pressX
                            mainWindow.height += mouse.y - pressY
                            mainWindow.width < 540 ? mainWindow.width = 540 : 0
                            mainWindow.height < 380 ? mainWindow.height = 380 : 0
                        }
                    }
                }
            }
        }
    }

    Connections{
        target: SerialInterFace
        onSignalReceive:{
            textRecv.insert(textRecv.length, String(data))  //insert at textend
        }

        onSignalClearComx:{ serialPortName.clear }
        onSignalAddComx:{
            serialPortName.append({"name": comName, "description": desc + '(' +comName + ')'})
        }

        onSignalIsopen:{
            if(isOpen === true){
                openButton.text = 'Close'
                settingButton.icon.source = ''
                settingButton.text = 'Setting'
                if(settingWindow.height == 170)
                {
                    settingWindow.height = 70
                    settingWindow.stateFlag = !settingWindow.stateFlag
                }
            }else
                openButton.text = 'Open'
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
