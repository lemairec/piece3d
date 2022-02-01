use <2020.scad>
use <rounded_box.scad>
use <nema17.scad>

//translate([-35, -30,0])import("hbar.stl");

h_l = 40.5;
h_lg = 35;
e=4;

r_vis = 2.75;


//pied();

module stop(){
    union(){
        translate([0,0,0]) cube([40,15,2]);
        translate([3,3,0]) cylinder(r=2, 20, center=true);
        translate([3,12,0]) cylinder(r=2, 20, center=true);
        translate([-20,1,0]) cube([33, 15, 7]);
        
        translate([19.5,5,0]) cube([ 14, 10, 7]);
        translate([17,13,0]) cylinder(r=2, 20, center=true);
        translate([36,13,0]) cylinder(r=2, 20, center=true);
        
        /*translate([-16,-1,4]) cube([32,19,5]);
        translate([-10,4,0]) cylinder(r=2, 12, center=true);
        translate([10,4,0]) cylinder(r=2, 12, center=true);
        translate([-7,4+6.5,2]) cube([14,2,5]);
        translate([0,21,0]) cylinder(r=3, 12, center=true);*/
        
        
    }
   
}

module stop2(){
    x = 16;
    difference(){
        cube([50,30,8.9]);
        translate([x,22,0]) cylinder(r=2, 20, center=true);
        translate([x+20,22,0]) cylinder(r=2, 20, center=true);
        
        translate([10,15,9]) rotate([180,0,0]) stop();
    }
}

stop2();
   
    
    
    
    
    