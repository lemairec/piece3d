use <libs/threads.scad>
$fs=$fs/4;
$fa=$fa/4;

lg = 2000;
sc = 200;

module section(i){
    rotate([0,0,i*60])cube([40,sc, 3], center = true);
    cylinder(r = 10, 300);
    translate([0,0,100])cylinder(r =40, 200);
}

section(1);