use <4040.scad>;
use <support_camera.scad>;

robot_l = 1000;
robot_lg = 500;

module cadre_robot(){
    translate([-robot_lg/2, 0, 20]) rotate([90,90,0]) barre4040(robot_l, true);
    translate([ robot_lg/2, 0, 20]) rotate([90,90,0]) barre4040(robot_l, true);
    translate([0, -robot_l/2+20, 20]) rotate([0,90,0]) barre4040(robot_lg, true);
    translate([0,  robot_l/2-20, 20]) rotate([0,90,0]) barre4040(robot_lg, true);
}

translate([0, 0, 120]) cadre_robot();


translate([-450/2, -150, 0]) cube([450,450*4/3,1]);

for(i=[-1:1]){
    for(j=[-6:6]){
        color("green")translate([i*450, j*150,  0]) cube([10,10,10], center = true);
    }
}

x = 450;
for(i=[-1,1]){
    translate([i*600/2, x, 100]) rotate([0,90,0])cylinder(r=100, 20, center = true);
}
translate([0, x, 100]) rotate([0,90,0])cylinder(r=8, 600, center = true);

x2 = -450;
for(i=[-1,1]){
    translate([i*600/2, x2, 100]) rotate([0,90,0])cylinder(r=100, 20, center = true);
}
translate([0, x2, 100]) rotate([0,90,0])cylinder(r=8, 600, center = true);

translate([0,150, 160])  all();