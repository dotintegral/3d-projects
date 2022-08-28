$fn=50;
use <face-buttons.scad>

// plate variables
plateWidth = 420;
plateHeight = 5;
plateLength = 300;

plateButtonsOffset = 30;

module baseCube () {
    cube([plateWidth, plateLength, plateHeight], true);
}

module facePlate () {
    difference() {
        baseCube();
        translate([0, plateButtonsOffset, 0])
        faceButtons(plateHeight * 2);
    }
}


facePlate();
