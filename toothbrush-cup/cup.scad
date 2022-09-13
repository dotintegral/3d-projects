sides = 8;

height = 120;
bottomRadius = 35;
topRadius = 45;

wallThickness = 2;

bottomThickness = 15;

module cupShape () {
    difference() {
        cylinder(h=height, r1=bottomRadius, r2=topRadius, $fn=sides);
        translate(v=[0, 0, bottomThickness]) 
        cylinder(h=height-bottomThickness, r1=(bottomRadius - wallThickness / 2), r2= (topRadius - wallThickness/2), $fn=sides);
        translate(v=[0, 0, 0]) 
        cylinder(h=10, r=(bottomRadius - wallThickness / 2), $fn=sides);
    }
}

module bottomHole () {
    translate(v=[20, 0, 0])
    cylinder(h=20, r=4, $fn=sides);
}

module bottomHoles() {
    for (i=[0:7]) {
        rotate(a=[0, 0, i * 45]) 
        bottomHole();
    }
    translate(v=[-20, 0, 0]) 
    bottomHole();
}

module crossSection () {
    translate(v=[-100, 0, 0]) 
    cube(200);
}

module wallHoles () {
    module singleHole () {
        rotate([0, 45, 0])
        cube([8, 100, 8], center=true);
    }

    for(i=[0:7]) {
        rotate(a=[0,0,22.5 + i * 45])
        singleHole();
    }

}

module finalCup () {
    difference() {
        cupShape();
        bottomHoles();
        wallHoles();
        // crossSection();
    }

}


finalCup();
