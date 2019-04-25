include <config.scad>
$fs=$fs/2;
$fa=$fa/2;

grille_reine_lg = 4;
grille_reine_l = 20;

e = 2;
grille_reine_lg2 = grille_reine_lg+e;
grille_reine_l2 = grille_reine_l+e;

module grille_reine(l,lg){
    difference(){
        I = round(l/2/grille_reine_lg2)-1;
        J = round(lg/2/grille_reine_l2)-1;
        square([l,lg], center = true);
        for(i=[-I : I]){
            for(j=[-J:J]){
                translate([i*grille_reine_lg2,j*grille_reine_l2]) 
                    square([grille_reine_lg,grille_reine_l], center = true);
            }
        }
    }
    
}



e = 2;
e2 = 2;

cone_frelon_r1 = 20;
cone_frelon_h = 40;
cone_frelon_r2 = 3;

r = cone_frelon_r1+5;
module grille_frelon(){
    difference(){
        union(){
            linear_extrude(e)grille_reine(180, 120);
            cylinder(r=r, e);
            cylinder(cone_frelon_h, cone_frelon_r1+e2, cone_frelon_r2+e2);
        }
        translate([0,0,-0.1])cylinder(cone_frelon_h+0.2, cone_frelon_r1, cone_frelon_r2);
    }
}


grille_frelon(300,100);
