import QtQuick 2.15
import Quickshell
import Quickshell.Services.UPower

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
      anchors.rightMargin: 15 * horloge.scale
      scale: 1.5
      color: "white"
      text: Qt.formatTime(new Date(), "hh:mm:ss")
    } // Fin de Text
    
    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: horloge.text = Qt.formatTime(new Date(), "hh:mm:ss")

    } // Fin de Timer

    Text {
      id: batterie
      anchors.left: parent.left
      anchors.verticalCenter: parent.verticalCenter
      anchors.leftMargin: 15 * batterie.scale
      scale: 1.5
      color: "white"
      text: Math.round(UPower.displayDevice.percentage * 100) + "%"

    } // Fin de Text

    Text {
      id: temps_de_decharge
      visible: UPower.displayDevice.state === UPowerDeviceState.Discharging
      anchors.left: batterie.right
      anchors.verticalCenter: parent.verticalCenter
      anchors.leftMargin: 30 * temps_de_decharge.scale
      scale: 1.5
      color: "white"
      text: Math.floor(UPower.displayDevice.timeToEmpty / 3600) + "h " + Math.floor((UPower.displayDevice.timeToEmpty % 3600) / 60) + "min"

    } // Fin de Text

    Text {
      id: temps_de_recharge
      visible: UPower.displayDevice.state === UPowerDeviceState.Charging
      anchors.left: batterie.right
      anchors.verticalCenter: parent.verticalCenter
      anchors.leftMargin: 30 * temps_de_decharge.scale
      scale: 1.5
      color: "white"
      text: Math.floor(UPower.displayDevice.timeToFull / 3600) + "h " + Math.floor((UPower.displayDevice.timeToFull % 3600) / 60) + "min"

    } // Fin de Text

} // Fin de PanelWindow
} // Fin de ShellRoot
