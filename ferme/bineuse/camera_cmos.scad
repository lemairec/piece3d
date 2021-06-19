use <../../config.scad>

resolution = 4; $fs=$fs/resolution; $fa=$fa/resolution;

lg_ext =40;
l_ext=40;

lg_int =32;
l_int=32;
h=14;


module support_cam(){
    lg_vis =29;
    l_vis=29;
    difference(){

        union(){
            difference(){
                translate([-lg_ext/2, -l_ext/2]) cube([lg_ext,l_ext+10,h]);
                translate([-l_int/2, -l_int/2, 2]) cube([l_int,l_int,h]);

                
            }
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*lg_vis/2, j*lg_vis/2]) cylinder(r=2, h);
                }
            }
        }
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*lg_vis/2, j*lg_vis/2, -1]) cylinder(r=1.5, h+3);
            }
        }
        
        translate([0, l_ext/2+5, h/2]) rotate([0,90,0]) cylinder(r=2, 100, center = true);
        
        translate([0, 0,-1]) cylinder(r=9, 100, center = true);
    }
}

module support_cam2(){
    lg2 = lg_ext+8;
    e = 4;
    l=100;
    difference(){
        union(){
            translate([-lg2/2, -l/2]) cube([lg2,l,e]);
            hull(){
                translate([-lg2/2, -30]) cube([lg2,60,e]);
                translate([-lg2/2, -10]) cube([lg2,20,e+20]);
            }
        }
        translate([-lg_ext/2, -l/2, e]) cube([lg_ext,l,100]);
        
        translate([0, 0, 16]) rotate([0,90,0]) cylinder(r=2, 100, center = true);
        
        translate([0, -40, 0]) cylinder(r=5, 100, center = true);
        translate([0, 40, 0]) cylinder(r=5, 100, center = true);
        
            
    }
}

support_cam2();