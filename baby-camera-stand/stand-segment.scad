height = 10;
radius = 18/2;
joinHeight = 5;


module baseCylinder () {
  cylinder(h=height, r=radius);
}

module segmentJoin (change, h) {
    joinRadius = (radius - change);
    cylinder(h=h, r=joinRadius);

    translate(v=[0, 0, h]) 
    cylinder(h=joinRadius, r1=joinRadius, r2=0);
}


module segment () {
    difference() {
        baseCylinder();
        segmentJoin(3.8, joinHeight + 0.2); // 0.2 smaller, bigger
    }
    
    translate(v=[0,0,height]) 
    segmentJoin(4.2, joinHeight - 0.2); // 0.2 bigger, smaller
}

segment();


// difference() {
//     segment();
//     cube(50);
// }