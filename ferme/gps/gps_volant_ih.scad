use <gps_volant.scad>
use <../../config.scad>
use <../../libs/gears.scad>

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
tracteur = 1;




l = lg_int+10;
h2=h_int+5;

r_vis = 4.2;

module m8(l, r){
    cylinder(r=r_vis, l);
}

module couronne1(d_int, ang, h_int){
    lg_int = 25;
    
    l = lg_int+30;
    h2=10;
    
    d2=140;
    d3 = 140;

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
            rotate([0,0,i*360/n]) translate([0,d_int/2,h2-h_int]) rotate([ang,0,0]) translate([-lg_int/2,-10,]) cube([lg_int, 100, 20]);
            
        
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

/**
 * IH
 **/

module couronne_ih(){
    difference(){
        
        union(){
            spur_gear (modul=modul, tooth_number=tooth_number2, width=10, bore=d_case, pressure_angle=pressure_angle, helix_angle=helix_angle, optimized=true);
            
            
            for(i=[0:n]){
                rotate([0,0,i*360/n])hull(){
                    translate([-l/2,d2/2,0]) cylinder(r=5,1);
                    translate([ l/2,d2/2,0]) cylinder(r=5,1);
                    translate([-l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2]) cylinder(r=6,1);
                    translate([ l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2]) cylinder(r=6,1);
                }
            }
            
        }
        
        
        for(i=[0:n]){
            for(j= [0,1]){
                rotate([0,0,i*360/n])translate([0,d2/2,-1]) rotate([a,0,0]) mirror([j,0,0])translate([-lg_int/2,-10,h2+1.1-h_int]) cube([lg_int2, 20, h_int]);
            }
            
            rotate([0,0,i*360/n])hull(){
                translate([-l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2+1]) cylinder(r=7,10);
                translate([ l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2+1]) cylinder(r=7,10);
            }
        
            for(j=[-1,1]){
                rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) rotate([a,0,0]) m3(200);
                rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) rotate([a,0,0]) m3_nut2(8);
            }
        }
        
        for(i=[120,240]){
            rotate([0,0,i])translate([0,d2/2,-1]) rotate([a,0,0]) m3(200);
            rotate([0,0,i])translate([0,d2/2,-1]) rotate([a,0,0]) m3_nut2(8);
        } 
        
        translate([0,0,-1]) cube([0.5,200,100]);
        for(i=[-5,5]){
            translate([i,d2/2,-1]) rotate([a,0,0]) m3(200);
            translate([i,d2/2,-1]) rotate([a,0,0]) m3_nut2(8);
        } 
        
    }
}

e_support = 5;
module support_couronne_ih(){
    difference(){
        union(){
            hull(){
                translate([-l/2,0,0]) cylinder(r=6,e_support);
                translate([ l/2,0,0]) cylinder(r=6,e_support);
            }
        }
        translate([-l/2,0,-1])  m4(200);
        translate([ 0,0,-1])  m4(200);
        translate([ l/2,0,-1])  m4(200);
    }
}

module support_couronne_ih2(){
    difference(){
        union(){
            hull(){
                translate([-l/2,0,0]) cylinder(r=6,e_support);
                translate([ l/2,0,0]) cylinder(r=6,e_support);
            }
        }
        translate([-l/2,0,-1])  m4(200);
        translate([ 5,0,-1])  m4(200);
        translate([ -5,0,-1])  m4(200);
        translate([ l/2,0,-1])  m4(200);
    }
}

x_vis_ih = 80;

module support_colonne_ih(){
    e = 40;
    l = 120;
    lg= colonne_d/2+8;
    
    difference(){
        translate([-l/2, -lg, 0])cube([l, lg, e]);
        translate([0, 0, -1]) cylinder(r=colonne_d/2, e+2);
        cube([150, 5, 150], center = true);
        
        for(i=[-1,1]){
            translate([i*x_vis_ih/2, -100   , e/2]) rotate([-90,0,0]) m8(200, false);
        }
        
    }
    
}

module support_colonne2_ih(){
    y_vix = 52;
    difference(){
        union(){
            translate([-60,0,0]) cube([120,30,30]);
            for(i=[0,1]){
                mirror([i,0,0])translate([-60,30,0]) cube([30,30,30]);
            }
        }   
        translate([x_vis_ih/2,100,15])  rotate([90,0,0]) m8(200, false);
        translate([-x_vis_ih/2,100,15]) rotate([90,0,0]) m8(200, false);
        
        translate([x_vis_2/2,y_vix,-1])   m8(200, false);
        translate([-x_vis_2/2,y_vix,-1])  m8(200, false);
    }
    
    %translate([x_vis_2/2,y_vix,-1])   m8(200, false);
    %translate([-x_vis_2/2,y_vix,-1])  m8(200, false);
}

x_vis_2 = 100;


mode=5;
if(mode==0){
    couronne(mode);
    
    translate([0,125,5]) rotate([-180,0,8]) pignon2();
    
    
    
    translate([0,0,-160]) support_colonne_ih();
    translate([0,75,-160]) support_colonne2_ih();

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
   rotate([0,0, 0])support_moteur3_bis();
} else if(mode==7){
    rotate([90,0, 0])support_colonne_ih();
} else if(mode==8){
   support_moteur_same();
} else if(mode==9){
   support_capteur2();
}


//

//moteur2();

//support_moteur();




