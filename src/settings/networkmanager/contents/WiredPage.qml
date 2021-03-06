/****************************************************************************
 * This file is part of Settings.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
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

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import Liri.NetworkManager 1.0 as NM
import Fluid.Controls 1.0 as FluidControls
import Liri.Settings 1.0

FluidControls.TabbedPage {
    id: wiredPage

    property var model

    title: model.Name

    data: [
        NM.WiredSettings {
            id: wiredSettings
            path: model.ConnectionPath
        }
    ]

    FluidControls.Tab {
        title: qsTr("Wired")

        WiredIdentityPage {}
    }

    FluidControls.Tab {
        title: qsTr("802.1x Security")

        SecurityPage {
            eapMethods: ListModel {
                ListElement {
                    type: "MD5"
                    //: Security method
                    label: QT_TR_NOOP("MD5")
                }
                ListElement {
                    type: "TLS"
                    //: Security method
                    label: QT_TR_NOOP("TLS")
                }
                ListElement {
                    type: "FAST"
                    //: Security method
                    label: QT_TR_NOOP("FAST")
                }
                ListElement {
                    type: "TTLS"
                    //: Security method
                    label: QT_TR_NOOP("Tunneled TLS")
                }
                ListElement {
                    type: "PEAP"
                    //: Security method
                    label: QT_TR_NOOP("Protected EAP (PEAP)")
                }
            }
        }
    }

    FluidControls.Tab {
        title: qsTr("IPv4")

        IPAddressPage {}
    }

    FluidControls.Tab {
        title: qsTr("IPv6")

        IPAddressPage {}
    }
}
