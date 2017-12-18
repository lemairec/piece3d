include <config.scad>

$fn=100;
nbr_dent = 10;

rayon_tube_ext = 28/2;
rayon_tube_int = 10/2;

rayon_pouli_ext = 48/2;
rayon_pouli_int = 33/2;
rayon_pouli = 43/2;

hauteur = 78;

module pouli(){
    difference(){
        union(){
            cylinder(3, rayon_pouli, rayon_pouli);
            for (i = [1 : 1 : 10]){
                rotate([0,0, i*36 + 18]) translate ([rayon_pouli,0,0]) cylinder(3, 2, 2);
                
            }
                
        }
        for (i = [1 : 1 : 10]){
            hull(){
                    rotate([0,0, i*36]) translate ([rayon_pouli_int +4,0,-1]) cylinder(5, 4, 4);
                    rotate([0,0, i*36 - 12]) translate ([rayon_pouli_int+8,0,0]) cylinder(3, 1, 1);
                    rotate([0,0, i*36 + 12]) translate ([rayon_pouli_int+8,0,0]) cylinder(3, 1, 1);
                }
            
        }
    }
}

difference(){
    union(){
        translate([0,0, hauteur/2-1.5]) pouli();
        cylinder(hauteur, rayon_tube_ext, rayon_tube_ext);
    }
    translate([0,0, -5]) cylinder(50*2, rayon_tube_int, rayon_tube_int);
    translate([0,30, 27]) rotate([90, 0, 0]) m5(60);
    translate([0,30, 39*2-27]) rotate([90, 0, 0]) m5(60);
}

support_h = hauteur / 2 - 1.5;//37.5
support_r = rayon_pouli_ext + 3;

difference(){
    cylinder(support_h, support_r, support_r);
    //cube([100, 100, 100]);
    translate([0,0, 0]) cylinder(support_h - 2, support_r-0.6, support_r-0.6);
    translate([0,0,support_h - 2 - 0.3]) cylinder(2, support_r-0.3, support_r - 3);
    cylinder(support_h + 2, rayon_tube_int, rayon_tube_int);
}
//translate([4,-L/2, 0]) rotate([0, -90 + angle, 0]) cube([20, 20, 20]);
        