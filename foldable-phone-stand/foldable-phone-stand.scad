use <../utils/m3.scad>;

faces=50;
sideThickness = 3.5;
maxHeight = 28;


m3Tight(height=25, headHeight=4);

module sidePanel () {
    panelLength = 60;


    difference() {
        translate([0,-panelLength,0])
        cube([sideThickness,panelLength,maxHeight]);
        rotate([20,0,0])
        translate(v = [-1,-80,27.5]) 
        cube([5,100,30]);
    }
}


module rightSide () {
    color("#8585f5") {
        cylinder(h=28, r=sideThickness, $fn=faces);
        sidePanel();
    }
}

rightSide();