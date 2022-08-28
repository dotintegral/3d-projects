use <face-buttons.scad>

// plate variables
plateWidth = 420;
plateHeight = 5;
plateLength = 300;

plateButtonsOffset = 30;

module baseCube (width,height, length) {
    cube([width, length, height], true);
}

module facePlate (width=plateWidth, height=plateHeight, length=plateLength) {
    difference() {
        baseCube(width, height, length);
        translate([0, plateButtonsOffset, 0])
        faceButtons(plateHeight * 2);
    }
}


facePlate();