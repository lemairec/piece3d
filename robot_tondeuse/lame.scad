$fs=$fs/4;
$fa=$fa/4;

include <../config.scad>;

e=4;
h=30;
diametre=200;

h1=8;



module lame(){
    difference(){
        union(){
           hull(){
               translate([-diametre/2,  0, 0])cylinder(r=10, h=h1);
               translate([0,  0, 0])cylinder(r=20, h=h1);
               translate([diametre/2,  0, 0])cylinder(r=10, h=h1);
           }
           translate([0,  0, 0])cylinder(r=20, h=25);
       }
       translate([0,  0, -1])cylinder(r=2.7, h=30);
       translate([0,  10, 20])rotate([0,-90,90]) support_nut(4,10,10);
       translate([0,  -10, 20])rotate([0,-90,90]) support_nut(4,10,10);
       
       translate([-diametre/2,  0, h1/2])nut(5,10);
       translate([-diametre/2,  0, -1]) cylinder(r=2.7, h=30);
       translate([diametre/2,  0, h1/2])nut(5,10);
       translate([diametre/2,  0, -1]) cylinder(r=2.7, h=30);
       
   }
   
};

rotate([0,0,45])lame();

