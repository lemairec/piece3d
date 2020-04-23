use <../config.scad>


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
boitier_lg = 155;
boitier_y = -boitier_lg/2-10;

boitier_vis_l = boitier_l/2-5;
boitier_vis_lg = boitier_lg/2-5;

boitier_h = 40;

vis_r1 = 2.2;
vis_r2 = 4.2;

x =0;


y_camera = -boitier_lg/2+6;

//$fn=50;

module usb(){
    usb_l = 28;
    usb_r = 12/2;
    union(){
        hull(){
            for(i=[-1,1]){
                translate([i*usb_l/2, 0,-20])cylinder(r=usb_r, 20);
            }
        }
        for(i=[-1,1]){
            translate([i*usb_l/2, 0,-1])cylinder(r=1.5, 20);
        }
    }
    
    cube([15,10,6], center= true);
}

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
    }
        
}


module screen_fond(){
    e = 9.5;
    l = 200;
    lg = 150;
    difference(){
        boitier(e);
        translate([0,x,e+0.1]) mirror([0,0,1])screen();
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*(boitier_vis_l), j*(boitier_vis_lg), -1]) cylinder(r=vis_r1, 100);
            }
        }
        
    }
    
    for(i=[-1,1]){
        hull(){
           translate([-boitier_l/2+10,i*65,1]) mirror([0,0,1])cube([boitier_l-20, 2, 1]); 
           translate([-boitier_l/2+20,i*65,21]) mirror([0,0,1])cube([boitier_l-40, 2, 1]);  
        }
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
                translate([boitier_l/2,i*10,10]) rotate([0,90,0])cylinder(r=3, boitier_l/2, center = true);
                translate([boitier_l/2,i*10,boitier_h-10]) rotate([0,90,0])cylinder(r=3, boitier_l/2, center = true);
            }
        }
        
        hull(){
            for(i=[-2:2]){
            translate([-boitier_l/2,i*10,10]) rotate([0,90,0])cylinder(r=3, boitier_l/2, center = true);
            translate([-boitier_l/2,i*10,boitier_h-10]) rotate([0,90,0])cylinder(r=3, boitier_l/2, center = true);
            }
        }
        
         for(i=[-1,1]){
            hull(){
                translate([i*35,0,boitier_h/2]) rotate([-90,0,0])cylinder(r=4.5, 1000);
                
            }
        }
        
        for(i=[0,1]){
            for(j=[0,1]){
                mirror([i,0]) mirror([0,j])
                    translate([boitier_vis_l, boitier_vis_lg, 10]) rotate([0,0,225])support_nut(3, 11, 11);
            }
        }
        
        for(i=[0,1]){
            for(j=[0,1]){
                mirror([i,0]) mirror([0,j])
                    translate([boitier_vis_l, boitier_vis_lg, boitier_h-10]) rotate([0,0,225])support_nut(3, 11, 11);
                
                mirror([i,0]) mirror([0,j])
                translate([-boitier_l/2+2, 45, boitier_h/2]) rotate([90,0,-90])usb();
            }
            
            
        
        }
        
        

    }
    
    
}


module screen_up2(){
    e = 1.5;
    r = 6;
    de = 15;
    fond_h = 25;
    difference(){
        mirror([0,1,0])boitier(fond_h);
        
        hull(){
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*(boitier_l/2-de), -(boitier_lg/2-r-e), e]) cylinder(r=5, fond_h+2);
                    translate([i*(boitier_l/2-r-e), -(boitier_lg/2-de), e]) cylinder(r=5, fond_h+2);
                    translate([i*(boitier_l/2-de), (boitier_lg/2-r-e), e]) cylinder(r=5, fond_h+2);
                    translate([i*(boitier_l/2-r-e), (boitier_lg/2-de), e]) cylinder(r=5, fond_h+2);
                }
            }
        }

        
        for(i=[0,1]){
            for(j=[0,1]){
                mirror([i,0]) mirror([0,j])
                    translate([boitier_vis_l, boitier_vis_lg, -1]) cylinder(r=1.6, 100);
            }
        }
        
        
        for(i=[-1,0,1]){
            translate([boitier_l/2, 10-i*20, fond_h/2]) rotate([0,90,0])cylinder(r=4, 10, center = true);
        }
        
        translate([boitier_l/2, -35, fond_h/2]) cube([100,15,10], center = true);
        
        hull(){
            for(i=[-1,1]){
                translate([-i*30, 50, 0]) cylinder(r=4, 10, center = true);
            }
        }
        
        hull(){
            for(i=[-1,1]){
                translate([-i*30, -50, 0]) cylinder(r=4, 10, center = true);
            }
        }
        

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

nb_cran = 24;

module support_ecran1(){
    r1 = 17;
    r2 = 12;
    h = 15+6;
    
    difference(){
        union(){
            hull(){
                translate([-35,0])rotate([0,0,0])cylinder(r=8,5);
                translate([35,0])rotate([0,0,0])cylinder(r=8,5);
                translate([-r1,-r1,0])cube([r1*2,r1*2,5]);
                
                //translate([-r1,-r1,0])cube([r1*2,r1*2,r1*2]);
            }
            for(i=[0,1]){
                mirror([i,0,0])hull(){
                    translate([r2,-r1,0])cube([5,r1*2,6]);
                    translate([r2,0,h])rotate([0,90,0])cylinder(r=8,5);
                }
                mirror([i,0,0])
                    translate([r2,0,h])rotate([0,-90,0]) sphere_cran(8, 1.1, 0.1, nb_cran);
            }
        }
        translate([0,0,h])rotate([0,90,0])cylinder(r=4.2,3*r1, center = true);   
        //translate([-r2,-r1,6])cube([r2*2,r1*2,60]);
        translate([35,0])rotate([0,0,0])cylinder(r=4,40);
        translate([-35,0])rotate([0,0,0])cylinder(r=4,40);
            
    }
}





module support_ecran2(){
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
            for(i=[0,1]){
                mirror([i,0,0])
                translate([-r1,0,0])rotate([0,-90,0]) rotate([0, 0, 180/nb_cran]) sphere_cran(8, 1.1, 0.1, nb_cran); 
            }
        }
        rotate([0,90,0])cylinder(r=4.2,100, center=true); 
    }
}

module support_cabine(){
    x = 30;
    r2=26/2;
    r=r2+5;
    difference(){
        union(){
            translate([-40,-r,0])cube([80, 2*r, 10]);
            hull(){
                translate([-20,-r,0])cube([40, 2*r, 10]);
                translate([-20,0, x])rotate([0,90,0]) cylinder(r=r,40);
            }
        }
        translate([-30,0,x])rotate([0,90,0]) cylinder(r=r2,60);
        
        translate([-35,0,-1])cylinder(r=4,60);
        translate([35,0,-1])cylinder(r=4,60);
    }
}

mode = 8;
if(mode==0){
    //translate([0, -x, -10.2])screen();
    //rotate([0,0,180]) translate([100,-70-x,10]) color("blue") import("component/pi_model_v4.stl");
    //translate([20,-70/3,10]) color("blue") cube([70,55,20]);
    
    translate([0,0,0.2])screen_up();
    rotate([0,180,180])screen_fond();
    translate([0,0,boitier_h+1]) screen_up2();
    
    translate([0,-y_camera+10,boitier_h/2]) rotate([-90,0,0]) support_ecran1();
    translate([0,-y_camera+31,boitier_h/2]) rotate([-360/nb_cran,0,0]) support_ecran2();
    
} else if(mode==1){
    screen_up();
} else if(mode==2){
    screen_up2();
} else if(mode==3){
    screen_fond();
} else if(mode==4){
    support_ecran1();
} else if(mode==5){
    support_ecran2();
} else if(mode==6){
    support_camera1();
} else if(mode==7){
    support_camera2();
} else if(mode==8){
    support_cabine();
}

