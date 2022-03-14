use <../../config.scad>
use <../../libs/gears.scad>
use <gps_volant.scad>

$fs=$fs/2;
$fa=$fa/2;

n=3;
d = 150;
d2=130;
d3=144;

//74X58
e = 3;

modul = 3; tooth_number1 = 24; tooth_number2 = 60;
pressure_angle = 20;
helix_angle = 0;

//deutz
lg_int = 36;
lg_int2 = 13;
ang = 12; //8
h_int = 12; //18
d_couronne = 120;


l = lg_int+10;
h2=10;

r_vis = 4.3;

module m8(l, r){
    cylinder(r=r_vis, l);
}

module couronne_deutz(){
    d_int = d_couronne;
    l = lg_int+28;
    
    difference(){
        
        union(){
            spur_gear (modul=modul, tooth_number=tooth_number2, width=10, bore=d_int, pressure_angle=pressure_angle, helix_angle=-helix_angle, optimized=true);
            
            for(i=[0:n]){
                rotate([0,0,i*360/n])hull(){
                    translate([-l/2,d2/2,0]) cylinder(r=9,h2);
                    translate([ l/2,d2/2,0]) cylinder(r=9,h2);
                }
            }
            
            rotate([0,0,0.5*360])hull(){
                translate([-10,d3/2,0]) cylinder(r=9,h2);
                translate([ 10,d3/2,0]) cylinder(r=9,h2);
            }
            
        }
        
        
        for(i=[0:n]){
            //rotate([0,0,i*360/n]) translate([0,d_int/2,h2-h_int]) rotate([ang,0,0]) translate([-lg_int/2,-10,]) cube([lg_int, 100, 20]);
            
            translate([0,0,h_int])  rotate([0,0]) rotate([-90+ang,0,i*360/n]) cylinder(r=20, 200);
            
        
            for(j=[-1,1]){
                rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) m8(200);
            }
            
            rotate([0,0,0.5*360])translate([-25,d3/2,-1])m8(200);;
            rotate([0,0,0.5*360])translate([-10,d3/2,-1])m8(200);;
            rotate([0,0,0.5*360])translate([ 10,d3/2,-1]) m8(200);;
            rotate([0,0,0.5*360])translate([25,d3/2,-1])m8(200);;
            
        }

        translate([0,-200,-1]) cube([0.5,200,100]);
        
        
    }
}

e_support = 5;


/**
 * MK3
 **/

lg_mk3_int = 36; //24
h_mk3_int = 25; //25
l_mk3 = lg_mk3_int+30;
a_mk3 = 10;
l_support = lg_int+28;

x_vis_mk3 = 90;

module support_couronne_deutz(){
    a = 45;//45;//40; //35 //30
    h = 5;//9;//13; //18 //25
    difference(){
        union(){
            translate([-l_support/2-8,-8,0])cube([l_support+16, 16, e_support]);
            intersection(){
                translate([0,h+12,9]) rotate([-a+20,0,0])cube([lg_mk3_int+12, 100, h_mk3_int+12], center = true);
                translate([-l_support/2-6,-8,0])cube([l_support+12, 16, 70]);
            }
        }
        translate([-l_support/2,0,-1])  m8(200);
        translate([ l_support/2,0,-1])  m8(200);
        translate([0,h,3]) rotate([-a,0,0])cube([lg_mk3_int, 100, h_mk3_int], center = true);
        translate([0,0,3]) cube([lg_mk3_int, 100, h_mk3_int], center = true);
    }
}

module support_couronne_2(){
    difference(){
        hull(){    
            translate([-25,0,0])cylinder(r=8, e_support);
            translate([ 25,0,0])cylinder(r=8, e_support);
        }
        translate([-25,0,-1])  m8(200);
        translate([-10,0,-1])  m8(200);
        translate([10,0,-1])  m8(200);
        translate([25,0,-1])  m8(200);
    }
}

module support_colonne_deutz(support = true){
    e = 30;
    r1  = 56/2;
    r2  = 76/2;
    dr = r2-r1;
    l = 120;
    lg= 70;
    
    difference(){
        union(){
            translate([-l/2, -lg/2, 0])cube([l, lg, e]);
            if(support){
                translate([-10, -lg/2, 0])cube([20, 10, e+15]);
            }
        }
        hull(){
            translate([-dr, 0, -1])cylinder(r=r1, e+40);
            translate([dr, 0, -1])cylinder(r=r1, e+40);
            
        }
        translate([-75, -3, -75]) cube([150, 150, 150]);
        
        for(i=[-1,1]){
            translate([i*x_vis_mk3/2, -50, e/2]) rotate([-90,0,0]) m8(100, false);
        }
        
    }
}

mode=0;
if(mode==0){
    couronne_deutz();
    for(i=[0:n]){
                rotate([0,0,(i+0.5)*360/n]) translate([0,-d2/2,h2]) rotate([0,0,180])support_couronne_deutz();
            }
        rotate([0,0,360*3/6]) translate([0,d3/2,h2]) rotate([0,0,180])support_couronne_2();
    
    translate([0,125,5]) rotate([-180,0,8]) pignon2();
    
    
    
    translate([0,0,-160]) support_colonne_deutz();
    translate([0,0,-160]) rotate([0,0,180])support_colonne_deutz(false);

    translate([0,120,-25])rotate([-180,0,180]) support_moteur1();
    
} else if(mode==1){
   couronne_deutz();
} else if(mode==2){
   rotate([-90,0,0]) support_couronne_deutz();
}  else if(mode==3){
   support_couronne_2();
} else if(mode==4){
   pignon2();
} else if(mode==5){
   rotate([0,0, 0])support_moteur1();
} else if(mode==6){
   rotate([0,0, 0])support_moteur3_bis();
} else if(mode==7){
   rotate([90,0, 0])support_colonne_deutz();
} else if(mode==8){
   rotate([90,0, 0])support_colonne_deutz(false);
}

