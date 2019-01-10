
//translate([100,-70+x,0]) import("component/pi_model_v4.stl");
//translate([-100,59,0])  rotate([90,0,0])import("component/screen_fond.stl");

screen_l = 193;
screen_lg = 112;
screen_r = 5;

screen_vis = [[65, 33], [65, -33], [-62, 33], [-62, -33]];

boitier_l = 200;
boitier_lg = 140;
boitier_y = -boitier_lg/2-10;

vis_r1 = 2.2;
vis_r2 = 4.2;

x =0;

$fn=50;

module screen_int(){
    screen_l_int = 110;
    screen_lg_int = 60;
    r_int = 10;
    for(vis = screen_vis){
        translate(vis) cylinder(r=2, 20);
    }
    hull(){
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*(screen_l_int/2-r_int), j*(screen_lg_int/2-r_int), 0]) cylinder(r=r_int, 20);
            }
        }
    }
}

module screen(){
    screen_e = 2;
    screen_y = 66;
    
    screen_l_cube = 175;
    screen_lg_cube = 108;
    
    union(){
        hull(){
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*(screen_l/2-screen_r), j*(screen_lg/2-screen_r), 0]) cylinder(r=screen_r, screen_e);
                }
            }
        }
        translate([-screen_l_cube/2,-screen_lg_cube/2,0]) cube([screen_l_cube,screen_lg_cube, 7]);
        translate([-screen_l_cube/2-7,-screen_lg_cube/2,0]) cube([screen_l_cube,screen_lg_cube, 3]);
    
        screen_int();
    }
}

module boitier(h){
    r = 6;
    difference(){
        hull(){
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*(boitier_l/2-r), j*(boitier_lg/2-r), 0]) cylinder(r=5, h);
                }
            }
        }
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*(boitier_l/2-r), j*(boitier_lg/2-r), -1]) cylinder(r=vis_r1, h+2);
            }
        }
        
        for(i=[-1,1]){
            translate([i*25, -boitier_lg/2+r, -1]) cylinder(r=vis_r1, h+2);
        }
    }
        
}


module screen_fond(){
    e = 10;
    l = 200;
    lg = 150;
    difference(){
        boitier(e);
        translate([0,x,e+0.1]) mirror([0,0,1])screen();
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*(boitier_l/2-r), j*(boitier_lg/2-r), -1]) cylinder(r=2, e+2);
            }
        }
    }
}


module screen_up(){
    h = 40;
    
    e = 3;
    r = 6;
   difference(){
        mirror([0,1,0])boitier(h);
        translate([0,-x,e+0.1]) mirror([0,0,1])screen_int();
        hull(){
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*(boitier_l/2-15), -(boitier_lg/2-r-e), e]) cylinder(r=5, h+2);
                    translate([i*(boitier_l/2-15), -(-boitier_lg/2+30), e]) cylinder(r=5, h+2);
                }
            }
        }
        for(i=[-1,1]){
            translate([i*50, boitier_lg/2-10, h/2+e/2])  rotate([90,0,0])cylinder(r=vis_r2, 50, center = true);
        }
        translate([0,0, h/2+e/2])  rotate([0,90,0])cylinder(r=vis_r2, boitier_l+10, center = true);
        
        translate([0, boitier_lg/2-10, h/2+e/2]) cube([25, 50, 3], center = true);
        translate([-25/2, boitier_lg/2-4, h/2+e/2]) cube([25, 4, h]);
    }
    
    
}

mode = 1;
if(mode==0){
    %translate([0, -x, -10.2])screen();
    rotate([0,0,180]) translate([100,-70-x,10]) color("blue") import("component/pi_model_v4.stl");
    
    translate([20,-70/3,10]) color("blue") cube([70,55,20]);
    translate([0,0,0.2])screen_up();
    rotate([0,180,180])screen_fond();
} else if(mode==1){
    screen_up();
} else {
    screen_fond();
}