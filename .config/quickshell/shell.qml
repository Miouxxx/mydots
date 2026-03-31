import QtQuick              // Le moteur graphique (rectangles, textes, animations)
import Quickshell           // Le coeur de Quickshell
import Quickshell.Wayland   // Pour que Quickshell parle avec Wayland
import Quickshell.Hyprland  // Le module "magique" qui lit les infos de Hyprland

ShellRoot {
    PanelWindow {
        id: mainBar
        anchors.top: true    // Coller en haut
        anchors.left: true   // Coller à gauche
        anchors.right: true  // Coller à droite
        height: 45           // Hauteur de la barre
        
        // Effet flottant : on ajoute des marges
        margins.top: 8
        margins.left: 12
        margins.right: 12

        color: "transparent" // On met transparent car on va dessiner un rectangle dedans

Rectangle {
            anchors.fill: parent
            radius: 12
            color: "#CC16161e" // Couleur sombre (Night Owl / Tokyo Night) à 80% d'opacité
            border.color: "#3b4261"
            border.width: 1

            // On utilise une Row (rangée) pour aligner nos futurs widgets
            Row {
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                spacing: 20


// Widget des bureaux
                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8

                    Repeater {
                        // On demande à Hyprland la liste des bureaux actifs
                        model: Hyprland.workspaces
                        
                        Rectangle {
                            // Si le bureau est celui sur lequel on est : large, sinon : petit point
                            width: modelData.id == Hyprland.focusedWorkspace.id ? 24 : 8
                            height: 8
                            radius: 4
                            color: modelData.id == Hyprland.focusedWorkspace.id ? "#7aa2f7" : "#444b6a"

                            // L'ANIMATION : C'est ça qui fait le côté "pro"
                            Behavior on width { 
                                NumberAnimation { duration: 250; easing.type: Easing.OutCubic } 
                            }
                        }
                    }
                }

} // Fin de la Row
        } // Fin du Rectangle
    } // Fin du PanelWindow
} // Fin du ShellRoot
