$fs=$fs/2;
$fa=$fa/2;

r = 3;
r2 = 59/2;


rotate_extrude(){
    translate([r2,0,0]) square([4.5,7]);
    translate([r2,7,0]) square([5.5,11-r]);
    translate([r2+r,7,0]) square([5.5-r,11]);
    translate([r2+r,11+7-r,0]) difference(){
        circle (r);
        translate([5.5-r,-3])square([5.5,11-r]);
    }
}