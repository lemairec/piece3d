use <config.scad>
use <libs/gears.scad>

$fs=$fs/2;
$fa=$fa/2;

n=3;
d = 150;
d2 =152;


e = 3;


//5120
lg_int = 47;
lg_int2 = 13;
h_int = 5;
a = 30;
colonne_d=56;

//same
same = true;
//lg_int = 25;
//h_int = 6;


l = lg_int+10;
h2=h_int+5;

/**
 * IH
 **/

module couronne_ih(){
    difference(){
        
        union(){
            spur_gear (modul=2, tooth_number=92, width=5, bore=d, pressure_angle=20, helix_angle=0, optimized=true);
            
            for(i=[0:n]){
                rotate([0,0,i*360/n])hull(){
                    translate([-l/2,d2/2,0]) cylinder(r=6,1);
                    translate([ l/2,d2/2,0]) cylinder(r=6,1);
                    translate([-l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2]) cylinder(r=6,1);
                    translate([ l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2]) cylinder(r=6,1);
                }
            }
            
        }
        
        
        for(i=[0:n]){
            for(j= [0,1]){
                rotate([0,0,i*360/n])translate([0,d2/2,-1]) rotate([a,0,0]) mirror([j,0,0])translate([-lg_int/2,-10,h2+1.1-h_int]) cube([lg_int2, 20, h_int]);
            }
        
            for(j=[-1,1]){
                rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) rotate([a,0,0]) m4(200);
                rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) rotate([a,0,0]) m4_nut2(8);
            }
        }
        
        for(i=[120,240]){
            rotate([0,0,i])translate([0,d2/2,-1]) rotate([a,0,0]) m4(200);
            rotate([0,0,i])translate([0,d2/2,-1]) rotate([a,0,0]) m4_nut2(8);
        } 
        
        translate([0,0,-1]) cube([0.5,200,100]);
        for(i=[-5,5]){
            translate([i,d2/2,-1]) rotate([a,0,0]) m4(200);
            translate([i,d2/2,-1]) rotate([a,0,0]) m4_nut2(8);
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

/**
 * SAME
 **/

lg_same_int = 25;
h_same_int = 25;
l_same = lg_same_int+30;
module couronne_same(){
    lg_int = 25;
    h_int = 2;
    
    l = lg_int+30;
    h2=10;
    a=25;
    
    difference(){
        
        union(){
            spur_gear (modul=2, tooth_number=92, width=5, bore=d, pressure_angle=20, helix_angle=0, optimized=true);
            
            for(i=[0:n]){
                rotate([0,0,i*360/n])hull(){
                    translate([-l/2,d2/2,0]) cylinder(r=6,h2);
                    translate([ l/2,d2/2,0]) cylinder(r=6,h2);
                }
            }
            
        }
        
        
        for(i=[0:n]){
            rotate([0,0,i*360/n])translate([0,d2/2,-1]) rotate([a,0,0]) translate([-lg_int/2,-10,h2+1.1-h_int]) cube([lg_int, 20, 20]);
            
        
            for(j=[-1,1]){
                rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) m4(200);
            }
        }

        translate([0,-200,-1]) cube([0.5,200,100]);
        
        for(j=[-1,1]){
            translate([j*10,-d2/2-5,-1]) m4(200);;
        }
    }
}

module support_couronne_same(){
    difference(){
        union(){
            translate([-l_same/2-6,-6,0])cube([l_same+12, 12, e_support]);
        }
        translate([-l_same/2,0,-1])  m4(200);
        translate([ l_same/2,0,-1])  m4(200);
    }
}

module support_couronne_same2(){
    difference(){
        union(){
            translate([-l_same/2-6,-6,0])cube([l_same+12, 12, e_support]);
            translate([-lg_same_int/2-6,-6,0])cube([lg_same_int+12, 12, h_same_int+6]);
        }
        translate([-l_same/2,0,-1])  m4(200);
        translate([ l_same/2,0,-1])  m4(200);
        translate([-lg_same_int/2,-20,4]) rotate([-a,0,0])cube([lg_same_int, 100, h_same_int+1]);
    }
}



module couronne(mode2){
    if(same){
        if(mode2 == 0){
            couronne_same();
            for(i=[0:n]){
                rotate([0,0,i*360/n]) translate([0,d2/2,-1]) translate([0,0,h2+2]) support_couronne_same2();
            }
        } else if(mode2 == 1){
            couronne_same();
        } else if(mode2 == 2){
            translate([0, 00, 6]) rotate([90,0,0]) support_couronne_same2();
            translate([0, 40, 6]) rotate([90,0,0]) support_couronne_same2();
            translate([0, 80, 6]) rotate([90,0,0]) support_couronne_same2();
            translate([0, 90, 0]) support_couronne_same();
            
        }
    } else {
        if(mode2 == 1){
            couronne_ih();
            for(i=[0:n]){
                rotate([0,0,i*360/n]) translate([0,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2+2])          support_couronne_ih();
            }
        }
    }
    
}








pignon_r = 5.4/2;
module pignon(){
    difference(){
        union(){
            spur_gear (modul=2, tooth_number=20, width=10, bore=0, pressure_angle=20, helix_angle=0, optimized=true);
            cylinder(r= 15, 20);
        }
        cylinder(r=pignon_r, 30, $fn=16);
        
        translate([9,0,15])rotate([0,-90,0])m4_nut(10);
        translate([0,0,15])rotate([0,90,0])m4(20);
    }

}

support_l = 100;
module support_volant(){
    difference(){
        union(){
            translate([-support_l,0,0])cube([support_l,30,e]);
            
            translate([-support_l,30,0]) hull(){
                cube([1,1,e]);
                translate([100,0,0])cube([e,e,50]);
            }
            
            translate([0,0,0])cube([e,30,50]);
            
            translate([0,0,0])hull(){
                translate([5,5, 0])cylinder(r=5, 50);
                translate([0,25,0])cube([e,e,50]);
            }
        }
        translate([5,5, -1])m3(200);
        
        
        translate([-1,-1, 20])cube([150,12,22]);
        
        
    }
    
    translate([0,1, 20])cube([8,0.2,22]);
    translate([0,5, 20])cube([10,0.2,22]);
}

capteur1_h = 50;
capteur1_lg = 50;
module support_capteur1(){
    difference(){
        union(){
            translate([-capteur1_lg/2,-30,0])cube([capteur1_lg,80,e]);
            translate([-capteur1_lg/2,0,0])cube([capteur1_lg,e,capteur1_h]);
            
            for(i=[0,1]){
                mirror([i,0,0])translate([-capteur1_lg/2,0,0])hull(){
                    translate([0,-30,0]) cube([e,30,e]);
                    translate([0,0,0])cube([e,e,40]);
                }
            }
            
        }
        translate([-30/2,-15, -1])cylinder(r=2.2, 200);
        translate([ 30/2,-15, -1])cylinder(r=2.2, 200);
        
        translate([    0,-15, -1])cylinder(r=9, 200);
        
        
         for(i=[0,1]){
                mirror([i,0,0])translate([-22,-2, -1])cube([6,2,22]);
         }
        
        
    }
}

capteur2_lg = 30;
capteur2_h=40;
capteur2_l1 = 40;
capteur2_l2 = 20;

capteur2_e = 2;
module support_capteur2(){
    difference(){
        union(){
            translate([-capteur2_lg/2-e,0,0])cube([capteur2_lg+2*e,capteur2_l1,capteur2_h]);
            
            translate([-10,-capteur2_l2-e,0])cube([20,capteur2_l2+e,capteur2_h]);
        }
        translate([-capteur2_lg/2,e,-1])cube([capteur2_lg,capteur2_l1,capteur2_h+2]);
        
        
     for(i=[0,1]){
         for(j=[0,1]){
             translate([0,-capteur2_l2/2,capteur2_h/2])
                mirror([j,0,0]) mirror([0,0,i]) hull(){
                    translate([0,-capteur2_l2/2,-0.1])
                        cube([210, capteur2_l2, capteur2_e]); 
                    translate([0,-capteur2_l2/2,-0.1])rotate([0,-50,0])
                        cube([210, capteur2_l2, capteur2_e]);    
                    
                }
        }
     }
     
        
        
    }
    translate([-0.1,-capteur2_l2-e,0])cube([0.2,capteur2_l2+e,capteur2_h]);
     
}

x_vis = 80;
    
module support_colonne(){
    e = 40;
    r  = colonne_d/2+8;
    l = 100;
    lg= 60;
    
    difference(){
        union(){
            cylinder(r=r, e);
            translate([-l/2, -15, 0])cube([l, lg, e]);
        }
        translate([0, 0, -1]) cylinder(r=colonne_d/2, e+2);
        cube([150, 3, 150], center = true);
        
        for(i=[-1,1]){
            translate([i*x_vis/2, -20, e/2]) rotate([-90,0,0]) m8(100, false);
        }
        
    }
    
}



module moteur2(){
    translate([0,0,-70])cylinder(r=37/2, 70);
    for(i=[0, 60, 120, 180, 240, 300]){
         rotate([0,0,i]) translate([31/2, 0,0]) cylinder(r=3/2, 5);
    }
    translate([0, 7,0]) cylinder(r=13/2, 5);
    translate([0, 7,0]) cylinder(r=6/2, 10);
}

module support_moteur2(x_vis = 80){
    l = x_vis+20;
    lg = 44;
    h=100;
    
    difference(){
        
        union(){
            translate([-l/2,-lg/2,0]) cube([l, lg, 3]);
            translate([-l/2,-lg/2,-h]) cube([l, 3, h]);
            for(i=[0,1]){
                mirror([i,0, 0]) hull(){
                    translate([-27,-lg/2,0]) cube([3, lg, 3]);
                    translate([-27,-lg/2,-h]) cube([3, 3, h]);
                }
            }
        }
        
        
        for(i=[0,1]){
            mirror([i,0, 0]) translate([x_vis/2,0,-h+10]) hull(){
                rotate([90,0,0])cylinder(r=4, 100);
                translate([0,0,30])rotate([90,0,0])cylinder(r=4, 100);
            }
        }
        
        translate([0,0,-78]) hull(){
                rotate([90,0,0]) translate([-7,0,0])cylinder(r=3, 100);
                rotate([90,0,0]) translate([7,0,0])cylinder(r=3, 100);
            }
        rotate([0,0,180])moteur2();
    }
   
    
    %rotate([0,0,180])moteur2();
    
}

/**
SAME
**/

module support_colonne_same(){
    e = 30;
    lg_int = 95;
    l_int = 113;
    de=15;
    r  = 20;
    l = 160;
    lg= 60;
    x_vis2 = 140;
    
    difference(){
        union(){
            rotate([0,0,45])cube_arrondi(lg_int+de, l_int+de, e, r);
            cylinder(r=r, e);
            translate([-l/2, -lg/2, 0])cube([l, lg, e]);
            
            translate([-50, 0, 0])cube([100, 83,e]);
        }
        translate([0, 0, -1]) rotate([0,0,45])cube_arrondi(lg_int, l_int, e+3, r);
            
        rotate([0,0,180])translate([-l/2-2,-1,-1]) cube([l+4, 150, 150], center = false);
        
        for(i=[-1,1]){
            translate([i*x_vis2/2, -100, e/2]) rotate([-90,0,0]) m8(200, false);
        }
        
        for(i=[-1,1]){
            translate([i*x_vis/2,65, e/2]) rotate([-90,-90,0]) support_nut(8, 10, 100);
        }
    }
    
}

module support_moteur_same(){
    support_moteur2(80);
}

mode=0;

if(mode==0){
    couronne(mode);
    for(i=[0:n]){
        rotate([0,0,i*360/n]) translate([0,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2+2])          support_coronne();
    }
    translate([0,112,5]) rotate([-180,0,8]) pignon();
    
    translate([0,105,-25])support_moteur_same();
    
    translate([0,0,-100])support_colonne_same();
} else if(mode==1){
   couronne(mode);
} else if(mode==2){
   couronne(2);
} else if(mode==3){
   pignon();
} else if(mode==4){
   rotate([180,0, 0])support_moteur2();
} else if(mode==5){
    //support_volant();
    support_colonne_same();
    //moteur2();
} else if(mode==6){
   support_moteur_same();
} else if(mode==7){
   support_capteur2();
}


//


//support_moteur();





