use <../../config.scad>

$fs=$fs/2;
$fa=$fa/2;

translate([-20,0,0])cube([40,800,20]);



translate([-20,0,10]) rotate([0,90,0]) cylinder(r=10, 100);

translate([20,0,10]) rotate([0,90,0]) cylinder(r=20, 20);
rotate([-20,0,0]){
    translate([30,0,-10]) cube([10,300,40]);
    translate([30,-20,-10]) cube([10,40,100]);
}