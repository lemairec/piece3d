$fn = 100;
d_int = 59;
e = 5;

cran_nb =8;
cran_r = 8;

h = 15;

difference(){
    union(){
        cylinder(h, r = d_int/2+e);
        for(i=[0:8]){
            rotate([0,0,i*360/cran_nb])translate([d_int/2+e-2, 0,0])cylinder(e, r = cran_r);
        }
    }
    translate([0, 0,e])cylinder(h, r = d_int/2);
    translate([0, 0,-1])cylinder(h, r = 0.6);
    for(i=[0:8]){
        rotate([0,0,i*360/cran_nb])translate([d_int/4, 0,-1])cylinder(h, r = 0.6);
    }
}
