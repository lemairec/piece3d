use <../../config.scad>
use <../../libs/gears.scad>
use <gps_volant.scad>

$fs=$fs/2;
$fa=$fa/2;

n=3;
d = 150;
d2 =152;


e = 3;


//modul = 2; tooth_number1 = 20; tooth_number2 = 92;
//modul = 2.5; tooth_number1 = 20; tooth_number2 = 72;
modul = 3; tooth_number1 = 24; tooth_number2 = 60; //old 60

pressure_angle = 20;
//pressure_angle = 20;
helix_angle = 0;

//5120
lg_int = 47;
lg_int2 = 13;
h_int = 5;
a = 30;
colonne_d=56;
d_case = 145;

//same
//0 same
//1 5120
//2 mk3
tracteur = 0;




l = lg_int+10;
h2=h_int+5;

r_vis = 4.2;
e_support = 5;


/**
 * SAME
 **/

lg_same_int = 25;
h_same_int = 30;
l_same = lg_same_int+30;
d_same = 120;
same_ang = 25;

module couronne_same(){
    couronne1(d_same, 25, 8);
}

module support_couronne_same(){
    difference(){
        union(){
            translate([-l_same/2-6,-6,0])cube([l_same+12, 12, e_support]);
        }
        translate([-l_same/2,0,-1])  m8(200);
        translate([ l_same/2,0,-1])  m8(200);
    }
}

module support_couronne_same2(){
    difference(){
        union(){
            translate([-l_same/2-6,-8,0])cube([l_same+12, 16, e_support]);
            hull(){
                translate([-lg_same_int/2-6,-8,0])cube([lg_same_int+12, 2, h_same_int+3]);
                translate([-lg_same_int/2-6,6,0])cube([lg_same_int+12, 2, h_same_int+3+16*sin(a)]);
            }
        }
        translate([-l_same/2,0,-1])  m8(200);
        translate([ l_same/2,0,-1])  m8(200);
        translate([0,-12,6]) rotate([a,0,0])cube([lg_same_int, 100, h_same_int+1], center = true);
    }
}

module support_couronne_same3(){
    l_support = 50;
    difference(){
        union(){
            hull(){
                translate([-l_support/2,0,0]) cylinder(r=8,e_support);
                translate([ l_support/2,0,0]) cylinder(r=8,e_support);
            }
        }
        translate([-l_support/2,0,-1])  m8(200);
        translate([-10,0,-1])  m8(200);
        translate([ 10,0,-1])  m8(200);
        translate([ l_support/2,0,-1])  m8(200);
    }
}


x_vis_same = 140;
x_vis_2 = 100;

module support_colonne_same2(){
    e = 20;
    lg_int = 95;
    l_int = 113;
    de=20;
    r  = 20;
    l = 160;
    lg= 70;
    x_vis2 = 140;
    a = -50;//-55
    
    difference(){
        union(){
            translate([-l/2, 5, 0])cube([l, lg, e]);
            
        }
        translate([0, 0, -1]) rotate([0,0,a])cube_arrondi(lg_int, l_int, e+3, r);
            
        for(i=[-1,1]){
            translate([i*x_vis2/2, -100, e/2]) rotate([-90,0,0]) cylinder(200, r=4.5);
        }
        
        cube([l+4, 12, 150], center = true);
    }
}

module support_colonne_same(){
    support_colonne_same2();
    rotate([0,0,180])support_colonne_same2();
}

module support_colonne_same3(){
    rotate([-90,0,0])support_colonne_same2();
}



    
/**
 * Common
 **/



module couronne(mode2){
    if(mode2 == 0){
        couronne_same();
        for(i=[0:n]){
            rotate([0,0,(i+0.5)*360/n]) translate([0,-d2/2+6,-1]) translate([0,0,h2+1.5])  rotate([0,0,180])support_couronne_same2();
        }
        rotate([0,0,360*3/6]) translate([0,d2/2,-1]) translate([0,0,h2+1.5])  rotate([0,0,180])support_couronne_same3();
    } else if(mode2 == 1){
        couronne_same();
    } else if(mode2 == 2){
        translate([0, 00, 8]) rotate([-90,0,0]) support_couronne_same2();
        translate([0, 45, 8]) rotate([-90,0,0]) support_couronne_same2();
        translate([0, 90, 8]) rotate([-90,0,0]) support_couronne_same2();
    }
}

mode=6;
if(mode==0){
    couronne(mode);
    
    translate([0,125,5]) rotate([-180,0,8]) pignon2();
    
    
    
    translate([0,0,-160]) support_colonne_same2();
    translate([0,0,-160]) rotate([0,0,180]) support_colonne_same2();
    translate([0,75,-160]) support_colonne2();

    translate([0,120,-25])rotate([-180,0,180]) support_moteur1();
    
} else if(mode==1){
   couronne(mode);
} else if(mode==2){
   couronne(2);
}  else if(mode==3){
   couronne(3);
} else if(mode==4){
   pignon2();
} else if(mode==5){
   rotate([0,0, 0])support_moteur1();
} else if(mode==6){
   rotate([0,0, 0]) rotate([-90,0,0])support_colonne_same2();
}
