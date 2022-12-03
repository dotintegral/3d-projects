use <face-buttons.scad>;
use <face-plate.scad>;

$fn=60;

buttonRadius = 24 / 2;
buttonSpacing = 32 / 2;
faceAngle = 5.9;

baseWidth = 420;
baseLength = 300;

frontHeight = 30;
backHeight = 60;
wallThicnkness = 5;

cutoutColor = "#dd4444";


module topDiffBlock () {
    color(cutoutColor)
    translate([-50, 0, frontHeight - 1])
    rotate(faceAngle, [1, 0, 0])
    cube([baseWidth + 100, baseLength + 30, 60]);
}


module topPanel () {
    module frontDiffBlock () {
        color(cutoutColor)
        translate([-10, wallThicnkness * -4, 0])
        cube([baseWidth + 20, wallThicnkness * 4, frontHeight *2 ]);
    }
    
    module backDiffBlock () {
        color(cutoutColor)
        translate([-10, baseLength, 0]) 
        cube([baseWidth + 20, wallThicnkness * 4, backHeight * 2]);
    }
    
    module topFace () {
        translate([baseWidth / 2, baseLength / 2, frontHeight + 12])
        rotate(faceAngle, [1, 0, 0])
        facePlate(length=320);
    }

    difference() {
        topFace();
        frontDiffBlock();
        backDiffBlock();
    }
}

module bottomPanel () {
    cube([baseWidth, baseLength, wallThicnkness]);
}


module frontWall() {
    difference() {
        cube([baseWidth, wallThicnkness, frontHeight]);
        topDiffBlock();
    }
}

module backWall() {
    module backButton () {
        color(cutoutColor)
        translate([0, baseLength + wallThicnkness / 2, backHeight - buttonRadius - 15])
        rotate(90, [1,0,0])
        buttonHole(wallThicnkness * 2);
    }
    
    module twoBackButtons () {
        translate([buttonRadius / 2 + buttonSpacing / 2, 0, 0,])
        backButton();
        
        translate([-buttonRadius / 2 - buttonSpacing / 2, 0, 0,])
        backButton();
    }
    
    module backWallHoles () {
        buttonGroupsSpacing = 80;
    
        // middle back buttons
        translate([baseWidth / 2, 0, 0])
        twoBackButtons();
        
        // right back buttons
        translate([baseWidth / 2 + buttonGroupsSpacing, 0, 0])
        twoBackButtons();
        
        // left back buttons
        translate([baseWidth / 2 - buttonGroupsSpacing, 0, 0])
        twoBackButtons();

        // leftmost back hole (cable)
        translate([40,0,0]) 
        backButton();
    }

    difference() {
        translate([0, baseLength-wallThicnkness, 0]) {
            cube([baseWidth, wallThicnkness, backHeight]);
        }
        topDiffBlock();
        backWallHoles();
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


module hitboxBase() {
    topPanel();
    bottomPanel();

    frontWall();
    backWall();

    leftWall();
    rightWall();
}

hitboxBase();