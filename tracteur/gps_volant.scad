use <../config.scad>
use <../libs/gears.scad>

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
tracteur = 2;




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
    r  = colonne_d/2+8;
    l = 120;
    lg= 60;
    
    difference(){
        union(){
            cylinder(r=r, e);
            translate([-l/2, -15, 0])cube([l, lg, e]);
        }
        translate([0, 0, -1]) cylinder(r=colonne_d/2, e+2);
        cube([150, 5, 150], center = true);
        
        for(i=[-1,1]){
            translate([i*x_vis_ih/2, -20, e/2]) rotate([-90,0,0]) m8(100, false);
        }
        
    }
    
}

module support_colonne2_ih(){
    
    difference(){
        union(){
            translate([-60,0,0]) cube([120,30,30]);
            for(i=[0,1]){
                mirror([i,0,0])translate([-60,30,0]) cube([30,30,30]);
            }
        }   
        translate([x_vis_ih/2,100,15])  rotate([90,0,0]) m8(200, false);
        translate([-x_vis_ih/2,100,15]) rotate([90,0,0]) m8(200, false);
        
        translate([x_vis_2/2,45,-1])   m8(200, false);
        translate([-x_vis_2/2,45,-1])  m8(200, false);
    }
}


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
 * MK3
 **/

lg_mk3_int = 24; //23
h_mk3_int = 26;
l_mk3 = lg_mk3_int+30;
a_mk3 = 10;

x_vis_mk3 = 90;
module couronne_mk3(){
    couronne1(d_same, a_mk3, 5);
}

module support_couronne_mk3(){
    difference(){
        union(){
            translate([-l_same/2-6,-8,0])cube([l_same+12, 16, e_support]);
            intersection(){
                translate([0,-25,6]) rotate([a_mk3,0,0])cube([lg_mk3_int+12, 100, h_mk3_int+12], center = true);
                translate([-l_same/2-6,-8,0])cube([l_same+12, 16, 70]);
            }
        }
        translate([-l_same/2,0,-1])  m8(200);
        translate([ l_same/2,0,-1])  m8(200);
        translate([0,-25,6]) rotate([a_mk3,0,0])cube([lg_mk3_int, 100, h_mk3_int], center = true);
    }
}

module support_colonne_mk3(){
    e = 30;
    r1  = 56/2;
    r2  = 76/2;
    dr = r2-r1;
    l = 120;
    lg= 70;
    
    difference(){
        union(){
            translate([-l/2, -lg/2, 0])cube([l, lg, e]);
        }
        hull(){
            translate([-dr, 0, -1])cylinder(r=r1, e+2);
            translate([dr, 0, -1])cylinder(r=r1, e+2);
            
        }
        cube([150, 5, 150], center = true);
        
        for(i=[-1,1]){
            translate([i*x_vis_mk3/2, -50, e/2]) rotate([-90,0,0]) m8(100, false);
        }
        
    }
}


    
/**
 * Common
 **/



module couronne(mode2){
    if(tracteur == 0){
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
            //translate([0, -10, 0]) support_couronne_same3();
            //translate([0, -30, 0]) support_couronne_same3();
        }
    } else if(tracteur == 1){
        if(mode2 == 0){
            couronne_ih();
            for(i=[0:n]){
                rotate([0,0,i*360/n]) translate([0,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2+2])          support_couronne_ih();
            }
        } else if(mode2 == 1){
            couronne_ih();
        } else {
            translate([0,0,0]) support_couronne_ih();
            translate([0,20,0]) support_couronne_ih();
            translate([0,40,0]) support_couronne_ih2();
        }
    } else if(tracteur == 2){
        if(mode2 == 0){
            couronne_mk3();
            for(i=[0:n]){
                rotate([0,0,(i+0.5)*360/n]) translate([0,-d2/2+6,-1]) translate([0,0,h2+1.5])  rotate([0,0,180])support_couronne_mk3();
            }
            rotate([0,0,360*3/6]) translate([0,d2/2,-1]) translate([0,0,h2+1.5])  rotate([0,0,180])support_couronne_mk3();
        } else if(mode2 == 1){
            couronne_mk3();
        } else if(mode2 == 2){
            translate([0, 00, 8]) rotate([-90,0,0]) support_couronne_mk3();
            translate([0, 45, 8]) rotate([-90,0,0]) support_couronne_mk3();
            translate([0, 90, 8]) rotate([-90,0,0]) support_couronne_mk3();
            //translate([0, -10, 0]) support_couronne_same3();
            //translate([0, -30, 0]) support_couronne_same3();
        }
    }
    
}

module support_colonne(mode2){
    if(tracteur == 0){
        support_colonne_same();
    } else if(tracteur == 1){
        support_colonne_ih();
    } else if(tracteur == 2){
        support_colonne_mk3();
    }
    
}

module support_colonne2(mode2){
    if(same){
        support_colonne2_same();
    } else {
        support_colonne2_ih();
    }
    
}



pignon_r = 6/2;
module pignon(){
    difference(){
        union(){
            spur_gear (modul=modul, tooth_number=tooth_number1, width=12, bore=2, pressure_angle=pressure_angle, helix_angle=helix_angle, optimized=true);
            cylinder(r= 18, 30);
            
        }
        cylinder(r=pignon_r, 35, $fn=16);
        
        //translate([7,0,20])rotate([0,-90,0])m3_nut(10);
        //translate([0,0,20])rotate([0,90,0])m3(20);
        
        for(i=[0,1]){
            mirror([i,0,0])translate([-8,0,21])rotate([0,-90,180])support_nut(8, 20, 2);
        }
    }

}

module pignon2(){
    difference(){
        spur_gear (modul=modul, tooth_number=tooth_number1, width=12, bore=2, pressure_angle=pressure_angle, helix_angle=helix_angle, optimized=false);
        translate([0,0,-1])cylinder(r=4.5, 35, $fn=16);
        translate([0,0,5])cylinder(r=58/2, 35);
        
        //translate([7,0,20])rotate([0,-90,0])m3_nut(10);
        //translate([0,0,20])rotate([0,90,0])m3(20);
        
        for(i=[0:6]){
            rotate([0,0,i*60]) translate([24,0,-1])cylinder(r=5/2, 35);;
        }
    }

}





r_moteur = 38/2;
module moteur(){
    translate([0,0,-90])cylinder(r=r_moteur, 90);
    for(i=[0, 60, 120, 180, 240, 300]){
         rotate([0,0,i]) translate([31/2, 0,0]) cylinder(r=3/2, 5);
    }
    
    translate([0, 7,0]) cylinder(r=13/2, 5);
    translate([0, 7,0]) cylinder(r=6/2, 10);
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
    translate([0, 0,-10]) cylinder(r=6/2, 20);
    translate([-10, 0, 115]) cube([20, 80, 20]);
}



r_support = 20;

module support_moteur3(x_vis = 80){
    l = x_vis+20;
    
    
    h=50;
    x_moteur = 6;
    
    difference(){
        
        hull(){
            translate([x_moteur,0,0]) cylinder(h,r=45/2);
            translate([-x_vis/2,0,0]) cylinder(h,r=r_support+3);
            translate([x_vis/2,0,0]) cylinder(h,r=12);
            translate([-x_vis/2-r_support/2,0,0]) cylinder(h,r=r_support+3);
        }
        
        
        translate([x_vis/2,0,-1]) m8(h+2);
        hull(){
            translate([-x_vis/2,0,3]) cylinder(h+2,r=r_support);
            translate([-x_vis/2-r_support/2,0,3]) cylinder(h,r=r_support);
        }
        hull(){
            translate([-x_vis/2,0,-1]) cylinder(h+2,r=r_support-2);
            translate([-x_vis/2-r_support/2,0,-1]) cylinder(h+2,r=r_support-2);
        }
            
        
        translate([0,0,-78]) hull(){
                rotate([90,0,0]) translate([-7,0,0])cylinder(r=3, 100);
                rotate([90,0,0]) translate([7,0,0])cylinder(r=3, 100);
            }
        
        translate([x_moteur,0,2]) cylinder(h+2,r=r_moteur);
            
        translate([x_moteur,0,2]) rotate([0,180,0])moteur2();
    }
   
    
    %translate([x_moteur,0,2]) rotate([0,180,0])moteur2();
    
    color("blue")translate([-x_vis/2,0,25]) rotate([0,180,0]) support_moteur3_bis();

}

module support_moteur3_bis(x_vis = 60){
    h1 = 20;
    h2 = h1+20;
    difference(){
        union(){
            cylinder(r = r_support-1,h1);
            cylinder(r = r_support-3,h2);
        }
        translate([r_support-8,0,-1]) m8(100);
        //%translate([0,0,h2-8]) rotate([90,0,0]) translate([0,0,-50])m8(100);
        translate([0,0,h2-8]) rotate([-90,-90,0]) support_nut(8, 100, 100);
        
    }
    
}

module support_moteur4(x_vis =100){
    a = 5;
    l = x_vis+20;
    lg = 10;
    
    
    h=90;
    x_moteur = 0;
    
    difference(){
        
        hull(){
            translate([x_moteur,0,0]) cylinder(h,r=45/2);
            translate([x_vis/2,0,0]) cylinder(h,r=12);
            for(i=[-a,a]){
                translate([x_vis/2-x_vis*cos(i*1),x_vis*sin(i*1),0]) cylinder(h,r=12);
            
            }
            //translate([-x_vis/2,lg,0]) cylinder(h,r=14);
            //translate([-x_vis/2,-lg,0]) cylinder(h,r=14);
            
        }
        
        
        for(i=[-a:a]){
            translate([x_vis/2-x_vis*cos(i*1),x_vis*sin(i*1),-1]) cylinder(h+2,r=4.2);
        
        }
        translate([x_vis/2,0,-1]) cylinder(h+2,r=4.2);
        //translate([-x_vis/2,21,9]) rotate([90,90,0])support_nut(8);
       
        
        translate([-x_vis/2+15,-0,15]) rotate([0,90,0])support_nut(8,30, 10);
        translate([-x_vis/2+15,-0,h-15]) rotate([0,-90,180])support_nut(8,30, 10);
            
        
        translate([0,0,-78]) hull(){
                rotate([90,0,0]) translate([-7,0,0])cylinder(r=3, 100);
                rotate([90,0,0]) translate([7,0,0])cylinder(r=3, 100);
            }
        
        
        translate([x_moteur,0,3]) cylinder(h+2,r=r_moteur);
        hull(){
            translate([x_moteur,0,45]) cube([45,200,2], center = true);
            translate([x_moteur,0,h]) cube([50,200,2], center = true);
        }
        translate([x_moteur,0,2]) rotate([0,180,0])moteur2();
    }
   
    
    %translate([x_moteur,0,3]) rotate([0,180,0])moteur2();
    %translate([x_vis/2-x_vis*cos(a),x_vis*sin(a),0]) cylinder(h,r=4);
    
}

module support_moteur5(x_vis = 100){
    l = x_vis+20;
    lg = 0;
    
    h=130;
    x_moteur = 0;
    
    difference(){
        
        hull(){
            translate([x_moteur,0,0]) cylinder(h,r=52/2);
            translate([x_vis/2,0,0]) cylinder(h,r=12);
            translate([-x_vis/2,0,0]) cylinder(h,r=14);
            translate([-x_vis/2,-lg,0]) cylinder(h,r=14);
            
        }
        
        
        translate([-x_vis/2,0,-1]) cylinder(h+2,r=5);
        translate([x_vis/2,0,-1]) cylinder(h+2,r=5);
        
        
        /*hull(){
            translate([x_moteur,0,45]) cube([45,200,2], center = true);
            translate([x_moteur,0,h]) cube([80,200,2], center = true);
        }¨*/
        translate([x_moteur,0,3]) rotate([0,0,135])moteur2();
        
        translate([35,0,70]) rotate([90,0,0]) cylinder(r=3, 100, center=true);
    }
   
    
    %translate([x_moteur,0,3 ]) rotate([0,0,135])moteur2();
    
    
}

module support_moteur6(x_vis = 100){
    l = x_vis+20;
    y_vis = -14;
    lg = 0;
    
    h=130;
    h2=80;
    x_moteur = 0;
    
    difference(){
        union(){
            hull(){
                cylinder(h2,r=52/2);
                translate([x_vis/2,y_vis,0]) cylinder(h2,r=12);
                translate([-x_vis/2,y_vis,0]) cylinder(h2,r=12);
                
            }
            cylinder(h,r=52/2);
        }
            
        
        
        translate([-x_vis/2,y_vis,-1]) cylinder(h+2,r=5);
        translate([x_vis/2,y_vis,-1]) cylinder(h+2,r=5);
        
        
        /*hull(){
            translate([x_moteur,0,45]) cube([45,200,2], center = true);
            translate([x_moteur,0,h]) cube([80,200,2], center = true);
        }¨*/
        translate([x_moteur,0,3]) rotate([0,0,135])moteur2();
        
        translate([35,0,h2/2]) rotate([90,0,0]) cylinder(r=3, 100, center=true);
    }
   
    
    %translate([x_moteur,0,3 ]) rotate([0,0,135])moteur2();
    
    
}


module support_moteur_same(){
   
   
    support_moteur3(80);
}


mode=5;
if(mode==0){
    couronne(mode);
    
    translate([0,112,5]) rotate([-180,0,8]) pignon();
    
    
    
    translate([0,0,-160]) support_colonne(mode);
    translate([0,60,-160]) support_colonne2();

    translate([0,120,-25])rotate([-180,0,180]) support_moteur6();
    
} else if(mode==1){
   couronne(mode);
} else if(mode==2){
   couronne(2);
} else if(mode==3){
   pignon2();
} else if(mode==4){
   rotate([180,0, 0])support_moteur6();
} else if(mode==5){
    support_colonne();
} else if(mode==6){
   support_moteur_same();
} else if(mode==7){
   support_capteur2();
}


//

//moteur2();

//support_moteur();





