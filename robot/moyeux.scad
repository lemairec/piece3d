$fs=$fs/4;
$fa=$fa/4;

include <../config.scad>;

e=5;

r1 = 40;
r2 = 15;
l1 =65;
h = 60;
h2 = h-10;

difference(){
    union(){
        cylinder(r=r1, e);
        
        cylinder(r=r2, h);
        for(i = [0:3]){
            rotate([0,0,90*i+45])hull(){
                translate([0,  -e/2,0]) cube([r1,e,e]);
                translate([0,  -e/2,h-e]) cube([r2,e,e]);
            }
        }
    }
    
    for(i = [0:3]){
        rotate([0,0,90*i])translate([0,  l1/2, -1]) cylinder(r=4.5, e+2);
    }
    
    translate([0, 0, -1])cylinder(r=3.5, h+e);
    
    translate([0,  10, h2])rotate([0,-90,90]) support_nut(4,10,10);
    translate([0,  -10, h2])rotate([0,-90,90]) support_nut(4,10,10);
       
}