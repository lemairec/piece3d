include <config.scad>
$fs=$fs/2;
$fa=$fa/2;

escimeuse_lg = 400;
escimeuse_h = 450;
escimeuse_l = 480;
escimeuse_lg_h = 100;

roue_d = 160;
roue_h = 20;
roue_x = 100;
roue_y = 30;


top_h =  escimeuse_h-50;
top_lg = escimeuse_lg_h + (1-top_h/escimeuse_h)*(escimeuse_lg-escimeuse_lg_h);;

cran = 20;
e = 5;

eps = 50;

middle_l = escimeuse_l-20;
middle_h = 50;

tondeuse_d = 180;
tondeuse_h = -5;

tondeuse_pts = [-tondeuse_d/2, +tondeuse_d/2];
//tondeuse_pts = [-tondeuse_d, 0, tondeuse_d];
//tondeuse_pts = [-tondeuse_d*3/2, -tondeuse_d*1/2, tondeuse_d*1/2, tondeuse_d*3/2];

module motor2d(){
    circle(r=2.5);
    for(i = [-1,1]){
        translate([i*20,0]) circle(2);
        translate([i*20,40]) circle(2);
    }
}

module cote(){
    difference(){
        hull(){
            translate([-escimeuse_lg/2,0]) square([escimeuse_lg, 1]);
            translate([-escimeuse_lg_h/2,escimeuse_h]) square([escimeuse_lg_h, 1]);
        }
        
        translate([-top_lg/2, top_h-e])cran_x_vis(top_lg, e, cran, 3, [0.25, 0.75]);
        translate([-escimeuse_lg/2, -1])cran_x_nuts(escimeuse_lg, e, cran, 3, [0.25, 0.75]);
        
        translate([-e/2, 0])cran_y_vis(top_h, e , cran, 3, [0.25, 0.75]);
        translate([roue_x, roue_y]) motor2d();
        for(j=[0.5, 0.8]){
            for(i=[0,1]){
                mirror([i,0,0]) translate([(top_lg + (escimeuse_lg-top_lg)*(1-j))/2 - 20, top_h*j]) circle(4);
            }
        }
    }
}

module middle(){
    r = 30;
    eps_top = 80;
    difference(){
        translate([-escimeuse_l/2,0]) square([escimeuse_l, top_h]);
        
        
        for(i=[0,1]){
            mirror([i,0,0]) translate([-escimeuse_l/2-1, 0])cran_y_nuts(top_h, e + 1, cran, 3, [0.25, 0.75]);
        }
        
        hull(){
             for(i=[-1,1]){
                 translate([i*(escimeuse_l/2-r-eps), top_h-r-eps_top]) circle(r=r);
                 translate([i*(escimeuse_l/2-r-eps), 0]) circle(r=r);
             }
        }
        
        for(j=[-3:3]){
            for(i=[0,1]){
                mirror([i,0,0])translate([(escimeuse_l/2-eps/2), top_h/2+j*30]) circle(r=4);
            }
        }
        
        translate([-escimeuse_l/2, top_h+1]) mirror([0,1,0]) cran_x_nuts(escimeuse_l, e + 1, cran, 3, [0.25, 0.75]);
        for(i=[0,1]){
            mirror([i,0,0]) translate([-escimeuse_l/2, -1]) cran_x_nuts(eps, e + 1, cran, 3, [0.5]);
        }
    }
}


module middle2(){
    
    difference(){
        translate([-middle_l/2,0]) square([middle_l, middle_h]);
        for(i=[0,1]){
            mirror([i,0,0])translate([(escimeuse_l/2-eps/2), middle_h/2]) circle(r=4);
        }
        for(x = tondeuse_pts){
            translate([x-20,10]) circle(r=1.5);
            translate([x+20,10]) circle(r=1.5);
            translate([x-20,30]) circle(r=1.5);
            translate([x+20,30]) circle(r=1.5);
        }
    }
}

module top(){
    difference(){
        translate([-escimeuse_l/2,-top_lg/2]) square([escimeuse_l, top_lg]);
        
        
        for(i=[0,1]){
            mirror([i,0,0]) translate([-escimeuse_l/2-1, -top_lg/2])cran_y_nuts(top_lg, e + 1, cran, 3, [0.25, 0.75]);
        }
        
        translate([-escimeuse_l/2, -e/2])cran_x_vis(escimeuse_l, e, cran, 3, [0.25, 0.75]);    
    }
}

module bas(){
    de = 2;
    difference(){
        hull(){
            translate([eps/2-de,-escimeuse_lg/2+10]) circle(eps/2+de);
            translate([eps/2-de,escimeuse_lg/2]) circle(eps/2+de);
        }
        
        translate([e,roue_x-roue_d/2])  square([roue_h+8, roue_d]);
        translate([0, -escimeuse_lg/2])cran_y_vis(escimeuse_lg, e, cran, 3, [0.25, 0.75]);
        translate([0, -e/2])cran_x_vis(eps, e, cran, 3, [0.25, 0.75]);    
    }
}


module roue2d(){
    roue_d1 = roue_d-10;
    roue_d2 = roue_d;
    cran_h = 10;
    circle(r=roue_d1/2);
    n = 16;
    for(i=[0:n]){
        rotate([0,0,i*360/n])translate([-cran_h/2, 0]) square([cran_h,roue_d2/2]);
    }
}

module roue(){
    translate([0,0,-20])cylinder(r=1, roue_h+10);
    linear_extrude(e) roue2d();
}

module motor_tondeuse(){
    cylinder(r=20, 50);
    
    cylinder(r=tondeuse_d/2, 1);
}

mode = 0;
if(mode == 1){
    de=1;
    %translate([-laser_printer_l/2, 0, 0])square([laser_printer_l, laser_printer_lg]);
    cote();
    %translate([-laser_printer_l/2, laser_printer_lg, 0])square([laser_printer_l, laser_printer_lg]);
    translate([0, laser_printer_lg, 0])middle();
    translate([0, laser_printer_lg+de+top_h, 0])middle2();
    translate([0, 2*laser_printer_lg + top_lg/2, 0])top();
    translate([0, -laser_printer_lg, 0])bas();
} else {
    e2 = e;
    for(i=[0,1]){
        mirror([i,0,0])translate([-escimeuse_l/2+e+5,roue_x,roue_y]) rotate([90, 0, 90]) roue();
        mirror([i,0,0])translate([-escimeuse_l/2,0,0]) rotate([90, 0, 90]) linear_extrude(e2) cote();
        mirror([i,0,0])translate([-escimeuse_l/2,0,0]) linear_extrude(e2) bas();
    }
    translate([0,e/2,0]) rotate([90, 0, 0]) linear_extrude(e2)  middle();
    translate([0,0,top_h-e]) linear_extrude(e2)  top();
    
    translate([0,-e,top_h*2/3-middle_h/2]) union(){
        rotate([90, 0, 0]) linear_extrude(e2)  middle2();
        for(x = tondeuse_pts){
            translate([x,-20,tondeuse_h])  motor_tondeuse();
        }
        
    }
    
}

