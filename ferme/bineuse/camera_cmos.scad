use <../../config.scad>

resolution = 4; $fs=$fs/resolution; $fa=$fa/resolution;

lg_ext =40;
l_ext=40;

lg_int =32;
l_int=32;
h=14;

r_vis = 2.2 ;


module support_cam(){
    lg_vis =29;
    l_vis=29;
    x = 43;
    difference(){

        union(){
            difference(){
                hull(){
                    translate([0,0,h/2])rotate([0,90,0])cylinder(r=h/2, lg_ext,center = true);
                    translate([-lg_ext/2, 0]) cube([lg_ext,l_ext/2+x,h]);
                }
                //translate([-lg_ext/2, -l_ext/2]) cube([lg_ext,l_ext+10,h]);
                translate([-l_int/2, x-l_int/2, 2]) cube([l_int,l_int,h]);

                
            }
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*lg_vis/2, x-j*lg_vis/2]) cylinder(r=2.5, h);
                }
            }
        }
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*lg_vis/2, x-j*lg_vis/2, -1]) cylinder(r=2, h+3);
            }
        }
        translate([0,x, 14]) cube([38.5,38.5,2], center=true);

        //rotate([0,90,0]) cylinder(r=r_vis, 100, center = true);
        translate([12, 0, h/2]) rotate([0,90,0]) support_nut(4);
        translate([-12, 0, h/2]) rotate([0,90,0]) support_nut(4);
        translate([12, 20, h/2]) rotate([0,90,0]) support_nut(4);
        translate([-12, 20, h/2]) rotate([0,90,0]) support_nut(4);
        translate([0, 20, h/2]) rotate([0,90,0]) cylinder(r=r_vis, 100, center = true);
        
        translate([0, x,-1]) cylinder(r=9, 100, center = true);
    }
}

h_cam = 14;
module support_mat2(){
    x = 20;
    lg2 = lg_ext+8;
    e = 4;
    l=120;
    difference(){
        union(){
            translate([-lg2/2, -l/2+x]) cube([lg2,l,e]);
            translate([-lg2/2, -15]) cube([lg2,32,10]);
            intersection(){
                translate([-lg2/2, -15]) cube([lg2,32,400]);
                translate([-lg2/2, -15, 10]) rotate([0,90,0]) cylinder(r=32, lg2, true);
            }
        }
        translate([-lg_ext/2, -l/2, e]) cube([lg_ext,l,100]);
        
        translate([0,-10,h_cam]) rotate([0,90,0]) cylinder(r=r_vis, 100, center = true);
        
        translate([0,-10,h_cam]) rotate([0,90,0]) translate([0,20]) cylinder(r=r_vis, 100, center = true);
        translate([0,-10,h_cam]) rotate([22.5,0,0]) translate([0,20]) rotate([0,90,0]) cylinder(r=r_vis, 100, center = true);
        translate([0,-10,h_cam]) rotate([45,0,0]) translate([0,20]) rotate([0,90,0]) cylinder(r=r_vis, 100, center = true);
        translate([0,-10,h_cam]) rotate([67.5,0,0]) translate([0,20]) rotate([0,90,0]) cylinder(r=r_vis, 100, center = true);
        translate([0,-10,h_cam]) rotate([90,0,0]) translate([0,20]) rotate([0,90,0]) cylinder(r=r_vis, 100, center = true);
        
        translate([0, -50+x, 0]) cylinder(r=5, 100, center = true);
        translate([0, 50+x, 0]) cylinder(r=5, 100, center = true);
        
            
    }
}

mode=2;

if(mode==0){
    translate([0,-10,h_cam]) rotate([0,0,0])translate([0,0,-h/2])support_cam();
    support_mat2();
} else if(mode==1){
    support_cam();
} else if(mode==2){
    support_mat2();
}