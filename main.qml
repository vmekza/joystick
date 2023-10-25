import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3
import QtQuick.Layouts
import QtQml 2.15
import QtQuick.Shapes 1.0

Window {
    width: 1640
    height: 1480
    visible: true
    title: qsTr("Joystick")

//    Image {
//        source: "/Users/scarlet/Documents/Tamk/GUI/sky.jpg"
//        fillMode: Image.PreserveAspectCrop
//        anchors.fill: parent
//    }

    Button {
        id: left
        text: qsTr("<<<")
        width: 75
        height: 40

        x: 300
        y: 370
    }

    Button {
        id: rot
        text: qsTr("rot")
        width: 75
        height: 40

        x: 365
        y: 370
    }

    Button {
        id: right
        text: qsTr(">>>")
        width: 75
        height: 40

        x: 430
        y: 370
    }

    Button {
        id: up
        text: qsTr("")

        width: 40
        height: 75

        x: 380
        y: 300
    }

    Button {
        id: down
        text: qsTr("")
        width: 40
        height: 75

        x: 380
        y: 405
    }


    Rectangle {

        width: 100
        height: 100
        x: 520
        y: 300
        color: "white"
        radius: 180
        border.width: 1.5
        border.color: "blue"

        Rectangle {
            id: js
            anchors.centerIn: parent
            width: 30
            height: 30
            x: 520
            y: 300
            color: "red"
            radius: 180

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true;
                onPositionChanged:
                {

                    //Left
                    if(mouseX > 0 && mouseX < 15) {
//                        moveDown.stop();
//                        moveUp.stop();
                        moveRight.stop();
                        moveLeft.start();
                    }
                    //Rigth
                    if(mouseX > 15 && mouseX < 30) {
                        moveLeft.stop();
                        moveRight.start();
                    }
                    //Up
                    if(mouseY > 0 && mouseY < 15) {
//                        moveLeft.stop();
//                        moveRight.stop();
                        moveDown.stop();
                        moveUp.start();
                    }

                    //Down
                    if(mouseY > 15 && mouseY < 30) {
//                        moveLeft.stop();
//                        moveRight.stop();
                        moveUp.stop();
                        moveDown.start();
                    }


                    console.log("x: " + mouse.x + "y: " + mouse.y);
                }
            }
        }

    }

    Rectangle {


        width: 400
        height: 200
        x: 300
        y: 80
        color: "blue"

        Rectangle {
            id:red

//            anchors.bottom: parent
            width: 40
            height: 20
            x: 300
            y: 80
            color: "red"




        }


    }

    Item {
        Timer{
            id: moveLeft
             interval: 200; running: false; repeat: true
              onTriggered:{
                  red.x = red.x - 20;



              }

        }
    }

    Item {
        Timer{
            id: moveRight
             interval: 200; running: false; repeat: true
              onTriggered:{

                  red.x = red.x + 20;



              }

        }
    }

    Item {
        Timer{
            id: moveUp
             interval: 200; running: false; repeat: true
              onTriggered:{

                  red.y = red.y - 20;

                }

        }
    }

    Item {
        Timer{
            id: moveDown
             interval: 200; running: false; repeat: true
              onTriggered:{

                  red.y = red.y + 20;

                }

        }
    }


    Item {
        width: 400
        height: 400


    }




}
