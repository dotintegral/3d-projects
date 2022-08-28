use <face-plate.scad>;

$fn=60;

faceAngle = 5.9;

baseWidth = 420;
baseLength = 300;

frontHeight = 30;
backHeight = 60;
wallThicnkness = 5;

module topDiffBlock () {
    color("red")
    translate([-50, 0, frontHeight - 1])
    rotate(faceAngle, [1, 0, 0])
    cube([baseWidth + 100, baseLength + 30, 60]);
}

module frontDiffBlock () {
    color("red")
    translate([-10, wallThicnkness * -4, 0])
    cube([baseWidth + 20, wallThicnkness * 4, frontHeight *2 ]);
}

module backDiffBlock () {
    color("red")
    translate([-10, baseLength, 0]) 
    cube([baseWidth + 20, wallThicnkness * 4, backHeight * 2]);
}



module bottomPlate () {
    cube([baseWidth, baseLength, wallThicnkness]);
}

module frontWall() {
    difference() {
        cube([baseWidth, wallThicnkness, frontHeight]);
        topDiffBlock();
    }
}

module backWall() {
    difference() {
        translate([0, baseLength-wallThicnkness, 0]) {
            cube([baseWidth, wallThicnkness, backHeight]);
        }
        topDiffBlock();
    }
}

module leftWall () {
    difference() {
        cube([wallThicnkness, baseLength, backHeight]);
        topDiffBlock();
    }
}


module rightWall () {
    translate([baseWidth - wallThicnkness, 0, 0]) 
    difference() {
        cube([wallThicnkness, baseLength, backHeight]);
        topDiffBlock();
    }
}

module topFace () {
    translate([baseWidth / 2, baseLength / 2, frontHeight + 12])
    rotate(faceAngle, [1, 0, 0])
    facePlate(length=320);
}

module topPanel () {
    difference() {
        topFace();
        frontDiffBlock();
        backDiffBlock();
    }
}


module hitbox() {
    topPanel();
    bottomPlate();

    frontWall();
    backWall();

    leftWall();
    rightWall();
}

hitbox();