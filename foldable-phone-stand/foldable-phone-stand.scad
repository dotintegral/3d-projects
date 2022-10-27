use <../utils/m3.scad>;

faces=50;
sideThickness = 3.5;
maxHeight = 28;
roundRadius = 2;


// m3Tight(height=25, headHeight=4);

module sidePanel () {
    panelLength = 60;

    module roundedPanel () {
        translate([0,-panelLength,0]) {
            minkowski() {
                cube([
                    sideThickness - roundRadius,
                    panelLength,
                    maxHeight - roundRadius
                ]);
                sphere(r = roundRadius, $fn=40);
            }
        }
    }

    module bottomCutout () {
        translate(v = [
            -sideThickness,-panelLength-5,-roundRadius
        ]) 
        cube([
            sideThickness * 2,
            panelLength + 10,
            roundRadius
        ]);
    }

    module sideCutout () {
        translate(v = [
            -sideThickness,
            -panelLength * 1.5,
            -roundRadius
        ]) 
        cube([
            sideThickness,
            panelLength * 2,
            maxHeight + roundRadius
        ]);
    }


    translate(v = [0,-sideThickness-roundRadius,0]){
        difference() {
            roundedPanel();
            bottomCutout();
            sideCutout();
        }
    } 
}


module rightSide () {
    color("#8585f5") {
        cylinder(h=(maxHeight / 2), r=sideThickness, $fn=faces);
        translate(v = [0,-7,0]) {
            cube(size = [sideThickness,7,(maxHeight / 2)]);
        } 
        sidePanel();
    }
}

module leftSide () {
    color("#e91e63") {
        translate(v = [0,0,maxHeight / 2]) {
            cylinder(h=(maxHeight / 2), r=sideThickness, $fn=faces);
        } 
        translate(v = [-sideThickness,-7,maxHeight / 2]) {
            cube(size = [sideThickness,7,(maxHeight / 2)-roundRadius]);
        } 
        mirror(v=[1,0,0]) {
            sidePanel();
        }
    }
}

rightSide();
leftSide();