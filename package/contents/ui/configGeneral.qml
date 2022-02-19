import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    id: page

    property alias cfg_showLabel: showLabel.checked
    property alias cfg_showIcon: showIcon.checked
    property alias cfg_labelText: labelText.text

    CheckBox {
        id: showLabel
        Kirigami.FormData.label: i18n("Section:")
        text: i18n("Show labelss")
    }
    CheckBox {
        id: showIcon
        text: i18n("Show icon")
    }
    TextField {
        id: labelText
        Kirigami.FormData.label: i18n("Label:")
        placeholderText: i18n("Placeholder")
    }
}
