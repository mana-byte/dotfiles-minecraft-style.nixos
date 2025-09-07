pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
        id: root
        property bool isOpen: false

        property string summary
        property string body
        property string appName

        IpcHandler {
                target: "popup"

                function open(summary: string, body: string, appName: string) {
                        root.isOpen = true;
                        root.summary = summary;
                        root.body = body;
                        root.appName = appName;
                }

                function close() {
                        root.isOpen = false;
                }
        }

        LazyLoader {
                active: root.isOpen
                Popup {
                        controller: root
                }
        }

        function init() {
        }
}
