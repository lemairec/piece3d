/*include <config.scad>
include <inc/jhead.scad>
use <other/fan_head.scad>*/

r3 = 3.2/2;
nema17_r_vis = 15.5;
nema17_r_centre = 11.5;
nema17_h_centre = 2;
nema17_h = 43;
nema17_l = 40;

module nema17_2d(){
    nema17_l = 43;
    nema17_h = 6;
    polygon([[0,nema17_h], [nema17_h,0]
            , [nema17_l-nema17_h,0],[nema17_l,nema17_h]
            , [nema17_l,nema17_l-nema17_h],[nema17_l-nema17_h,nema17_l]
            , [8,nema17_l],[0,nema17_l-nema17_h] ]);
}

module nema17_2d2(){
    translate([nema17_r_vis, nema17_r_vis] ) circle(r3_2d);
    translate([nema17_r_vis, -nema17_r_vis] ) circle(r3_2d);
    translate([-nema17_r_vis, nema17_r_vis] ) circle(r3_2d);
    translate([-nema17_r_vis, -nema17_r_vis] ) circle(r3_2d);
    circle(nema17_r_centre);
}


module nema17(){
    translate([-nema17_h/2, -nema17_h/2, -nema17_l/2] ) linear_extrude(nema17_l) nema17_2d();
    
    h = nema17_h/2+6;
    translate([nema17_r_vis, nema17_r_vis, 0] )rotate([0, 0, 0]) cylinder(h, r = r3);
    translate([nema17_r_vis, -nema17_r_vis, 0] )rotate([0, 0, 0]) cylinder(h, r = r3);
    translate([-nema17_r_vis, nema17_r_vis, 0] )rotate([0, 0, 0]) cylinder(h, r = r3);
    translate([-nema17_r_vis, -nema17_r_vis, 0] )rotate([0, 0, 0]) cylinder(h, r = r3);
    cylinder(h, nema17_r_centre, nema17_r_centre);
    cylinder(h+14, r = 8);
    
    translate([-8.5, 0, -nema17_l/2] ) cube([17,30, 10]);
}


plateau_l = 200;

printer_l = 400;
printer_lg = 400;
printer_h = 500;

plateau_h = 300;
corexy_h = 350;
corexy_y = 200;
module barre2020(l, center = false){
    echo("2020", l);
    if(center){
        color("gray") translate([-l/2, 0, 0]) cube([l, 20, 20]);
    } else {
        color("gray") cube([l, 20, 20]);
    }
}

module barre2040(l, center = false){
    echo(l);
    if(center){
        color("gray") translate([-l/2, 0, 0]) cube([l, 20, 40]);
    } else {
        color("gray") cube([l, 20, 40]);
    }
}

//arriere
barre2020(printer_l-82, true);
for(i=[0,1]){
    mirror([i,0,0])translate([-printer_l/2+40, 0,0])rotate([0,-90,0])barre2040(printer_h);
}
translate([0, 0, printer_h-20]) barre2020(printer_l-82, true);

//plateau
translate([-printer_l/2+45, 0,plateau_h])barre2040(printer_l-90);
for(i=[0,1]){
    mirror([i,0,0])translate([-printer_l/2+80, 0,plateau_h]) rotate([0,0,90]) barre2040(printer_lg-40);
}

translate([-plateau_l/2,80,50+plateau_h]) cube([plateau_l,plateau_l,2]);

//bas
for(i=[0,1]){
    mirror([i,0,0])translate([-printer_l/2+20,21,0]) rotate([0,0,90]) barre2020(printer_lg-42);
}
translate([0,150,0]) barre2020(printer_l-42, true);

//haut
for(i=[0,1]){
    mirror([i,0,0])translate([-printer_l/2+20,21,printer_h-20]) rotate([0,0,90]) barre2020(printer_lg-42);
}

//devant
translate([0,printer_lg-20,0])barre2020(printer_l-82, true);
for(i=[0,1]){
    mirror([i,0,0])translate([-printer_l/2+40, printer_lg-20,0])rotate([0,-90,0])barre2040(printer_h);
}
translate([0, printer_lg-20, printer_h-20]) barre2020(printer_l-82, true);


//corexy
translate([-printer_l/2+45, corexy_y,corexy_h])barre2040(printer_l-90);
for(i=[0,1]){
    mirror([i,0,0])translate([-printer_l/2+20, 21,corexy_h]) rotate([0,0,90]) barre2040(printer_lg-42);
}

for(i=[0,1]){
    translate([0,0,corexy_h+20])rotate([0,i*180,0]) translate([-printer_l/2+35,  45, -40])nema17();

}
translate([-printer_l/2+50,  190, 22])nema17();

