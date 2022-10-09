$fn=60;

standHeight = 30;
standWallThicknes = 2;
standSupportHeight = 5;

squareStandWidth = 59;
cylinderStandRadius = 29 / 2;
cylinderStandBottomExpanded = 5;


module squareSofaStand () {
    module standBase () {
        cube([
            squareStandWidth + standWallThicknes*2,
            squareStandWidth + standWallThicknes*2,
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
            squareStandWidth,
            squareStandWidth,
            standSupportHeight + 2
        ]);
    }

    difference() {
        standBase();
        standBaseCutout();
    }
}

module cylinderSofaStand() {
    module standBase () {
        cylinder(
            h = standHeight + standSupportHeight,
            r1= cylinderStandRadius + standWallThicknes + cylinderStandBottomExpanded, 
            r2 = cylinderStandRadius + standWallThicknes
        );
    }

    module standBaseCutout () {
        translate(v = [0,0,standHeight]) 
        cylinder(
            h = standSupportHeight,
            r = cylinderStandRadius
        );
    }

    difference() {
        standBase();
        standBaseCutout();
    }
}



// squareSofaStand();
cylinderSofaStand();

