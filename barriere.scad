include <config.scad>


$fs=$fs/2;
$fa=$fa/2;

r1 = 5;
r2 = 5.5/2;

l=56;
l2=56-1;
h=20;
e=2;

difference(){
    hull(){
        cylinder(r=r1+e, h);

        translate([l, r2-r1, 0])cylinder(r=r1+e, h);
    }
    translate([0, 0, -1])cylinder(r=r1, h+2);
    
    rotate([0,0,90+20])translate([-10, 0, -1])cube([20,20,h+2]);
    translate([l, 0, -1])cylinder(r=r2, h+2);
    translate([l2, 0, 0])rotate([0,0,-90-45])translate([-20, 0, -1])cube([40,40,h+2]);
}
    