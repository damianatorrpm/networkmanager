/****************************************************************************
 * This file is part of Settings.
 *
 * Copyright (C) 2017 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:GPL3+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import Fluid.Controls 1.0 as FluidControls
import Liri.Settings 1.0

Item {
    property alias eapMethods: securityType.model

    anchors.fill: parent

    ModulePane {
        anchors.horizontalCenter: parent.horizontalCenter

        width: 400

        Column {
            anchors.fill: parent

            FluidControls.Subheader {
                text: qsTr("Security")
            }

            FluidControls.ListItem {
                text: qsTr("Enabled")
                rightItem: Switch {
                    id: enabledSwitch
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            FluidControls.ListItem {
                text: qsTr("Authentication")
                enabled: enabledSwitch.checked
                rightItem: ComboBox {
                    id: securityType
                    anchors.verticalCenter: parent.verticalCenter
                    textRole: "label"
                    width: FluidControls.Units.gu(10)
                }
            }

            StackLayout {
                currentIndex: securityType.currentIndex

                SecurityMD5 {}
                SecurityTLS {}
            }
        }
    }
}
