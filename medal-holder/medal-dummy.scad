medalRadius = 90/2;
medalThickness = 2;
medalHangWidth = 26;
medalHangHeight = 15;

module medalDummy() {
  color(c=[0.3,1,0.3]) {
    cylinder(h=2, r=medalRadius);
    translate(v=[-medalHangWidth/2, 0, 0]) 
    cube([medalHangWidth,medalHangHeight + medalRadius,medalThickness]);
  }
}

medalDummy();

