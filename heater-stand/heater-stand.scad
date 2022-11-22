$fn=30;

flatTopWidth = 24.5;
flatTopHeight = 90;
flatTopThickness = 4;

footHeight = 150;
footWidth = 40;
footThickness = 20;

module flatTop () {
    roundRadius = 1;

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
        hole1Radius = 1.5;

        translate(v = [flatTopWidth/2,-23.5-hole1Radius,-.2]) 
        color(c="#ff3333")
        cylinder(h = flatTopThickness+0.4, r = 1.5);
    }

    module hole2 () {
        hole2Radius = 1.5;
        color(c="#ff3333")

        translate(v = [flatTopWidth/2,-23.5-hole2Radius-38,-.2]) 
        hull() {
            cylinder(h = flatTopThickness+0.4, r = 1.5);
            translate(v = [0,-3,0]) 
            cylinder(h = flatTopThickness+0.4, r = 1.5);
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
    translate(v = [0,0,flatTopThickness]) 
    difference() {
        hull () {
            translate(v = [0,footHeight/2 - footWidth/2,-footWidth/2]) 
            sphere(r = footWidth/2);
            translate(v = [0,-footHeight/2 + footWidth/2,-footWidth/2]) 
            sphere(r = footWidth/2);
        }
        translate(v = [-footWidth/2,-footHeight/2,-2*footThickness]) 
        cube([footWidth, footHeight, footThickness]);
    }
}


module stand () {
    flatTop();
    // translate(v = [0,0,4]) 
    foot();
}


stand();