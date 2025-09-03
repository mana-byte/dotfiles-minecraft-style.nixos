import Quickshell
import QtQuick

import "bar" as Bar
import "notifications" as Notifs

ShellRoot {
        Bg {}

        Bar.Bar { }

        Notifs.Overlay { }

        Component.onCompleted: () => {
                Notifs.PopupController.init();
        }
}
