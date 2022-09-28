medalRadius = 90/2;
medalThickness = 2;
medalHangWidth = 26;
medalHangHeight = 15;

module medal() {
  cylinder(h=2, r=medalRadius);
  translate(v=[-medalHangWidth/2, 0, 0]) 
  cube([medalHangWidth,medalHangHeight + medalRadius,medalThickness]);
}

medal();

