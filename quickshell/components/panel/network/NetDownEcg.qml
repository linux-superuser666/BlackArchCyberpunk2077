import QtQuick
import qs.styles

Item {
    // kekuatan spike

    id: dual

    // ===== PUBLIC API =====
    property int maxPoints: 120
    property real upRate: 0 // 0.0 – 1.0
    property real downRate: 0 // 0.0 – 1.0
    property color upColor: Colors.redx
    property color downColor: Colors.orangex
    property int strokeWidth: 1
    // ===== STYLE CONTROL =====
    property real noiseAmount: 3.5
    // kasar signal (px)
    property real snapChance: 0.25
    // packet spike probability
    property real snapStrength: 0.45
    // ===== INTERNAL =====
    property var upValues: []
    property var downValues: []
    readonly property real mid: height / 2
    readonly property real upMin: height * 0.12
    readonly property real downMax: height * 0.88

    width: 290
    height: 40
    // ===== INIT =====
    Component.onCompleted: {
        upValues = [];
        downValues = [];
        for (let i = 0; i < maxPoints; i++) {
            upValues.push(mid);
            downValues.push(mid);
        }
    }

    // ===== UPDATE LOOP =====
    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            upValues.shift();
            downValues.shift();
            // === Base target ===
            let upTarget = mid - (upRate * (mid - upMin));
            let downTarget = mid + (downRate * (downMax - mid));
            // === Packet snap (hard spike) ===
            if (Math.random() < snapChance)
                upTarget -= (mid - upMin) * snapStrength * Math.random();

            if (Math.random() < snapChance)
                downTarget += (downMax - mid) * snapStrength * Math.random();

            // === Noise / jitter ===
            let noiseUp = (Math.random() - 0.5) * noiseAmount;
            let noiseDown = (Math.random() - 0.5) * noiseAmount;
            upValues.push(Math.max(upMin, Math.min(mid, upTarget + noiseUp)));
            downValues.push(Math.min(downMax, Math.max(mid, downTarget + noiseDown)));
            canvas.requestPaint();
        }
    }

    // ===== RENDER =====
    Canvas {
        id: canvas

        anchors.fill: parent
        onPaint: {
            const ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);
            ctx.lineJoin = "miter";
            ctx.lineCap = "butt";
            ctx.miterLimit = 10;
            // ===== UPLOAD =====
            ctx.strokeStyle = upColor;
            ctx.lineWidth = strokeWidth;
            ctx.beginPath();
            for (let i = 0; i < upValues.length; i++) {
                const x = i * width / (maxPoints - 1);
                const y = upValues[i];
                if (i === 0)
                    ctx.moveTo(x, y);
                else
                    ctx.lineTo(x, y);
            }
            ctx.stroke();
            // ===== DOWNLOAD =====
            ctx.strokeStyle = downColor;
            ctx.lineWidth = strokeWidth;
            ctx.beginPath();
            for (let i = 0; i < downValues.length; i++) {
                const x = i * width / (maxPoints - 1);
                const y = downValues[i];
                if (i === 0)
                    ctx.moveTo(x, y);
                else
                    ctx.lineTo(x, y);
            }
            ctx.stroke();
        }
    }

}
