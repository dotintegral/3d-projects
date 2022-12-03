
// button variables
buttonRadius = 24 / 2;
buttonSpacing = 32 / 2;
buttonAngle = 15;
upButtonSpacing = 55;
buttonsClustersSpacing = 50;

buttonStep = buttonSpacing + buttonRadius;

module buttonHole (height) {
    color("#dd4444")
    cylinder(height, buttonRadius, buttonRadius);
}

module buttonDirectionalLayout (height) {
    rotate(180, [0, 1, 0]) 
    translate([0, 0, -height]) {
        // button right
        buttonHole(height);
    
        translate([sin(60) * buttonStep, cos(60) * buttonStep, 0]) {
            // button down
            buttonHole(height);
    
            // button left
            translate([cos(buttonAngle) * buttonStep, sin(buttonAngle) * buttonStep, 0])
            buttonHole(height);
        }
        
        // button 
        translate([0, -upButtonSpacing, 0])
        buttonHole(height);
    }
}

module buttonHeartLayout(height) {
    // button cross
    buttonHole(height);
    
    // button square
    translate([0, buttonStep, 0])
    buttonHole(height);

    // button l1
    translate([0, buttonStep, 0])
    rotate(buttonAngle, [0, 0, 1])
    translate([0, buttonStep, 0]) 
    buttonHole(height);

    translate([sin(60) * buttonStep, cos(60) * buttonStep, 0]) {
        // button circle
        buttonHole(height);
        
        // button triangle 
        translate([0, buttonStep, 0])
        buttonHole(height);
    
        // button l2
        translate([0, buttonStep, 0])
        rotate(buttonAngle, [0, 0, 1])
        translate([0, buttonStep, 0]) 
        buttonHole(height);

        // button r2
        translate([cos(buttonAngle) * buttonStep, sin(buttonAngle) * buttonStep, 0])
        buttonHole(height);

        // button r1
        translate([0, buttonStep, 0])
        translate([cos(buttonAngle) * buttonStep, sin(buttonAngle) * buttonStep, 0])
        buttonHole(height);
    }
}

module faceButtons (height) {
    translate([-buttonsClustersSpacing / 2, buttonStep, -height / 2])
    buttonDirectionalLayout(height);
    
    translate([buttonsClustersSpacing / 2, 0, -height / 2])
    buttonHeartLayout(height);

}

faceButtons(10);