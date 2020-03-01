include <config.scad>

use <libs/gears.scad>

$fs=$fs/2;
$fa=$fa/2;


//translate([0,51,0])spur_gear (modul=1, tooth_number=22, width=5, bore=4, pressure_angle=20, helix_angle=0, optimized=true);


module axe_nema(){
    difference(){
        cylinder(r=5/2, 100);
        translate([-5,2,-1])cube([10,10,110]);
    }
}


module pignon_volant(){
    h = 5;
    r = 55;
    r2 = 50;
    
    c_l = 10;
    c_lg = 7;
    c_r = 51;
    de = 0.3;
    difference(){
        union(){
            spur_gear (modul=1, tooth_number=122, width=h, bore=4, pressure_angle=20, helix_angle=0, optimized=true);
            cylinder(h, r=55);
        }
            
        translate([0,0,-1]) cylinder(10, r=r2);
        
        translate([0, -100 ,-1]) cube([200,200,100]);
        translate([-c_l-de, -c_r-c_lg-de,-de]) cube([c_l+2*de,c_lg+2*de,h/2+2*de]);
    }
    translate([0, c_r ,0]) cube([c_l,c_lg,h/2]);

}

module pignon_moteur(){
    h = 5;
    r = 25;
    r2 = 20;
    
    difference(){
        union(){
            spur_gear (modul=1, tooth_number=20, width=h, bore=1, pressure_angle=20, helix_angle=0, optimized=false);
        //    cylinder(h, r=r);
        }
        translate([0, 0 ,-1]) axe_nema();
    }
}

mode=0;

if(mode==0){
    pignon_volant();
    rotate([0,0,180]) pignon_volant();
}

pignon_volant();
translate([-50,0,0])pignon_volant();
translate([0,0,0])pignon_moteur();
//rotate([0,0,180])pignon_volant();