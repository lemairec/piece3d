use <4040.scad>;

robot_l = 900;
robot_lg = 800;

module cadre_robot(){
    translate([-robot_lg/2, 0, 20]) rotate([90,90,0]) barre4040(robot_l, true);
    translate([ robot_lg/2, 0, 20]) rotate([90,90,0]) barre4040(robot_l, true);
    translate([0, -robot_l/2+20, 20]) rotate([0,90,0]) barre4040(robot_lg, true);
    translate([0,  robot_l/2-20, 20]) rotate([0,90,0]) barre4040(robot_lg, true);
}

translate([0, 0, 200]) cadre_robot();

for(i=[-2:3]){
    color("green")translate([-450/2+i*450, 0,  0]) cube([10,10000,10], center = true);
}
