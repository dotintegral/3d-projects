$fn=100;

flatTopWidth = 24.5;
flatTopHeight = 90;
flatTopThickness = 5;

footHeight = 120;
footWidth = 40;
footThickness = 20;

hole1Radius = 2.5;
hole2Radius = 2.5;
footHoleRadius = 7;
roundRadius = 2;

module flatTop () {

    module edge () {
        hull()  {
            cylinder(h=flatTopThickness, r=roundRadius);
            translate(v = [flatTopWidth - 2 * roundRadius,0,0]) 
            cylinder(h=flatTopThickness, r=roundRadius);
        }
    }

    module surface () {
        color(c="#ffff66")
        translate(v = [roundRadius, -roundRadius, 0])  {
            hull () {
                edge();
                translate(v = [0, -flatTopHeight + 2 * roundRadius, 0]) 
                edge();
            }
        }
    }

    module hole1 () {
        translate(v = [flatTopWidth/2,-23.5-hole1Radius,-.2]) 
        color(c="#ff3333")
        cylinder(h = flatTopThickness+0.4, r = hole1Radius);
    }

    module hole2 () {
        color(c="#ff3333")

        translate(v = [flatTopWidth/2,-23-hole2Radius-38,-.2]) 
        hull() {
            cylinder(h = flatTopThickness+0.4, r = hole2Radius);
            translate(v = [0,-3,0]) 
            cylinder(h = flatTopThickness+0.4, r = hole2Radius);
        }
        
    }


    translate(v = [-flatTopWidth/2,flatTopHeight/2,0]) 
    difference() {
        surface();
        hole1();
        hole2();
    }
}

module foot () {
    module footHole1 () {
        color("#ee3333")
        translate(v = [-flatTopWidth/2,flatTopHeight/2,0]) 
        translate(v = [flatTopWidth/2,-23.5-hole1Radius,-25]) 
        cylinder(h = 30, r = footHoleRadius);
    }

    module footHole2() {
        color("#ee3333")
        translate(v = [-flatTopWidth/2,flatTopHeight/2,0]) 
        hull () {
            translate(v = [flatTopWidth/2,-23-hole2Radius-36,-25]) 
            cylinder(h = 30, r = footHoleRadius);
            translate(v = [flatTopWidth/2,-23-hole2Radius-36-7,-25]) 
            cylinder(h = 30, r = footHoleRadius);
        }
    }

    translate(v = [0,0,flatTopThickness]) {
        difference() {
            hull () {
                translate(v = [0,footHeight/2 - footWidth/2,-footWidth/2]) 
                sphere(r = footWidth/2);
                translate(v = [0,-footHeight/2 + footWidth/2,-footWidth/2]) 
                sphere(r = footWidth/2);
            }
            translate(v = [-footWidth/2,-footHeight/2,-2*footThickness]) 
            cube([footWidth, footHeight, footThickness]);
            footHole1();
            footHole2();
        }

    }
}


module stand () {
    flatTop();
    foot();
}


stand();