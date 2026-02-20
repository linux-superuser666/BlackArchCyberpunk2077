import QtQuick
import qs.services
import qs.state

QtObject {
    required property string mode // full / area / clip
    required property int delay // 0 / 5 / 10
    required property string text

    function exec() {
        GlobalState.closeScreenShot();
        Qt.callLater(() => {
            ScreenShotService.capture(mode, delay);
        });
    }

}
