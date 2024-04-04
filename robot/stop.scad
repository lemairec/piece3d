$fs=$fs/4;
$fa=$fa/4;

e=4;
h=30;

difference(){
    union(){
        translate([-18, -3,  0])cube([36,28,30]);
 
        translate([-15,  -15-e, 0])cube([30,15+e,e]);
        hull(){
            translate([-10,  -e, 0])cube([20,e,e]);
            translate([0, -h,  0]) cylinder(r=10, e);
        }
    }
    
    hull(){
        translate([-5, -15-2*e,  0])cube([10,e,e]);
        translate([0,  -h, -1]) cylinder(r=5, e+2);
    }
    translate([0, -6-e,  e])cube([15,2,3], true);
    translate([-10,  -e-12, -1]) cylinder(r=1.5, e+2);
    translate([ 10,  -e-12, -1]) cylinder(r=1.5, e+2);
    
    translate([ 0, 16, 15]) rotate([0,-90,0])cylinder(r=4.5, 40, center= true);
    translate([-15.5,  0, -1])cube([31,40, 33]);
 
}