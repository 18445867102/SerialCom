import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


CheckBox {
     id: control
     Layout.maximumHeight: 20
     Layout.fillWidth: true


     property string centerRectColor: 'lightslategrey'

     indicator: Rectangle {
         x: 1
         implicitWidth: 18
         implicitHeight: 18
         y: parent.height / 2 - height / 2
         radius: 3
         border.color: control.down ? "#606060" : "#909090"
         border.width: 1

         Rectangle {
             width: 10
             height: 10
             x: 4
             y: 4
             radius: 2
             color: control.down ? Qt.lighter(centerRectColor) : centerRectColor
             opacity: control.enabled ? 1 : 0.5
             visible: control.checked
         }
     }

     contentItem: Text {
         text: control.text
         font{family: 'Bookman Old Style'; pointSize: 9}
         leftPadding: 18
         opacity: control.checked ? 1.0 : 0.3
         color: "#303030"
         verticalAlignment: Text.AlignVCenter
     }
 }
