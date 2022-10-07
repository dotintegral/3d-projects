
module roundedCube(size = [1,1,1], radius = 1, center=false) {

    module basicCube () {
        translateVector = center == true ? [0,0,0] : [radius,radius,radius];
        translate(translateVector) 
        cube([
            size[0] - 2 * radius,
            size[1] - 2 * radius,
            size[2] - 2 * radius,
        ], center=center);
    }

    minkowski() {
        basicCube();
        sphere(r = 1, $fn=50);
    }
}

// test with not centered cube
// translate(v = [-11,0,0]) 
// cube(size = [10,20,10]);
// roundedCube(size = [10,20,10]);


// test with centered cube
// translate(v = [-11,0,0]) 
// cube(size = [10,20,10], center=true);
// roundedCube(size = [10,20,10], center=true);