import QtQuick 2.15
import Quickshell

ShellRoot {
  
  PanelWindow {
    height: 50
    color: "transparent"
    
    anchors {
        left: true
        top: true
        right: true
      } // fin de anchors
      
    Rectangle {
      anchors.fill: parent
      radius: 12
      color: "#CC16161e"
      border.color: "#3b4261"
      border.width: 1
      opacity: 1

    } // Fin de Rectangle
    
    Text {
      id: horloge
      anchors.right: parent.right
      anchors.verticalCenter: parent.verticalCenter
      anchors.rightMargin: 30
      scale: 1.5
      color: "white"
      text: Qt.formatTime(new Date(), "hh:mm:ss")
    } // Fin Text
    
    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: horloge.text = Qt.formatTime(new Date(), "hh:mm:ss")

    } // Fin Timer
} // Fin de PanelWindow
} // Fin de ShellRoot
