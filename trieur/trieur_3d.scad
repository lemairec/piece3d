include <../config.scad>

$fs=$fs/4;
$fa=$fa/4;

e  = 6;

trieur_l = 180;
trieur_lg = 100;

angle1 = 40;
angle2 = 7;
h=-10;

module trieur_old(){
    l = -trieur_l/2-5;
    lg = -trieur_lg/2-5;
    difference(){
        hull(){
            translate([l, lg])cylinder(r=5,10);
            translate([l, -lg])cylinder(r=5,10);
            translate([-l, lg])cylinder(r=5,10);
            translate([-l, -lg])cylinder(r=5,10);
        }
        rotate([0,-4,0]) translate([-80,0,-3]) hull(){
             for(i=[0,1]){
                  mirror([0,i,0])rotate([20,0,0])cube([300,0.1,40]);
             }
         }
    }
    
}


module part(){
    rotate([0,angle2,0]) translate([-90,0,h]) hull(){
         for(i=[0,1]){
              mirror([0,i,0])rotate([angle1,0,0])cube([300,0.1,40]);
         }
     }
}

module base_trieur(h=4){
    l = trieur_l/2-5;
    lg = trieur_lg/2-5-15;
    difference(){
        hull(){
            translate([l, lg])cylinder(r=5,h);
            translate([l, -lg])cylinder(r=5,h);
            translate([-l, lg])cylinder(r=5,h);
            translate([-l, -lg])cylinder(r=5,h);
        }
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*l, j*lg, -1])cylinder(r=1.6,h+2);
            }
        }
    }
    
}

module trieur(){
    difference(){
        union(){
            hull(){
                intersection(){
                    part();
                    translate([-trieur_l/2, -trieur_l/2]) cube([trieur_l,trieur_l,100]);
                }
                translate([-trieur_l/2, -trieur_lg/4]) cube([trieur_l,trieur_lg/2,1]);
            }
            base_trieur();
        }
        translate([3, 0, 3])  part();
    }
}
module dessous(){
    lg = trieur_lg-30;
    e =3;
    difference(){
        union(){
            base_trieur(e);
            
            for(i = [-trieur_l/2+10,-trieur_l/4, 0, trieur_l/4]){
                translate([i-e/2,-lg/2,0])cube([e,lg,20]);
            }
            translate([-trieur_l/2+10,-lg/2,0])cube([trieur_l-40,e,20]);
        }
    }
}

module pied(){
    pied_e = 1;
    pied_h = 10;
    pied_lg = 10;
    pied_de = 5;
    difference(){
        union(){
            translate([-pied_lg/2,-5,0]) cube([pied_lg,10, pied_lg]);
            translate([-pied_lg/2,50-7,0]) cube([pied_lg,10, pied_lg]);
            for(i=[0:9]){
                translate([0,i*pied_de]) hull(){
                    translate([-pied_lg/2,0,0]) cylinder(r=pied_e, pied_h);
                    translate([pied_lg/2,pied_de,0]) cylinder(r=pied_e, pied_h);
                }
                translate([0,i*pied_de]) hull(){
                    translate([-pied_lg/2,pied_de,0]) cylinder(r=pied_e, pied_h);
                    translate([pied_lg/2,0,0]) cylinder(r=pied_e, pied_h);
                }
            }
        }
        translate([0,0,5]) rotate([0,-90,90]) m3_nut(10,10,10);
        translate([0,0,5]) rotate([0,-90,90]) cylinder(1000,r=3.2/2, center= true);
        translate([0,50,5]) rotate([0,-90,90]) m3_nut(10,10,10);
    }
    
    
}

dessous();
//pied();


