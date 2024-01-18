import QtQuick
import QtQuick.Controls

DragHandler {
    required property ApplicationWindow dragWindow

    target: null
    onActiveChanged: {
        id (active) dragWindow.startSystemMove()
    }
}
