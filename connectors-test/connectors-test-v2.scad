holeSizeDiff = 1;

module connector(length,size,isHole=false) {
    change = isHole? holeSizeDiff : 0;
    radius = (size/2 + change);

    translate(v=[0,0,size/2])
    rotate(a=[90, 22.5, 90])
    cylinder(h=length, r=radius, $fn=8);
    echo("radius"); echo(radius);
}

// connector(50, 10, 0);

module connectorBase () {
    cube([50, 50, 5]);


    module connectorCutout () {
        translate(v=[0,-5,0]) 
        rotate([0,45,0])
        cube([25, 60, 25]);
    }

    difference() {
        cube([35, 50, 15]);
        translate([20,0,20]) 
        connectorCutout();
    }
}

module connectorHoles () {
    translate(v=[0, 15, 6]) 
    connector(length=35, size=7, isHole=true);
    
    translate(v=[0, 35, 6]) 
    connector(length=35, size=7, isHole=true);
}

// difference() {
//     connectorBase();
//     connectorHoles();
// }

connector(length=70, size=8.8, isHole=false);
