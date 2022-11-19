use <../utils/m3.scad>;

faces=50;
sideThickness = 5;
maxHeight = 19;
roundRadius = 2;
spaceBetween = 0.2;


module sidePanel () {
    panelLength = 70;
    
    module frontCutout () {
        translate(v = [0,-10,12]) 
        cube([10,30,10]);
    }

    module roundedPanel () {
        translate([0,-panelLength-0.5,0]) {
            minkowski() {
                difference() {
                    cube([
                        sideThickness - roundRadius,
                        panelLength,
                        maxHeight - roundRadius
                    ]);
                    frontCutout();
                }
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
            -sideThickness + spaceBetween,
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


module fakePhone () {
    translate(v = [-40,-60,10]) 
    rotate(a = [-20,0,0]) 
    cube([80,13,155]);
}


module sidePanelWithPhoneHole() {
    rotate(a = [0,0,-20]) 
    difference() {
        rotate(a=[0,0,20])
        sidePanel();
        fakePhone();
    }
}


module rightSide () {
    color("#8585f5") {
        difference() {  
            union() {
                cylinder(h=(maxHeight / 2), r=sideThickness, $fn=faces);
                translate(v = [spaceBetween,-8,0]) {
                    cube(size = [sideThickness-spaceBetween,8,(maxHeight / 2)]);
                } 
            }
            m3Tight(height=16, headHeight=4);
        }
        sidePanelWithPhoneHole();
    }
}

module leftSide () {
    color("#e91e63") {
        difference() {
            union() {
                translate(v = [0,0,maxHeight / 2]) {
                    cylinder(h=(maxHeight / 2), r=sideThickness, $fn=faces);
                } 
                translate(v = [-sideThickness,-8,maxHeight / 2]) {
                    cube(size = [sideThickness-spaceBetween,8,(maxHeight / 2)-roundRadius]);
                } 
            }
            m3Loose(height=16, headHeight=4);
        }
        mirror(v=[1,0,0]) {
            sidePanelWithPhoneHole();
        }
    }
}

rightSide();
// leftSide();
