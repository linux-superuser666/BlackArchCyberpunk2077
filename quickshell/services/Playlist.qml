// qs/services/Playlist.qml
import QtQuick
import Quickshell.Io

Item {
    id: playlist

    property alias model: playlistModel
    property int currentPos: -1
    property string songArtist: ""
    property string songTitle: ""
    property string lastSong: ""
    property string coverPath: ""

    function refreshPlaylist() {
        playlistProc.running = true;
    }

    function refreshCurrent() {
        currentSongProc.running = true;
    }

    function play(pos) {
        playSongProc.pos = pos;
        playSongProc.running = true;
    }

    function stop() {
        stopProc.running = true;
    }

    Component.onCompleted: {
        refreshPlaylist();
        refreshCurrent();
    }
    Component.onDestruction: {
        coverProc.running = false;
    }

    Process {
        id: notifyProc

        property string title: ""
        property string body: ""
        property string icon: ""

        command: ["sh", "-c", "notify-send -a MPD -u low -i \"" + icon + "\" \"" + title + "\" \"" + body + "\""]
    }

    Process {
        id: coverProc

        command: ["sh", "-c", "./scripts/mpdcoverart.sh"]

        stdout: SplitParser {
            onRead: (line) => {
                const path = line.trim();
                if (!path)
                    return ;

                playlist.coverPath = path;
            }
        }

    }

    ListModel {
        id: playlistModel
    }

    Process {
        id: playlistProc

        command: ["sh", "-c", "export MPD_HOST=127.0.0.1; export MPD_PORT=6600; mpc playlist"]
        onStarted: playlistModel.clear()

        stdout: SplitParser {
            onRead: (line) => {
                const t = line.trim();
                if (!t)
                    return ;

                playlistModel.append({
                    "position": playlistModel.count + 1,
                    "title": t
                });
            }
        }

    }

    Process {
        id: currentSongProc

        command: ["sh", "-c", "export MPD_HOST=127.0.0.1; export MPD_PORT=6600; " + "mpc --format \"[%artist% - ]%title%\" current"]

        stdout: SplitParser {
            onRead: (line) => {
                const t = line.trim();
                if (!t || t === lastSong)
                    return ;

                lastSong = t;
                if (t.includes(" - ")) {
                    const p = t.split(" - ");
                    songArtist = p[0];
                    songTitle = p.slice(1).join(" - ");
                } else {
                    songArtist = "";
                    songTitle = t;
                }
                coverProc.running = true;
                notifyProc.title = "Now Playing";
                notifyProc.body = songArtist ? songTitle + "\n" + songArtist : songTitle;
                notifyProc.icon = "/tmp/.music_cover.jpg";
                notifyProc.running = true;
            }
        }

    }

    Process {
        id: playSongProc

        property int pos: -1

        command: ["sh", "-c", "export MPD_HOST=127.0.0.1; export MPD_PORT=6600; mpc play " + pos]
    }

    Process {
        id: stopProc

        command: ["sh", "-c", "export MPD_HOST=127.0.0.1; export MPD_PORT=6600; mpc stop"]
    }

    Timer {
        interval: 2000
        repeat: true
        running: true
        onTriggered: refreshCurrent()
    }

    Timer {
        interval: 3.6e+06
        repeat: true
        running: true
        onTriggered: refreshPlaylist()
    }

}
