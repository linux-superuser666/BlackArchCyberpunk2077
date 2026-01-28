import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    // ===== REUSABLE PROPERTIES =====
    property int bracketWidth: 10
    property int bracketHeight: 100
    property color bracketbgColor: "#1e1e2e"
    property color bracketborderColor: "#ff5555"
    property real bracketborderWidth: 1

    width: bracketWidth
    height: bracketHeight

    // ===== FILL =====
    ShapePath {
        strokeWidth: 0
        fillColor: root.bracketbgColor
        startX: width * 0.91
        startY: height * 0.44

        PathLine {
            x: width * 0.8
            y: height * 0.46
        }

        PathLine {
            x: width * 0.78
            y: height * 0.09
        }

        PathLine {
            x: width * 0.86
            y: height * 0.08
        }

        PathLine {
            x: width * 0.91
            y: 0
        }

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width
            y: height * 0.93
        }

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: width * 0.85
            y: height
        }

        PathLine {
            x: width * 0.78
            y: height * 0.93
        }

        PathLine {
            x: width * 0.79
            y: height * 0.55
        }

        PathLine {
            x: width * 0.92
            y: height * 0.53
        }

        PathLine {
            x: width * 0.91
            y: height * 0.44
        }

    }

    // ===== BORDER =====
    ShapePath {
        strokeWidth: root.bracketborderWidth
        strokeColor: root.bracketborderColor
        fillColor: "transparent"
        joinStyle: ShapePath.RoundJoin
        capStyle: ShapePath.RoundCap
        startX: width * 0.91
        startY: height * 0.44

        PathLine {
            x: width * 0.8
            y: height * 0.46
        }

        PathLine {
            x: width * 0.78
            y: height * 0.09
        }

        PathLine {
            x: width * 0.86
            y: height * 0.08
        }

        PathLine {
            x: width * 0.91
            y: 0
        }

        PathLine {
            x: width
            y: 0
        }

        PathLine {
            x: width
            y: height * 0.93
        }

        PathLine {
            x: width
            y: height
        }

        PathLine {
            x: width * 0.85
            y: height
        }

        PathLine {
            x: width * 0.78
            y: height * 0.93
        }

        PathLine {
            x: width * 0.79
            y: height * 0.55
        }

        PathLine {
            x: width * 0.92
            y: height * 0.53
        }

        PathLine {
            x: width * 0.91
            y: height * 0.44
        }

    }

}
