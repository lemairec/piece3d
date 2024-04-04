include <config.scad>


$fs=$fs/2;
$fa=$fa/2;

h = 10;

difference(){
    hull(){
        translate([0, -4, 0])cube([40, 8, 2]);
        translate([1, -3, h])cube([20, 6, 0.1]);
    }
    translate([1, 0, h])cube([50, 1, 1],center = true);
}
    