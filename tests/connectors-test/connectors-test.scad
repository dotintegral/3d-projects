
translate(v=[40, 0, 10]) 
cube(size=[10, 10, 20], center=true);

translate(v=[40, 0, 20])
cylinder(h=5, r=3, $fn=100);


difference() {
    translate(v=[-10,0,5])
    cube(size=[20, 10, 10], center=true); 
    translate(v=[-17.5, 0, 5])
    rotate(a=[0, 90, 0])
    cylinder(h=5, r=3.2, $fn=100, center=true);
}