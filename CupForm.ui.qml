/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import Coffee 1.0

Item {
    id: root

    width: 480
    height: 480
    property alias questionVisible: question.visible
    property bool showLabels: true
    property alias coffeeLabel: cappuccinoLabel.text

    property real sugarAmount: 2
    property real milkAmount: 4
    property real coffeeAmount: 4

    Rectangle {
        id: rectangle
        color: "#443224"
        anchors.fill: parent

        Image {
            id: background
            x: 0
            y: 84
            height: 320
            source: "images/cup structure/cup elements/coffee_cup_back.png"
        }

        Item {
            id: foam
            x: 0
            width: 457
            anchors.topMargin: milk.anchors.topMargin - 40
            anchors.bottom: background.bottom
            anchors.top: background.top
            clip: true
            Image {
                height: 320
                anchors.bottom: parent.bottom
                source: "images/cup structure/liquids/liquid_foam.png"
            }
        }

        Item {
            id: milk
            x: 0
            width: 457
            anchors.topMargin: 300 - coffee.height - root.milkAmount * 8 + 20
            anchors.bottom: background.bottom
            anchors.top: background.top
            clip: true
            Image {
                height: 320
                source: "images/cup structure/liquids/liquid_milk.png"
                anchors.bottom: parent.bottom
            }
        }

        Item {
            id: coffee
            x: 0
            width: 457
            height: root.coffeeAmount * 40
            anchors.bottomMargin: 0
            anchors.bottom: background.bottom
            clip: true

            Image {
                height: 320
                anchors.bottom: parent.bottom
                source: "images/cup structure/liquids/liquid_coffee.png"
            }
        }

        Image {
            id: cupFront
            x: 0
            y: 84
            height: 320
            source: "images/cup structure/cup elements/coffee_cup_front.png"
        }

        Text {
            x: 410
            y: 238
            color: "#ffffff"
            text: qsTr("Hot Milk")
            font.capitalization: Font.AllUppercase
            font.family: Constants.fontFamily
            wrapMode: Text.WrapAnywhere
            font.pixelSize: 18
            visible: root.showLabels
        }

        Text {
            x: 400
            y: 308
            color: "#ffffff"
            text: qsTr("Espresso Coffee")
            font.capitalization: Font.AllUppercase
            font.family: Constants.fontFamily
            wrapMode: Text.WrapAnywhere
            font.pixelSize: 18
            visible: root.showLabels
        }

        Image {
            x: 394
            y: 180
            width: 20
            visible: root.showLabels
            source: "images/ui controls/line.png"
        }

        Text {
            x: 420
            y: 168
            color: "#ffffff"
            text: qsTr("Milk Foam")
            font.family: Constants.fontFamily
            wrapMode: Text.WrapAnywhere
            font.pixelSize: 18
            font.capitalization: Font.AllUppercase
            visible: root.showLabels
        }

        Image {
            x: 384
            y: 250
            width: 20
            source: "images/ui controls/line.png"
            visible: root.showLabels
        }

        Image {
            x: 374
            y: 320
            width: 20
            source: "images/ui controls/line.png"
            visible: root.showLabels
        }

        Text {
            id: cappuccinoLabel
            color: "#ffffff"
            text: qsTr("CAPPUCCINO")
            visible: !question.visible
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: Constants.defaultMargin
            font.family: Constants.fontFamily
            wrapMode: Text.WrapAnywhere
            font.pixelSize: 48
            font.capitalization: Font.AllUppercase
        }

        Item {
            id: sugarItem
            x: 181
            y: 265
            width: 119
            height: 111
            rotation: -45

            Rectangle {
                x: 21
                y: 8
                width: 48
                height: 48
                color: "#ffffff"
                opacity: root.sugarAmount / 10
            }

            Rectangle {
                x: 74
                y: 40
                width: 32
                height: 32
                color: "#ffffff"
                visible: root.sugarAmount > 5
                opacity: root.sugarAmount / 30
            }

            Rectangle {
                x: 45
                y: 62
                width: 24
                height: 24
                color: "#ffffff"
                opacity: root.sugarAmount / 25
            }
        }
    }
    Image {
        id: question
        y: 84
        anchors.left: parent.left
        anchors.leftMargin: 0
        height: 320
        source: "images/cup structure/coffee_cup_large.png"
    }
}
