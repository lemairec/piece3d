use <../../config.scad>

boitier_l = 100;
boitier_lg = 100;
boitier_h = 10;
fixation = 50;
r = 6;
e = 2;
$fn=60;

h = 10;

e2 = 7; //7

module fixation_u(l=6){
    translate([-4,-5-l/2,0])cube([8, 10+l,e2]);
}

module fixation_d(l=6){
    translate([-10,-l/2,7])cube([20,l, 20]);
    translate([0, -2-l/2, -1])cylinder(r=2, 10);
    translate([0,  2+l/2, -1])cylinder(r=2, 10);
}

module gps(){
    difference(){
        union(){
            difference(){
                hull(){
                    for(i=[-1,1]){
                        for(j=[-1,1]){
                            translate([i*boitier_l/2, j*boitier_lg/2,0]) cylinder(r=r, boitier_h);
                        }
                    }
                }
                hull(){
                    for(i=[-1,1]){
                        for(j=[-1,1]){
                            translate([i*boitier_l/2, j*boitier_lg/2,e]) cylinder(r=r-e, boitier_h);
                        }
                    }
                }
            }
            
            translate([-25, -boitier_lg/2-r,0]) cube([50, 5, boitier_h]);
            
            for(i=[-1,1]){
                translate([0, i*fixation/2,0]) cylinder(r=6, 6);
            }
            
            
            for(i=[-1,1]){
                hull(){
                for(j=[-1,1]){
                    translate([i*boitier_l/3, j*boitier_lg/3,e]) cylinder(r=3, 7);
                }
                }
            
        }
            
            translate([boitier_l/2+r-4, 20, 0]) fixation_u();
            translate([boitier_l/2+r-4, -20, 0]) fixation_u();
            translate([boitier_l/2+r-4, 40, 0]) fixation_u();
            translate([boitier_l/2+r-4, -40, 0]) fixation_u();
            translate([boitier_l/2+r-4, 0, 0]) fixation_u(10);
            translate([-(boitier_l/2+r-4), 0,  0]) fixation_u();
            translate([-(boitier_l/2+r-4), -40,  0]) fixation_u();
            
        }
        translate([boitier_l/2+r-4, 20, 0]) fixation_d();
        translate([boitier_l/2+r-4, -20, 0]) fixation_d();
        translate([boitier_l/2+r-4, 40, 0]) fixation_d();
        translate([boitier_l/2+r-4, -40, 0]) fixation_d();
        translate([boitier_l/2+r-4, 0, 0]) fixation_d(10);
        translate([-(boitier_l/2+r-4), 0,  0]) fixation_d();
        translate([-(boitier_l/2+r-4), -40,  0]) fixation_d();
        translate([0, -boitier_lg/2, 30]) cube([20,40,40], center=true);
        
        
        for(i=[-1,1]){
            translate([0,0,6.1])rotate([0,180,0])translate([0,i*fixation/2,0]) m4(10, true);
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*65/2, j*90/2,-1]) cylinder(r=1.5, 7);
                translate([i*70/2, j*110/2,-1]) cylinder(r=1.5, 7);
            }
        }
    }
}

module gps2(){
    difference(){
        union(){
            difference(){
                hull(){
                    for(i=[-1,1]){
                        for(j=[-1,1]){
                            translate([i*boitier_l/2, j*boitier_lg/2,0]) cylinder(r=r, boitier_h);
                        }
                    }
                }
                hull(){
                    for(i=[-1,1]){
                        for(j=[-1,1]){
                            translate([i*boitier_l/2, j*boitier_lg/2,e2]) cylinder(r=r-e, boitier_h);
                        }
                    }
                }
                translate([0,0,e+10]) cube([boitier_lg+1, boitier_l+1,20], center = true);
            }
            
            
            translate([-45, -boitier_lg/2-r-15,0]) cube([90, 15, e]);
            
            for(i=[-1,1]){
                translate([i*fixation/2, 0,0]) cylinder(r=6, 6);
            }
            
            
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*boitier_l/3, j*boitier_lg/3,e]) cylinder(r=3, e2);
                }
            }
            
        }
        
        for(i=[0,90,180,270]){
            rotate([0,0,i])translate([boitier_l/2+r-4, 30, 0]) fixation_d();
            rotate([0,0,i])translate([boitier_l/2+r-4, -30, 0]) fixation_d();
            rotate([0,0,i])translate([boitier_l/2+r-4, 00, 0]) fixation_d();
        }
        
        
        
        for(i=[-1,1]){
            translate([i*75/2,-62,-1]) m4(10);
        }
        
        for(i=[-1,1]){
            translate([0,0,6.1])rotate([0,180,0])translate([i*fixation/2, 0]) m4(10, true);
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*(boitier_lg-5)/2, j*(boitier_l-5)/2,-1]) cylinder(r=2, 7);
            }
        }
    }
}

gps2();
%translate([0,0,10]) cube([boitier_lg, boitier_l,2], center = true);