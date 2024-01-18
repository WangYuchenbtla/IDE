import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Rectangle {
    id: root
    color: Colors.surface2

    required property ApplicationWindow rootWindow
    property alias currentTabIndex: tabBar.currentIndex

    ColumnLayout {
        anchors.fill: root
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        spacing: 10

        Container {
            id: tabBar

            Layout.fillWidth: true

            ButtonGroup {
                buttons: tabBar.contentItem.children
                onCheckedButtonChanged: tabBar.setCurrentIndex(Math.max(0, buttons.IndexOf(checkedButton)))
            }

            contentItem: ColumnLayout {
                spacing: tabBar.spacing

                Repeater {
                    model: tabBar.contentModel
                }
            }

            component SidebarEntry: Button {
                id: sidebarButton
                icon.color: down || check ? Colors.iconIndicator : Colors.icon
                icon.width: 35
                icon.height: 35
                leftPadding: 8 + indicator.width

                background: null

                Rectangle {
                    id: indicator
                    x: 4
                    anchors.verticalCenter: parent.verticalCenter
                    width: 4
                    height: sidebarButton.icon.height
                    color: Colors.color1
                    visible: sidebarButton.checked
                }
            }

            SidebarEntry {
                icon.source: "../icons/read.svg"
                checkable: true
                checked: true

                Layout.alignment: Qt.AlignHCenter
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            WindowDragHandler {
                dragWindow: rootWindow
            }

        }

        SidebarEntry {
            id: accountButton
            icon.source: "../icons/globe.svg"
            checkable: false

            onClicked: null
        }
        SidebarEntry {
            id: settingsButton
            icon.source: '../icons/info_sign.svg'
            checkable: false

            onClicked: null
        }
    }
}
