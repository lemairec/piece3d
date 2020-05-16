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
h_int = 6;
a = 25;
colonne_d=56;

//same
if(false){
    lg_int = 25;
    h_int = 30;
}

l = lg_int+10;
h2=h_int+5;



module couronne(){
    difference(){
        
        union(){
            spur_gear (modul=2, tooth_number=92, width=5, bore=d, pressure_angle=20, helix_angle=0, optimized=true);
            
            for(i=[0:n]){
                rotate([0,0,i*360/n])hull(){
                    translate([-l/2,d2/2,0]) cylinder(r=5,1);
                    translate([ l/2,d2/2,0]) cylinder(r=5,1);
                    translate([-l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2]) cylinder(r=5,1);
                    translate([ l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2]) cylinder(r=5,1);
                }
            }
            
        }
        
        
        for(i=[0:n]){
            
            rotate([0,0,i*360/n])translate([0,d2/2,-1]) rotate([a,0,0]) translate([-lg_int/2,-10,h2+1.1-h_int]) cube([lg_int, 20, h_int]);
        
            for(j=[-1,1]){
            rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) rotate([a,0,0]) m3(200);
            rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) rotate([a,0,0]) m3_nut2(8);
            }
        }
        
        rotate([0.1,0,119.5]) translate([0,0,-1]) cube([0.5,200,100]);
        
        
    }

   
}




module support_coronne(){
    difference(){
        union(){
            hull(){
                translate([-l/2,0,0]) cylinder(r=5,e);
                translate([ l/2,0,0]) cylinder(r=5,e);
            }
            for(i =[0,1]){
                mirror([i,0,0])translate([-2*l/6,-5,0]) cube([4,10,e+2]);
            }
        }
        translate([-l/2,0,-1]) cylinder(r=2,10);
        translate([ l/2,0,-1]) cylinder(r=2,10);
    }
}

pignon_r = 5.4/2;
module pignon(){
    difference(){
        union(){
            spur_gear (modul=2, tooth_number=20, width=10, bore=0, pressure_angle=20, helix_angle=0, optimized=true);
            cylinder(r= 11, 20);
        }
        cylinder(r=pignon_r, 30, $fn=16);
        
        translate([8,0,15])rotate([0,-90,0])m3_nut(10);
        translate([12,0,15])rotate([0,-90,0])m3(12);
    }

}

module support_moteur(){
    difference(){
        union(){
            translate([-25,0,0])cube([50,45,40]);
            translate([-20,0,20])hull(){
                translate([0,-6, 0])cylinder(r=5, 20);
                translate([-5,0,0])cube([20,1,20]);
            }
        }
        translate([0,22+e,20+e]) rotate([0,180,0]) nema17();
        translate([-20,-6, -1])cylinder(r=2.2, 200);
        
        translate([-50,120, 70]) rotate([45+90,0,0])cube([100,100,100]);
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
    e = 30;
    r  = colonne_d/2+5;
    l = 100;
    lg= 50;
    
    difference(){
        union(){
            cylinder(r=r, e);
            translate([-l/2, -10, 0])cube([l, lg, e]);
        }
        translate([0, 0, -1]) cylinder(r=colonne_d/2, e+2);
        cube([100, 1, 100], center = true);
        
        for(i=[-1,1]){
            translate([i*x_vis/2, -15, e/2]) rotate([-90,0,0]) m8(100, true);
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

module support_moteur2(){
    l = 100;
    lg = 44;
    h=100;
    
    difference(){
        
        union(){
            translate([-l/2,-lg/2,0]) cube([l, lg, 3]);
            translate([-l/2,-lg/2,-h]) cube([l, 3, h]);
            for(i=[0,1]){
                mirror([i,0, 0]) hull(){
                    translate([-l/2,-lg/2,0]) cube([3, lg, 3]);
                    translate([-l/2,-lg/2,-h]) cube([3, 3, h]);
                }
            }
        }
        
        
        for(i=[0,1]){
            mirror([i,0, 0]) translate([x_vis/2,0,-h+10]) hull(){
                rotate([90,0,0])cylinder(r=4, 100);
                translate([0,0,30])rotate([90,0,0])cylinder(r=4, 100);
            }
        }
        rotate([0,0,180])moteur2();
    }
   
    
    %rotate([0,0,180])moteur2();
    
}

mode=3;




if(mode==0){
    couronne();
    for(i=[0:n]){
        rotate([0,0,i*360/n]) translate([0,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2+2])          support_coronne();
    }
    translate([0,112,5]) rotate([-180,0,8]) pignon();
    
    translate([0,105,-25])support_moteur2();
    
    translate([0,0,-100])support_colonne();
} else if(mode==1){
   couronne();
} else if(mode==2){
   support_coronne();
} else if(mode==3){
   pignon();
} else if(mode==4){
   rotate([180,0, 0])support_moteur2();
} else if(mode==5){
    //support_volant();
    support_colonne();
    //moteur2();
} else if(mode==6){
   support_capteur1();
} else if(mode==7){
   support_capteur2();
}


//


//support_moteur();





