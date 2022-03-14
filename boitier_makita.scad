$fs=$fs/2;
$fa=$fa/2;

include <config.scad>


l = 120;
lg= 150;
e = 2;
h = 42;


module boitier_sup(){
    difference(){
        cube_arrondi(l, lg, e);
        for(i = [-1,1]){
            for(j = [-1,1]){
                translate([i*(l/2-5), j*(lg/2-5), -1]) cylinder(r=2.2, 10);
            }
        }
        
    }
}

module boitier_inf(){
    difference(){
        union(){
            difference(){
                cube_arrondi(l, lg, h);
                translate([0,0, e])cube_arrondi(l-2*e, lg-2*e, h);
                
            }
            for(i = [-1,1]){
                for(j = [-1,1]){
                    translate([i*(l/2-5), j*(lg/2-5), 0]) cylinder(r=5, h);
                }
            }
        }
        for(i = [-1,1]){
            for(j = [-1,1]){
                translate([i*(l/2-5), j*(lg/2-5), -1]) cylinder(r=2.2, h+2);
            }
        }
        translate([0,0, h-12])cube([100, 22, 12]);
    }
}

boitier_inf();

