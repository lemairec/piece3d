$fs=$fs/4;
$fa=$fa/4;

h=15;

h2 = 10;

difference(){
    cylinder(h,20,20);
    cylinder(40,4.2,4.2,center=true);
    translate([0,0,h-h2])cylinder(h+2,15/2, 15/2, $fn=6);
}
