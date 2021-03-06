import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3


Page {
    id: basepage

    Map {
        id: map
    }
    
    About {
        id: about
    }

    Checked {
        id: checked
    }

    head.actions: [
        Action {
            iconName: "import"
            text: i18n.tr("Import")
            onTriggered: {
                // TODO refactor dialog; concentrate code somewhere
                download_dialog.current = PopupUtils.open(download_dialog);
            }
        },
        Action {
            iconName: "starred"
            text: i18n.tr("Checked")
            onTriggered: {
                checked.model.clear()
                py.call("backend.select_all", [], function (events) {
                    for (var i=0; i < events.length; i++) {
                        checked.model.append(events[i]);
                    }
                });
    
                pageStack.push(checked);
            }
        },
        Action {
            iconName: "stock_image"
            text: i18n.tr("Map")
            onTriggered: {
                pageStack.push(map);
            }
        },
        Action {
            iconName: "info"
            text: i18n.tr("About")
            onTriggered: {
                pageStack.push(about);
            }
        }
    ]
}
