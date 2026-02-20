import QtQuick
import qs.services
import qs.state

QtObject {
    required property string mode // full / area
    required property int delay
    required property string text

    function exec() {
        GlobalState.closeScreenRecorder();
        Qt.callLater(() => {
            ScreenRecorderService.toggle(mode, delay);
        });
    }

}
