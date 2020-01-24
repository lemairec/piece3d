$fs=$fs/4;
$fa=$fa/4;
include <config.scad> 

card_l = 90;
card_lg = 60;
h=20;
e= 1.5;
e_h=1.5;

module support_2_card(){
    l = card_l+2*e;
    lg = 2*card_lg+3*e;
    difference(){
        cube_arrondi(l, lg, h+e_h, 4);
        
        for(i=[-1,1]){
            translate([0,i*(card_lg+e)/2,0]) union(){
                translate([0,0,e_h])cube_arrondi(card_l, card_lg,h+1);
                hull(){
                    translate([0,0,e_h+0.1])cube([card_l+h+e_h, card_lg-30,0.1], center = true);
                    translate([0,0,23])cube([card_l+h+e_h, card_lg-10,0.1], center = true);
                }
                for(j=[-1,1]){
                translate([j*card_l/2,0,-1])cube_arrondi(10,card_lg-30, 4);
                }    
            }
        }
    }
    
}


module support_2_up(){
    
    l = card_l+2*e+2*e+0.5;
    lg = 2*card_lg+3*e+2*e+0.5;
    difference(){
        cube_arrondi(l, lg, h+e_h, 4);
        
        translate([0,0,e_h]) cube_arrondi(l-2*e, lg-2*e, h+e_h, 2);
        hull(){
            translate([0,0,e_h+0.1])cube([card_l-30, lg+10,0.1], center = true);
            translate([0,0,23])cube([card_l-10, lg+10,0.1], center = true);
        }
    }
    
}

mode = 2;
if(mode == 0){
    translate([0,0,h+e_h+2])  rotate([0,180,0])support_2_up();
    support_2_card();
} else if(mode == 1){
    support_2_card();
} else {
    support_2_up();
}

