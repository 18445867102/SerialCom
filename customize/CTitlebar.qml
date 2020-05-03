import QtQuick 2.9
import QtQuick.Window 2.2

import QtQuick.Controls 2.5


Rectangle { // Title Rectangle
    id: titleRect;
    color: "#202020";
    anchors.top: parent.top;
    anchors.left: parent.left;
    anchors.right: parent.right;
    height: 30;
    radius: 5

    property string title: ''
    MouseArea {
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton;
        property point clickPos: "0,0";
        onPressed: {
            clickPos  = Qt.point(mouse.x,mouse.y);
        }

        onPositionChanged: {
            //鼠标偏移量
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y);

            //如果mainwindow继承自QWidget,用setPos
            mainWindow.setX(mainWindow.x+delta.x);
            mainWindow.setY(mainWindow.y+delta.y);
        }
    }

    Label {
        id: titleWindowLabel;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        color: "#fffffb";
        font{bold: true;family:'Jokerman';pointSize: 12}
        text: title
    }
    Button {   //关闭按钮
        id: closeButton
        width: 30
        height: 18
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        hoverEnabled : true
        background: Image{
                id: closeBtnImg
                width: parent.height; height: parent.height
                anchors.centerIn: parent
                source: parent.hovered?"qrc:/icon/closebtn_hovered.png":"qrc:/icon/closebtn.png"
            }

        onClicked: {
            mainWindow.close()
        }
    }
    Button {   //最小化
        id: minButton
        width: 30
        height: 18
        anchors.right: closeButton.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 8
        hoverEnabled : true

        background: Image{
                id: minBtnImg
                width: parent.height; height: parent.height
                anchors.centerIn: parent
                source: parent.hovered?"qrc:/icon/minbtn_hovered.png":"qrc:/icon/minbtn.png"
            }

        onClicked:{
            mainWindow.showMinimized();
        }
    }
}  // Title Rectangle
