use <4040.scad>;
use <support_camera.scad>;

//remorque 1300,2500

robot_l = 1500;
robot_lg = 1300;
h_chassis = 400;
d_roue = 250;
l_roue = 50;


module cadre_robot(){
    translate([-robot_lg/2+20, 0, 0]) rotate([-90,90,0]) barre4040(robot_l, false);
    translate([ robot_lg/2-20, 0, 0]) rotate([-90,90,0]) barre4040(robot_l, false);
    translate([0, 0, 0]) rotate([0,90,0]) barre4040(robot_lg, true);
    translate([0, 150, 0]) rotate([0,90,0]) barre4040(robot_lg, true);
}

translate([0, 0, h_chassis]) cadre_robot();

//inrow
translate([0, 250, 200]) rotate([0,90,0]) barre4040(robot_lg, true);
for(i=[0:1]){
    mirror([i,0,0])translate([-robot_lg/2+60, 250, 200]) rotate([0,0,0]) barre4040(500, false);
}
for(i=[-1:1]){
    translate([i*450,300, 200]) rotate([-90,90,0]) cylinder(r=200,5);
}

//camera
translate([0, 400, h_chassis]) rotate([0,90,0]) barre4040(robot_lg, true);
translate([0, 400, h_chassis]) barre4040(1000, false);
translate([0, 400, 1350]) rotate([-90,90,0]) barre4040(1000, false);


//roue
x = 0;
for(i=[0,1]){
    mirror([i,0,0]) translate([robot_lg/2, x, d_roue/2]) rotate([0,-90,0])cylinder(r=d_roue/2, 50);
    mirror([i,0,0]) translate([robot_lg/2, x+robot_l, d_roue/2]) rotate([0,-90,0])cylinder(r=d_roue/2, 50);
}


%translate([-450*3/2, 500, 0]) cube([450*3,450*3/4*3,1]);

for(i=[-1:1]){
    for(j=[-6:6]){
        color("green")translate([i*450, j*150,  0]) cube([10,10,10], center = true);
    }
    color("blue")translate([i*450 + 225, -150,  0]) cube([1,2000,1], center = true);
    
    //translate([i*450,200, 200]) rotate([-90,90,0]) cylinder(r=200,5);
}



x2 = -450;


//translate([-1300/2,-1000]) cube([1300,2500, h_chassis]);

