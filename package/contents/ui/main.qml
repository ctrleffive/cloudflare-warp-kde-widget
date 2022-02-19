import QtQuick 2.5

import org.kde.kquickcontrolsaddons 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0

Item {
    id: widget
    property bool isServiceRunning: false

    Plasmoid.icon: {
        if (isServiceAvailable()) {
            return widget.isServiceRunning ? 'ubuntuone-client-idle' : 'ubuntuone-client-offline'
        }
        return 'ubuntuone-client-error'
    }
    Plasmoid.toolTipMainText: i18n("Cloudflare WARP")
    Plasmoid.toolTipSubText: {
        if (widget.isServiceRunning) {
            return i18n(widget.isServiceRunning ? "WARP is Connected." : "WARP is Not Connected.")
        }
        return i18n("Serive is not running!")
    }

    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

    Plasmoid.compactRepresentation: PlasmaCore.IconItem {
        active: compactMouseArea.containsMouse
        source: plasmoid.icon

        MouseArea {
            id: compactMouseArea
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton
            onClicked: toggleInhibition()
        }
    }

    Plasmoid.onActivated: toggleInhibition()

    function toggleInhibition() {
        widget.isServiceRunning = !widget.isServiceRunning
    }

    function isServiceAvailable() {
        return false
    }
}
