use <../config.scad>

gps_l = 70;
gps_lg = 70;
$fn=60;

h = 10;

module gps(){
    difference(){
        hull(){
            translate([-gps_l/2-6,-gps_l/2-6,0])cube([gps_l+12, gps_l+12,h]);
        }
        translate([-gps_l/2-2,-gps_l/2-2,h-6])cube([gps_l+4, gps_l+12,h]);
        
        translate([0, gps_l/2,h-4])rotate([0,90,0])cylinder(r=1.5,100, center = true);
        translate([0, -gps_l/2,h-4])rotate([0,90,0])cylinder(r=1.5,100, center = true);
    }
    %union(){
        translate([0,0,25])cube([gps_l+10, gps_l+10,1], center = true);
        translate([-gps_l/2,  gps_l/2,20])cylinder(r=1.5,20, center = true);
        translate([-gps_l/2, -gps_l/2,20])cylinder(r=1.5,20, center = true);
        translate([ gps_l/2,  gps_l/2,20])cylinder(r=1.5,20, center = true);
        translate([ gps_l/2, -gps_l/2,20])cylinder(r=1.5,20, center = true);
    }
}

gps();