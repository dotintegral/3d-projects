use <medal-dummy.scad>

baseThickness = 2;
baseRadius = 70;


module medal () {
    translate(v=[0,-5,baseThickness])
    medalDummy();
}

module flatBase () {
    rotate(a=[0,0,90]) 
    cylinder(h=baseThickness, r=baseRadius, $fn=6);
}

module ribbonCutout () {
    color(c="red")
    hull() {
        translate(v=[-11,0,0]) 
        cylinder(r=2, h=baseThickness+1, $fn=20);
        translate(v=[11,0,0]) 
        cylinder(r=2, h=baseThickness+1, $fn=20);
    }
}

module fullRibbonHoles() {
    translate(v=[0,52,0]) 
    ribbonCutout();
    translate(v=[0,24,0]) 
    ribbonCutout();
    translate(v=[0,-30,0]) 
    ribbonCutout();
}

module roundCutout (height, radius, delta) {
    difference() {
        cylinder(h=height, r1=radius, r2=radius+delta);
        cylinder(h=height, r1=radius, r2=radius-delta);
    }
}

module base() {
    difference() {
        flatBase();
        fullRibbonHoles();
        translate(v=[0,0,baseThickness-1]) 
        roundCutout(height=1, radius=baseRadius-20, delta=1);
    }
    
}

// medal();

base();