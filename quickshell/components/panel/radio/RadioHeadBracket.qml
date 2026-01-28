//   fillColor: Styles.Colors.redx40

import QtQuick
import QtQuick.Shapes
import QtQuick.Shapes
import QtQuick.Shapes
import qs.styles as Styles

Shape {
    width: 10
    height: 30

    ShapePath {
        strokeWidth: 0
        fillColor: Styles.Colors.redx40
        // A ──────────── TOP LEFT MIRING
        startX: width * 0.9
        startY: height * 0

        // B ──────────── TOP RIGHT
        PathLine {
            x: width * 1
            y: height * 0
        }

        // C ──────────── RIGHT BOTTOM (SEDIKIT MIRING)
        PathLine {
            x: width * 0.98
            y: height * 1
        }

        // D ──────────── BOTTOM LEFT PANJANG
        PathLine {
            x: width * 0.19
            y: height * 1
        }

        // E ──────────── LEFT BOTTOM MIRING
        PathLine {
            x: width * 0
            y: height * 0.9
        }

        // F ──────────── LEFT ATAS
        PathLine {
            x: width * 0
            y: height * 0.05
        }

        // G ──────────── INNER NOTCH (LEHER)
        PathLine {
            x: width * 0.54
            y: height * 0.05
        }

        // KEMBALI KE A (TUTUP SHAPE)
        PathLine {
            x: width * 0.68
            y: height * 0
        }

    }

}
