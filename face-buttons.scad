$fn=50;

// button variables
buttonRadius = 24;
buttonSpacing = 32;
buttonAngle = 15;
upButtonSpacing = 55;

buttonStep = buttonSpacing + buttonRadius;

height = 5;

module hitboxFacePlate () {
    cube([width, length, height]);
}


module buttonHole () {
    cylinder(height * 2, buttonRadius, buttonRadius);
}

module buttonDirectionalLayout () {
    rotate(180, [0, 1, 0]) {
        // button right
        buttonHole();
    
        translate([sin(60) * buttonStep, cos(60) * buttonStep, 0]) {
            // button down
            buttonHole();
    
            // button left
            translate([cos(buttonAngle) * buttonStep, sin(buttonAngle) * buttonStep, 0])
            buttonHole();
        }
        
        // button 
        translate([0, -1 * upButtonSpacing - buttonStep, 0])
        buttonHole();
    }
}

module buttonHeartLayout() {
    // button cross
    buttonHole();
    
    // button square
    translate([0, buttonStep, 0])
    buttonHole();

    // button l1
    translate([0, buttonStep, 0])
    rotate(buttonAngle, [0, 0, 1])
    translate([0, buttonStep, 0]) 
    buttonHole();

    translate([sin(60) * buttonStep, cos(60) * buttonStep, 0]) {
        // button circle
        buttonHole();
        
        // button triangle 
        translate([0, buttonStep, 0])
        buttonHole();
    
        // button l2
        translate([0, buttonStep, 0])
        rotate(buttonAngle, [0, 0, 1])
        translate([0, buttonStep, 0]) 
        buttonHole();

        // button r2
        translate([cos(buttonAngle) * buttonStep, sin(buttonAngle) * buttonStep, 0])
        buttonHole();

        // button r1
        translate([0, buttonStep, 0])
        translate([cos(buttonAngle) * buttonStep, sin(buttonAngle) * buttonStep, 0])
        buttonHole();
    }
}

module buttonFaceLayout () {
    translate([-60, buttonStep, 0])
    buttonDirectionalLayout();
    
    translate([60, 0, 0])
    buttonHeartLayout();

}

buttonFaceLayout();