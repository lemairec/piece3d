module sphere_cran(r, h , h2, nb_cran){
    angle = 360/nb_cran;
    for(i=[0:nb_cran]){
        rotate([0,0,i*angle])hull(){
            difference(){
                cylinder(r=r, h2);
                translate([-r,0,-1])cube([2*r,r,r]);
                rotate([0,0,180-angle]) translate([-r,0,-1])cube([2*r,r,r]);
            }
            translate([0,0,h]) rotate([0,90,-angle/2]) cylinder(r=0.1, h = r);
        } 
    }
}