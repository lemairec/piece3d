use <../config.scad>
use <../inc/rounded_box.scad>

l1 = 80;
l1_int = 74;



l = 164;
e = 2;

module big_casier(){
    difference(){
        myRoundedBox(l,l,l,3);
        translate([0,0,e])myRoundedBox(l-2*e,l-2*e,l,3);
    }
}

module little_casier(){
    difference(){
        myRoundedBox(l,l,l/2,3);
        translate([0,0,e])myRoundedBox(l-2*e,l-2*e,l,3);
    }
    
    for(i = [-4:4]){
        %translate([-l/2,i*20-e2/2,1])cube([l, e2, l/2]);
    }
}

//little_casier();

module schema(){
    
}

ebox = 3;
module box_1x1(){
    difference(){
        translate([-l1/2,0,0]) cube([l1,l1,l1]);
        translate([-l1/2+ebox,ebox,0.25]) cube([l1_int,l1_int,l1]);
    }
    //translate([-l1/2, l1/2-l1_int/2-0.25,0]) cube([l1,0.5,l1]);
    translate([-l1/2, l1/2-l1_int/4-0.25,0]) cube([l1,0.5,l1]);
    translate([-l1/2, l1/2-0.25,0]) cube([l1,0.5,l1]);
    translate([-l1/2, l1/2+l1_int/4-0.25,0]) cube([l1,0.5,l1]);
    //translate([-l1/2, l1/2+l1_int/2-0.25,0]) cube([l1,0.5,l1]);
    
}

module etiquette(l_etiquette = 15){
    e_etiquette = 0.25;
    h_etiquette = 10;
    hull(){
        translate([-l_etiquette/2,0,0]) cube([l_etiquette, e_etiquette,e_etiquette]);
        translate([-l_etiquette/2,-1.25,2]) cube([l_etiquette, 2,e_etiquette]);
        
        
    }
    translate([-l_etiquette/2,-1.25,2]) cube([l_etiquette, e_etiquette,3]);
    for(i=[0,1]){
        mirror([i,0,0]) translate([-l_etiquette/2,-1.25,2]) cube([3, e_etiquette,h_etiquette]);
        mirror([i,0,0]) translate([-l_etiquette/2,-1.25,2]) cube([e_etiquette, 3,h_etiquette]);
    }
}

module little_tirroir_1x1(){
    l1_tir = 70;
    h_tir = l1_tir/4;
    e_tir = 0.75;
    difference(){
        union(){
            translate([-l1_tir/2,0,0]) cube([l1_tir,l1_tir,15]);
            translate([-l1_tir/2-e,0,0]) cube([l1_tir+2*e,e,h_tir]);
        }
        translate([-l1_tir/2+e_tir,e,e_tir]) cube([l1_tir-2*e_tir,l1_tir-e_tir-e,h_tir]);
    }
    
    hull(){
        translate([-10,0,0]) cube([20, e,e]);
        translate([0,-5,0])cylinder(r=5, e);
    }
    
    l_eti=18;
    translate([l_eti/2,0,3]) etiquette(l_eti);
    translate([-l_eti/2,0,3]) etiquette(l_eti);
    translate([l_eti/2+l_eti,0,3]) etiquette(l_eti);
    translate([-l_eti/2-l_eti,0,3]) etiquette(l_eti);
    
    if(true){
        translate([l1_tir*(-0.5+0.25),0,0]) cube([e_tir,l1_tir,13]);
        translate([l1_tir*(-0.5+0.50),0,0]) cube([e_tir,l1_tir,13]);
        translate([l1_tir*(-0.5+0.75),0,0]) cube([e_tir,l1_tir,13]);
    }
    
    
}

mode=1;
if(mode==0){
    h = 4;
    translate([0,l1+10,00])rotate([90,0,0])box_1x1();
    translate([0,0,h])little_tirroir_1x1();
    translate([0,0,h+1*l1_int/4]) little_tirroir_1x1();
    translate([0,0,h+2*l1_int/4])little_tirroir_1x1();
    translate([0,0,h+3*l1_int/4])little_tirroir_1x1();
} else {
    box_1x1();
} 