use <4040.scad>;
use <lame.scad>;

e = 5;
$fs=$fs/2;
$fa=$fa/2;

d_roue = 95;
d_roue2 = 75/2;
h_lame = 70;

lg = 300;

l = 500;

l1 = 50;
l_mot = 90;
l_tondeuse = 210;
l2 = 370;
l_roue = 440;

module support_diff_moteur2d(){
    union(){
        for(i = [-1,1]){
            translate([i*20-20, 10-30]) circle(r=2.2);
            translate([i*20-20, 50-30]) circle(r=2.2);
        }
        translate([20-20, 30-30]) circle(r=5);
    }
}

module support_moteur3d(){
    difference(){

        translate([-40,-30,0]) square([80,90]);

        
        for(i = [-1,1]){
            translate([i*20, 10]) circle(r=2.2);
            translate([i*20, 50]) circle(r=2.2);
        }
        translate([20, 30]) circle(r=5);
        
        translate([-25, -20])circle(r=4.2);
        translate([ 25, -20]) circle(r=4.2);
    }
}

module support_moteur3d(){
    difference(){

        linear_extrude(height=4){
            moteur2d();
        }
    }
}

module moteur3d(){
    translate([-30, -25,-25])cube([60,100,25]);
    for(i = [-1,1]){
        translate([i*20, 0]) cylinder(r=2.2,10);
        translate([i*20, 40]) cylinder(r=2.2,10);
    }
    translate([0, 0]) cylinder(r=5,10);
    translate([0, 50,-75]) cylinder(r=20,75);
    
    translate([0, 0,10])  cylinder(r=d_roue, 50);
}

module roue(){
    translate([-10, 30,d_roue2]) rotate([0,-90,180]) cylinder(r=d_roue2, 20);
    translate([0, 0,100]) cylinder(r=20, 5);
}



module piece_trans(){
    linear_extrude(3){
        difference(){
            union(){
                square([l,60]);
                translate([l_mot, 0, 0]) translate([0, -40, 0]) hull(){
                    translate([-40, 0, 0])square([80,60]);
                    translate([-80, 40, 0]) square([80+80,60]);
                }
            }
            translate([l_mot, -10, 0]) rotate([0,0,-90])support_diff_moteur2d();
        }
        
    }
}




mode = 0;

if(mode == 0){
    for(i=[0,1]){
        mirror([i,0,0]) translate([150, l_mot, d_roue]) rotate([90,0,90])moteur3d();
    }

    translate([0, 0,100])union(){
        for(i=[0,1]){
            
            mirror([i,0,0]) translate([lg/2, 0, 0]) rotate([90,0,90])piece_trans();
        }
        translate([-150, l1, 0]) cube([lg,3,60]);
        //translate([-150, 0, 0]) cube([lg,3,60]);
        translate([-150, l2, 0]) cube([lg,3,60]);
    }
    
    translate([0, l_tondeuse, h_lame]) union(){
        lame();
        cylinder(r=150,1);
    }

    translate([0, l_roue,0]) rotate([0,0,180]) roue();
} else {
    piece_trans();
}