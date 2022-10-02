standHeight = 30;
standWidth = 65;
standWallThicknes = 5;
standSupportHeight = 5;

module standBase () {
    cube([
        standWidth + standWallThicknes*2,
        standWidth + standWallThicknes*2,
        standHeight + standSupportHeight
    ]);
}

module standBaseCutout () {
    translate([
        standWallThicknes, 
        standWallThicknes, 
        standHeight
    ])
    cube([
        standWidth,
        standWidth,
        standSupportHeight + 2
    ]);
}



module hexCutouts () {
    for(j=[0:4]) {
        for(i=[0:4]) {
            translate(v=[13+12*i,13 + 12*j,-1]) 
            cylinder(h=standHeight+2, r=5, $fn=6);
        }
    }
}


difference() {
    standBase();
    standBaseCutout();
    // hexCutouts();
}