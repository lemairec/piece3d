include <config.scad>
include <libs/sphere_cran.scad>

module support_volant(){
    l = 110;
    l2 = 200;
    lg=90;
    h=20;
    angle=40;
    e = 5;
    de=3;
    difference(){
        union(){
            hull(){
                for(i = [-1,1]){
                    for(j = [-1,1]){
                        translate([i*l/2, j*lg/2, 0]) cylinder(r=e+1, h, center = true);
                    }
                }
                
            }
            rotate([0,0,40])cube([l2, 2*e+de, h], center = true);
            rotate([90,0,angle]) translate([90,0, e+de/2]) sphere_cran(h/2,1.5,0.1,32);
        }
        hull(){
            for(i = [-1,1]){
                for(j = [-1,1]){
                    translate([i*l/2, j*lg/2, 0]) cylinder(r=1, h+2, center = true);
                }
            }
            
        }
        rotate([0,0,40])cube([l2+2, de, h+2], center = true);
        
        rotate([90,0,angle]) translate([90,0, 0]) cylinder(r=4,98, center = true);
    }
   
}

module support_volant2(){
    e = 5;
    r = 10;
    h=20;
    de=3;
    difference(){
        union(){
            cylinder(r=r+e,h, center = true);
            translate([20,0,0])  cube([2*(r+e), 2*e+de, h], center = true);
            rotate([90,0,angle]) translate([r+e+10,0, e+de/2]) sphere_cran(h/2,1.5,0.1,32);      
        }
        cylinder(r=r,h+2, center = true);
        translate([19+e,0,0])  cube([2*(r+e), de, h+2], center = true);
        rotate([90,0,angle]) translate([r+e+10,0, e]) cylinder(r=4,98, center = true);
    }
    
}

support_volant();
support_volant2();