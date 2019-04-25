
//translate([100,-70+x,0]) import("component/pi_model_v4.stl");
//translate([-100,59,0])  rotate([90,0,0]) import("component/screen_fond.stl");

screen_l = 193;
screen_lg = 111;
screen_r = 7;

trou_l = 126;
trou_lg = 65;
d_e1 = 2;
d_e2 = 1;
screen_vis = [[trou_l/2+d_e1, trou_lg/2+d_e2], [trou_l/2+d_e1, -trou_lg/2+d_e2]
    , [-trou_l/2+d_e1, trou_lg/2+d_e2], [-trou_l/2+d_e1, -trou_lg/2+d_e2]];

boitier_l = 197;
boitier_lg = 135;
boitier_y = -boitier_lg/2-10;

boitier_h = 40;

vis_r1 = 2.2;
vis_r2 = 4.2;

x =0;

y_camera = -boitier_lg/2+6;

//$fn=50;

module screen_int(){
    screen_l_int = 110;
    screen_lg_int = 90;
    r_int = 10;
    for(vis = screen_vis){
        translate(vis) cylinder(r=2, 20);
    }
    hull(){
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*(screen_l_int/2-r_int)+d_e1, j*(screen_lg_int/2-r_int)+d_e2, 0]) cylinder(r=r_int, 20);
            }
        }
    }
}

module screen(){
    screen_e = 1;
    screen_y = 66;
    
    screen_l_cube = 175;
    screen_lg_cube = 107;
    
    union(){
        hull(){
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*(screen_l/2-screen_r), j*(screen_lg/2-screen_r), 0]) cylinder(r=screen_r, screen_e);
                }
            }
        }
        translate([-screen_l_cube/2,-screen_lg_cube/2,0]) cube([screen_l_cube,screen_lg_cube, 8.5]);
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
                    translate([i*(boitier_l/2-r), j*(boitier_lg/2-r), 0]) cylinder(r=r, h);
                }
            }
        }
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*(boitier_l/2-r), j*(boitier_lg/2-r), -1]) cylinder(r=vis_r1, h+2);
            }
        }
        
        for(i=[-1,1]){
            translate([i*25, y_camera, -1]) cylinder(r=vis_r1, h+2);
        }
    }
        
}


module screen_fond(){
    e = 9.5;
    l = 200;
    lg = 150;
    difference(){
        boitier(e);
        translate([0,x,e+0.1]) mirror([0,0,1])screen();
    }
}

module screen_up(){
    e = 1.5;
    r = 6;
   difference(){
        mirror([0,1,0])boitier(boitier_h);
        translate([0,0,e+0.1]) rotate([180,0,0]) screen_int();
        hull(){
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*(boitier_l/2-15), -(boitier_lg/2-r-e), e]) cylinder(r=5, boitier_h+2);
                    translate([i*(boitier_l/2-15), (boitier_lg/2-r-e-10), e]) cylinder(r=5, boitier_h+2);
                }
            }
        }
        
        for(i=[-2:2]){
            hull(){
                translate([0,i*10,10]) rotate([0,90,0])cylinder(r=3, 1000, center = true);
                translate([0,i*10,boitier_h-10]) rotate([0,90,0])cylinder(r=3, 1000, center = true);
            }
        }
        
         for(i=[-1,1]){
            hull(){
                translate([i*35,0,boitier_h/2]) rotate([-90,0,0])cylinder(r=4.5, 1000);
                
            }
        }
    }
    
    
}

module screen_up2(){
    e = 3;
    r = 6;
    difference(){
        mirror([0,1,0])boitier(boitier_h);

        screen_int();
        translate([0,-x,e+0.1]) mirror([0,0,1])screen_int();
        hull(){
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*(boitier_l/2-15), -(boitier_lg/2-r-e), e]) cylinder(r=5, boitier_h+2);
                    translate([i*(boitier_l/2-15), -(-boitier_lg/2+30), e]) cylinder(r=5, boitier_h+2);
                }
            }
        }
        for(i=[-1,1]){
            translate([i*50, boitier_lg/2-10, boitier_h/2+e/2])  rotate([90,0,0])cylinder(r=vis_r2, 50, center = true);
        }
        translate([0,0, boitier_h/2+e/2])  rotate([0,90,0])cylinder(r=vis_r2, boitier_l+10, center = true);

        translate([0, boitier_lg/2-10, boitier_h/2+e/2]) cube([25, 50, 3], center = true);
        translate([-25/2, boitier_lg/2-4, boitier_h/2+e/2]) cube([25, 4, boitier_h]);
    }
    
    
}



z_rond = 20;
support_camera_rond_r = 10;
module support_camera1(){
    e = 5;
    z= z_rond;
    r1 = 5;
    z1 = 10;
    difference(){
        union(){
            hull(){
                translate([-25,0, 0])  cylinder(r=5, e);
                translate([25,0, 0])  cylinder(r=5, e);
                
                cylinder(r=10, e);
                
            }
            
            hull(){
                translate([0,0, z1])  sphere(r=r1); cylinder(r=10, e);
                
            }
            
             hull(){
                translate([0,0, z])  sphere(r=support_camera_rond_r); 
                translate([0,0, z1])  sphere(r=r1); 
                
            }
        }
        translate([-25,0, -1])  cylinder(r=2, e+2);
        translate([25,0, -1])  cylinder(r=2, e+2);
        
        hull(){
            translate([-12.5, 2, -1]) cube([25,100,2]);
            translate([0,8, 10]) rotate([0,90,0]) cylinder(r=2, 25, center=true);
        }
                
    }
}

module support_camera2(){
    e=3;
    l=38;
    l3=20;
    l2=18;
    r = 4;
    
    dz_rond = 12;
    difference(){
        union(){
            for(i=[0,1]){
                mirror([i,0,0]) translate([l2/2,-l3/2,0])cube([e, l3, l]);
            }
            translate([-l2/2-e,-l3/2,0])cube([l2+2*e, l, e]);
        }
        translate([0,0, z_rond])  rotate([0,90,0])cylinder(r=r, l+e+10, center = true);
        translate([0,0, z_rond - dz_rond])  rotate([0,90,0])cylinder(r=2, l+e+10, center = true);
        translate([0,0, z_rond + dz_rond])  rotate([0,90,0])cylinder(r=2, l+e+10, center = true);
            
        
    }
    
    %translate([0,0, z_rond + dz_rond])  rotate([0,90,0])cylinder(r=2, l+e+10, center = true);
    %translate([0,0, z_rond - dz_rond])  rotate([0,90,0])cylinder(r=2, l+e+10, center = true);
        
    z= 15;
    r1 = 5;
    z1 = 10;
    
}


module support_camera3(){
    r1 = 15;
    r2 = 10;
    h = 15+6;
    difference(){
        union(){
            hull(){
                translate([-35,0])rotate([0,0,0])cylinder(r=8,4);
                translate([35,0])rotate([0,0,0])cylinder(r=8,4);
                translate([-r1,-r1,0])cube([r1*2,r1*2,6]);
                
                //translate([-r1,-r1,0])cube([r1*2,r1*2,r1*2]);
            }
            hull(){
                translate([-r1,-r1,0])cube([r1*2,r1*2,6]);
                translate([0,0,h])rotate([0,90,0])cylinder(r=8,2*r1, center = true);
            }
        }
        translate([0,0,h])rotate([0,90,0])cylinder(r=4.2,3*r1, center = true);   
        translate([-r2,-r1,6])cube([r2*2,r1*2,60]);
        translate([35,0])rotate([0,0,0])cylinder(r=4,40);
        translate([-35,0])rotate([0,0,0])cylinder(r=4,40);
            
    }
}

module support_camera32(){
    e=3;
    l=38;
    l3=20;
    l2=18;
    r = 4;
    
    dz_rond = 12;
    r1 = 10;
    difference(){
        union(){
            rotate([-90,0,0])cylinder(r=10,100);
            translate([-r1/2,0,-10])cube([r1,100,2]);  
            translate([-r1,-r1,-r1])cube([20,20,20]);    
        }
        rotate([0,90,0])cylinder(r=4.2,100, center=true); 
    }
}

mode = 1;
if(mode==0){
    //translate([0, -x, -10.2])screen();
    //rotate([0,0,180]) translate([100,-70-x,10]) color("blue") import("component/pi_model_v4.stl");
    //translate([20,-70/3,10]) color("blue") cube([70,55,20]);
    
    translate([0,0,0.2])screen_up();
    rotate([0,180,180])screen_fond();
    
    translate([0,-y_camera+10,boitier_h/2]) rotate([-90,0,0]) support_camera3();
    translate([0,-y_camera+30,boitier_h/2]) support_camera32();
} else if(mode==1){
    screen_up();
} else if(mode==2){
    screen_fond();
} else if(mode==3){
    support_camera1();
} else if(mode==4){
    support_camera2();
}

