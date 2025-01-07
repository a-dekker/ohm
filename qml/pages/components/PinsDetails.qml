import QtQuick 2.6
import Sailfish.Silica 1.0

Repeater {
    id: repeater
    property int pinTextMaxWidth: 0

    ListItem {
        width: parent.width
        contentHeight: Theme.itemSizeExtraSmall

        menu: Component {
            ContextMenu {
                MenuItem {
                    text: repeater.model.get(index).description
                    font.pixelSize: Theme.fontSizeSmall
                }
            }
        }

        onClicked: openMenu()

        Label {
            id: pinLabel
            anchors {
                left : parent.left
                leftMargin: Theme.paddingLarge
                rightMargin: Theme.paddingLarge
                verticalCenter: parent.verticalCenter
            }
            text: model.pin
            font.pixelSize: Theme.fontSizeExtraSmall
            color: Theme.primaryColor
        }

        Label {
            anchors {
                left: pinTextMaxWidth > 0 ? parent.left : pinLabel.right
                leftMargin: (pinTextMaxWidth > 0 ? (Theme.paddingLarge + pinTextMaxWidth) : 0) + Theme.paddingLarge*2
                rightMargin: Theme.paddingLarge*2
                verticalCenter: parent.verticalCenter
            }
            text: model.col
            font.pixelSize: Theme.fontSizeExtraSmall
            color: Theme.primaryColor
        }

        Label {
            anchors {
                left : parent.horizontalCenter
                leftMargin: Theme.paddingLarge
                rightMargin: Theme.paddingLarge
                verticalCenter: parent.verticalCenter
            }
            text: model.title
            font.pixelSize: Theme.fontSizeExtraSmall
            color: Theme.primaryColor
        }
    }
}
