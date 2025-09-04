import Quickshell
import QtQuick

import "bar" as Bar
import "notifications" as Notifs
import "launcher" as Launcher

ShellRoot {
        Bg {}

        Bar.Bar { }

        Notifs.Overlay { }

        Component.onCompleted: () => {
                Notifs.PopupController.init();
                Launcher.Controller.init();
        }
}
