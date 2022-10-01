headRadius = 5.2 / 2;
screewRadius = 2.8 / 2;
faces = 50;



module m3Tight (height = 10, headHeight = 3) {
    color("#5f7f5f") {
        cylinder(h = height, r = screewRadius - 0.1, $fn=faces);
        
        translate(v = [0,0,height]) 
        cylinder(h = headHeight, r = headRadius, $fn=faces);
    }
}


module m3Loose (height = 10, headHeight = 3) {
    color("#8c5353") {
        cylinder(h = height, r = screewRadius, $fn=faces);
        
        translate(v = [0,0,height]) 
        cylinder(h = headHeight, r = headRadius + 0.1, $fn=faces);
    }
}

m3Tight();

translate(v = [8,0,0]) 
m3Loose();