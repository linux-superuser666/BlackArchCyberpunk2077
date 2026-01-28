import QtQuick
import QtQuick3D
import QtQuick3D.AssetUtils
import QtQuick3D.Helpers
import QtQuick3D.Particles3D
import QtQuick3D.Xr

View3D {
    anchors.fill: parent

    PerspectiveCamera {
        id: cam

        position: Qt.vector3d(0, 0, 380)
        lookAt: Qt.vector3d(0, 0, 0)
    }

    DirectionalLight {
        worldDirection: Qt.vector3d(-1, -1, -1)
        brightness: 1.1
    }

    Model {
        id: earth

        source: "#Sphere"
        scale: Qt.vector3d(120, 120, 120)

        materials: PrincipledMaterial {
            roughness: 1
            metalness: 0

            baseColorMap: Texture {
                source: "textures/earth_day.jpg"
            }

        }

    }

    environment: SceneEnvironment {
        clearColor: "black"
        backgroundMode: SceneEnvironment.Color
    }

}
