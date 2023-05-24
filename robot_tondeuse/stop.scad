$fs=$fs/4;
$fa=$fa/4;

e=4;
h=30;

rotate([90,0,0])difference(){
    union(){
        translate([-15,  0, 0])cube([30,30,3]);
       
        translate([-15,  0, 0])cube([30,e,15+e]);
        hull(){
            translate([-10,  0, 0])cube([20,e,e]);
            translate([0,  0, h]) rotate([-90,0,0])cylinder(r=10, e);
        }
    }
    
    hull(){
        translate([-5,  0, 15+e])cube([10,e,e]);
        translate([0,  -1, h]) rotate([-90,0,0])cylinder(r=5, e+2);
    }
    translate([-10,  -1, e+12]) rotate([-90,0,0])cylinder(r=1.5, e+2);
    translate([ 10,  -1, e+12]) rotate([-90,0,0])cylinder(r=1.5, e+2);
    
    translate([ 0,  20, -1])cylinder(r=4.5, e+2);
}