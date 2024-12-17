$fs=$fs/2;
$fa=$fa/2;

d = 120;
h1=12;
h2=5;


module bol(){
    difference(){
        union(){
            translate([-20, -20, 0])cube([40,40,5]);
            translate([-10, -20, 0])cube([20,40,12]);
            
            
            
        }
        translate([0, 0, 20])rotate([90,0,0])cylinder(r=25/2,32, center = true);
        
        translate([-20, 6, 5])cube([49,4,2]);
        translate([-20, -10, 5])cube([49,4,2]);
        
        translate([-15, 0, -1])cylinder(r=5/2,32, center = true);
        translate([ 15, 0, -1])cylinder(r=5/2,32, center = true);
    }
}

bol();