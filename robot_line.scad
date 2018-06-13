$fs=$fs/2;
$fa=$fa/2;

roue_d = 70;
robot_d = 60;
robot_d2 = robot_d-10;
roue_h = 10;

robot_lg = 135;
robot_l = 95;
robot_lg_h = robot_lg - 2*(roue_h+5);

roue_arriere_x = robot_l-robot_d/2-10-5; 

capteur_pts = [-7.5*3,-7.5,7.5,7.5*3];
y_capteur = robot_l-45;

module axe(){
    intersection(){
        cylinder(r=3, 100);
        translate([-2,-5,0])cube([4,10,100]);
    }
    
}

module roue(){
    difference(){
        cylinder(r=roue_d/2-5, roue_h);
        translate([0, 0, 5]) pneu();
        translate([0, 0, -1])  cylinder(r=2.5/2, 100);
        translate([0, 0, 6]) axe();
    }
    translate([0, 0, 5]) pneu();
}



module pneu(){
    e = 10;
    rotate_extrude(){
        translate([roue_d/2-e/2,0,0]) scale([1,1]) circle (e/2);
    }
}

motor_l = 66;
motor_lg = 20;
motor_h = 25;
motor_axe = 12;
module motor(){
    translate([0, -motor_axe, -motor_h/2])cube([motor_lg,motor_l,motor_h]);
    
    translate([motor_lg/2-2.5, -motor_axe-6, -3])cube([5,50,6]);
    translate([3, 26, -motor_h/2+2])cube([motor_lg,28,motor_h-3]);
    translate([motor_lg/2-10,32,0]) cube([20,5,8], center=true);
    
    //translate([motor_lg/2-2.5, -motor_axe-2.5, 0]) rotate([0,90,0])cylinder(r=1.5, 40, center=true);
    
    translate([motor_lg/2,0,0]) rotate([0,90,0])cylinder(r=3.5, 40, center=true);
    translate([0,12,0]) rotate([0,90,0])cylinder(r=3.5, 20, center=true);
    translate([0,20,-17.5/2]) rotate([0,90,0])cylinder(r=1.5, 30);
}

module attach(e){
    translate([0,0,-50]) cylinder(r=1.7, 100);
    translate([0,0,3]) cylinder(r=4, 50);
    translate([0,0,-3]) rotate([180,0,0])cylinder(r=3.5, 50, $fn=6);
}

capteur_lg = 7;
capteur_l = 11;

module roue_arriere(){
    e = 3;
    difference(){
        hull(){
            translate([-15,0,0])cylinder(r=5,e);
            translate([15,0,0])cylinder(r=5,e);
        }
        translate([-15,0,-1])cylinder(r=1.5,10);
        translate([15,0,-1])cylinder(r=1.5,10);
    }
    hull(){
        translate([0,0,4]) difference(){
            rotate([0,90,0])cylinder(r=5, 20, center= true);
            translate([-20,-20,-20])cube([40,40,20]);
        }
        cube([20,10,0.1], center = true);
            
    }
}

module robot_body(){
    e = 2;
    r1 = robot_d/2;
    r2 = robot_d2/2;
    r_phere = robot_d/2-15;
    
    diff_lg = robot_lg_h - 2*(2*e + motor_lg);
    difference(){
        union(){
            for(i=[0,1]){
                mirror([i,0,0])  translate([robot_lg_h/2-10, 0,0]) rotate([0,-90,0])cylinder(15, r1, r2);
                mirror([i,0,0])  translate([robot_lg_h/2, 0,0]) rotate([0,-90,0])cylinder(10, r=r1);
            }
            //rotate([0,90,0]) cylinder(r=r1, robot_lg_h, center = true);
            hull(){
                rotate([0,90,0]) translate([0, r2-r1,0])cylinder(r=r2, robot_lg_h, center = true);
                translate([robot_lg_h/2-r_phere, robot_l-r2-r_phere,5]) sphere(r=r_phere);
                translate([robot_lg_h/2-r_phere, robot_l-r2-r_phere,-r2+r_phere]) sphere(r=r_phere);
                translate([-robot_lg_h/2+r_phere, robot_l-r2-r_phere,5]) sphere(r=r_phere);
                translate([-robot_lg_h/2+r_phere, robot_l-r2-r_phere,-r2+r_phere]) sphere(r=r_phere);
            }
        }
        //rotate([0,-90,0])cylinder(robot_lg, r=5, center=true);
        for(i=[0,1]){
            mirror([i,0,0]) translate([-robot_lg_h/2+e,0,0])motor();
            %mirror([i,0,0]) translate([-robot_lg_h/2+e,0,0])motor();
            mirror([i,0,0]) translate([robot_lg_h/2-15,-r1+9,0])attach ();
            mirror([i,0,0]) translate([robot_lg_h/2-15,robot_l-r2-6,0])attach ();
            
            mirror([i,0,0]) translate([-15,roue_arriere_x,-r2]) cylinder(r=1.5, 100);
        }
        
        for(i=capteur_pts){
            translate([i, y_capteur-14, -100]) cylinder(r=1.5, 100);
            translate([i-capteur_lg/2, y_capteur-capteur_l/2, -100]) cube([capteur_lg, capteur_l, 100]);
        }
        
        hull(){
            rotate([0,90,0]) translate([0, r2-r1,0])cylinder(r=r2-e, diff_lg, center = true);
            translate([0, robot_l-r2-r_phere,5]) 
                rotate([0,90,0]) cylinder(r=r_phere-e, diff_lg, center = true);
            translate([0, robot_l-r2-r_phere,-r2+r_phere]) 
                rotate([0,90,0]) cylinder(r=r_phere-e, diff_lg, center = true);;
        }
        translate([-diff_lg/2, 0,5]) cube([diff_lg,55,100]);
        
        translate([-10, 0,-15]) cube([20,111,13]);
    }
    support_lg = diff_lg+3;
    //translate([-support_lg/2, -5, -r2+e]) cube([support_lg, 1, r2-e]);
    /*translate([-support_lg/2, 11.5, -r2+e]) cube([support_lg, 5, 2]);
    translate([-support_lg/2, -10, -r2+e-0.2]) cube([support_lg, 65, 0.2]);
    for(i=[-7, 7]){
        translate([i, -8, -r2+e]) cube([0.8, 45, r2-e]);
    }*/
}

module demi_body_down(){
    difference(){
        robot_body(0);
        translate([-100,-100,0])cube([200,200,100]);
    }
}

module demi_body_up(){
    difference(){
        robot_body(0);
        translate([-100,-100,-100])cube([200,200,100]);
    }
}

module robot(){
    angle = -3;
    rotate([angle,0,0]) union(){
        demi_body_down();
        translate([0,0,1]) demi_body_up();
        translate([0,roue_arriere_x,-robot_d2/2]) rotate([0,180,0]) roue_arriere();
    }
    
    for(i=[0,1]){
        mirror([i,0,0])  translate([robot_lg/2 - roue_h, 0,0]) rotate([0,90,0])roue();
    }
    
    %translate([0,0,-roue_d/2]) cylinder(r=100,0.1);
    %translate([0,0,-roue_d/2]) cylinder(r=2,10);
}

select = 1
;
if(select==0){
    demi_body_up();
} else if(select==1){
    rotate([180, 0, 0]) demi_body_down();
} else if(select==2){
    rotate([0, 0, 0]) roue();
} else {
    robot();
}