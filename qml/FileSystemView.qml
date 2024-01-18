import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import FileSystemModule

Rectangle {
    id: root
    signal fileClicked(string filePath)

    TreeView {
        id: fileSystemTreeView
        anchors.fill: parent
        model: fileSystemModel
        boundsBehavior: Flickable.StopAtBounds
        boundsMovement: Flickable.StopAtBounds
        clip: true

        property int lastIndex: -1
        Component.onCompleted: fileSystemTreeView.toggleExpanded(0)
        # TODO
    }
}
