use <config.scad>
use <libs/gears.scad>

n=3;
d = 150;
d2 =152;
a = 20;


e = 3;


//5120
lg_int = 46;
h_int = 4;
angle = 1;

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
            rotate([0,0,i*360/n])translate([j*l/2,d2/2,-1]) rotate([a,0,0]) m3_nut2(4);
            }
        }
        
        hull(){
            rotate([0,0,180-angle]) translate([0,0,-1]) cube([1,200,100]);
            rotate([0,0,180+angle]) translate([0,0,-1]) cube([1,200,100]);
        }
        
    }

   
}




module support_coronne(){
    difference(){
        hull(){
            translate([-l/2,0,0]) cylinder(r=5,e);
            translate([ l/2,0,0]) cylinder(r=5,e);
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

mode=6;

if(mode==0){
    couronne();
    for(i=[0:n]){
        rotate([0,0,i*360/n]) translate([0,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2+2])          support_coronne();
    }
    translate([120,0,0]) pignon();
} else if(mode==1){
   couronne();
} else if(mode==2){
   pignon();
} else if(mode==3){
   support_moteur();
} else if(mode==4){
   support_volant();
} else if(mode==5){
   support_capteur1();
} else if(mode==6){
   support_capteur2();
}


//


//support_moteur();





