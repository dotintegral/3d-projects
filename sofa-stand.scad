standHeight = 15;
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
        standSupportHeight
    ]);
}

difference() {
    standBase();
    standBaseCutout();
}