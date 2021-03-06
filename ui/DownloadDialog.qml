import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


Component {
    Dialog {
        id: dialog
        title: i18n.tr("Download")
        text: i18n.tr("Url of Fosdem Pentabarf XML:")

        property real value: 0.0
        property bool progress_visible: false

        Label {
            width: parent.width
            text: i18n.tr("All 'Checked' entries will be deleted!")
        }

        TextField {
            id: url
            text: "https://fosdem.org/2017/schedule/xml"
            width: parent.width
        }

        ProgressBar {
            id: progress
            width: parent.width
            value: dialog.value
            visible: dialog.progress_visible
        }

        Row {
            anchors.margins: units.gu(1)
            spacing: units.gu(1)
            width: parent.width

            Button {
                //anchors.right: parent.right
                //visible: true

                text: i18n.tr("Cancel")
                onClicked: {
                    PopupUtils.close(download_dialog.current);
                    console.log("Cancel");
                }
            }

            Button {
                text: i18n.tr("Download")
                color: UbuntuColors.orange
                onClicked: {
                    console.log(url.text);                    
                    py.call("backend.download_file", [url.text], download_end);
                }
            }


        }
    }
}
