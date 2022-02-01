use <../inc/2020.scad>;

use <../inc/rounded_box.scad>
use <../config.scad>;
use <support_camera.scad>;

module inrow(){
    translate([0, 0, 20]) rotate([90,90,0]) barre2040(500, true);
    
}

h_l = 60;
h_lg = 60;
e=4;
module grand_charriot(vslot = true){
    l_charriot = 110;
    x_courroie = 50;
    difference(){
        union(){
            myRoundedBox(h_l+5+2*e, l_charriot, e+1, e+1);
            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*h_l/2, j*80/2, 0]) cylinder(r=6, e+8);
                }
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*80/2, -1]) cylinder(r=2.6, e+10);
            }
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*10, 7]) rotate([180,0,0]) m4(10,true);
                translate([i*h_l/2, j*30, 7]) rotate([180,0,0]) m4(10,true);
                translate([0, j*10, 7]) rotate([180,0,0]) m4(10,true);
                translate([0, j*30, 7]) rotate([180,0,0]) m4(10,true);
                
                translate([i*10, j*25, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*35, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*15, 6]) rotate([180,0,0]) m3(10,true);
                translate([i*10, j*5, 6]) rotate([180,0,0]) m3(10,true);
                
            }
        }
        
        for(i=[0,1]){
            mirror([0,i,0])translate([0, x_courroie, 7]) rotate([180,0,30]) m4(10,true);
            for(j=[0,1]){
                mirror([0,j,0]) mirror([i,0,0])translate([20, x_courroie, 7]) rotate([180,0,30]) m4(10,true);
                mirror([0,j,0]) mirror([i,0,0])translate([5, x_courroie-2, -1]) cube([10, 4, 40]);
            }
        }
    }
    
    if(vslot){

        for(i=[-1,1]){
            for(j=[-1,1]){
                color("red")translate([i*h_l/2, j*80/2, 18])     vslot2020();
            }
        }
          
    }

   
}

r_moteur2 = 46/2;
module moteur2(){
    translate([0,0,0])cylinder(r=r_moteur2, 130);
    //translate([0,0,80])cylinder(r=r_moteur+4, 40);
    for(i=[0, 90, 180, 270]){
         rotate([0,0,i]) translate([37.5/2, 0,-5]) cylinder(r=4.5/2, 10);
    }
    for(i=[0, 90, 180, 270]){
         translate([0, 0, 88]) rotate([90,0,i]) cylinder(r=12, 80 , center=true);
    }
    translate([0, 0,-5]) cylinder(r=27/2, 10);
    translate([0, 0,-40]) cylinder(r=6/2, 50);
    translate([-10, 0, 115]) cube([20, 80, 20]);
}

module support_moteur(){
    x = 20+23+1;
    difference(){
        hull(){
            translate([-20, -20, 0])cube([40,40,e]);
            translate([x, 0, 0])cylinder(r=46/2, e);
        }
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*10, j*10,-5]) cylinder(r=5.5/2, 10);
            }
        }
        translate([x, 0, e])moteur2();
        %translate([x, 0, e])moteur2();
    }
}

module corner(){
    x = 20+23+1;
    difference(){
        union(){
            cube([20,e,20]);
            cube([e,40,20]);
        }
        translate([10, 10, 10]) rotate([90,0,0]) cylinder(r=1.7, 80 , center=true);
        translate([10, 20, 10]) rotate([0,90,0]) cylinder(r=4.5, 80 , center=true);
    }
}

mode = 2;
if(mode == 0){
    translate([-18, 0, 20])rotate([0,90,0])grand_charriot();
    translate([-15, -150, 20])rotate([0,90,0])support_moteur();
    inrow();
} else if(mode == 1){
    support_moteur();
} else if(mode == 2){
    corner();
}

//

//