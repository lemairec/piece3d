include <config.scad>

$fn=100;

r = 15;
r1 = 6;
r2 = r - 0.5;
h_plateau = 20;
h = 70;
h1 = h - h_plateau;

l = 398;
lg = 298;
e = 6; //2.74
cran = 25;

nb_cran = 1;



module plateau_cote_lg(l, lg, h, e){
    difference(){
        union(){
            square([lg, h]);
            hull(){
                translate([lg/3, h]) circle(r=r2);
                translate([2*lg/3, h]) circle(r=r2);
            }
        }
        
        translate([0, h_plateau])cran_x(l, e, cran, false);
        translate([-1, 0])cran_y(h, e + 1, cran, true);
        translate([lg-e, 0])cran_y(h, e + 1, cran, true);
        
        
        hull(){
            translate([lg/3, 0]) circle(r=r);
            translate([2*lg/3, 0]) circle(r=r);
        }
        hull(){
            translate([lg/3 + 15, h]) circle(r=r1);
            translate([2*lg/3 - 15, h]) circle(r=r1);
        }
        
    }
}

module plateau_cote_l(l, lg, h, e){
    difference(){
        union(){
            square([l, h]);
            hull(){
                translate([l/4, h]) circle(r=r2);
                translate([3*l/4, h]) circle(r=r2);
            }
        }
        
        translate([0, h_plateau])cran_x(l, e, cran, false);
        
        translate([-1, 0])cran_y(h, e + 1, cran, false);
        translate([l-e, 0])cran_y(h, e + 1, cran, false);
        translate([l/4, h_plateau])cran_y(h -h_plateau, e, cran, true);
        
        hull(){
            translate([l/4, 0]) circle(r=r);
            translate([3*l/4, 0]) circle(r=r);
        }
    }
}

module plateau(l, lg, h, e){
    difference(){
        square([l, lg]);
        
        translate([0, -1])cran_x(l, e + 1, cran, true);
        translate([0, lg - e])cran_x(l, e + 1, cran, true);
        
        translate([-1, 0])cran_y(lg, e , cran, true);
        translate([l-e, 0 ])cran_y(lg, e + 1, cran, true);
        
        //separation
        translate([l/4, 0])cran_y(l, e, cran, true);
        
        translate([0, lg/3])cran_x(l/4+e, e, cran, true);
        translate([0, 2*lg/3])cran_x(l/4+e, e, cran, true);
    }
}

module separation_lg(){
    difference(){
        square([lg, h - h_plateau]);
        
        translate([0, -1])cran_x(lg, e + 1, cran, false);
        translate([-1, 0])cran_y(h -h_plateau, e + 1, cran, false);
        translate([lg-e, 0])cran_y(h -h_plateau, e + 1, cran, false);
        
    }
}

module separation_lg2(){
    difference(){
        separation_lg();
        translate([lg/3, 0])cran_y(h -h_plateau, e, cran, true);
        translate([2*lg/3, 0])cran_y(h -h_plateau, e, cran, true);
    }
}

module separation_1(){
    difference(){
        square([l/4 + e, h - h_plateau]);
        translate([-1, 0])cran_y(h -h_plateau, e + 1, cran, false);
        translate([l/4, 0])cran_y(h -h_plateau, e + 1, cran, false);
        translate([0, -1])cran_x(l/4 + e, e + 1, cran, false);
    }
}



module plateau_cote_lg1(){
    difference(){
        plateau_cote_lg(l, lg, h, e);
        translate([lg/3, h_plateau])cran_y(h -h_plateau, e, cran, true);
        translate([2*lg/3, h_plateau])cran_y(h -h_plateau, e, cran, true);  
    }
}

if(true){
    e2 = 0.1;
    linear_extrude(e2) plateau(l, lg, h, e);
    translate([0,e,-h_plateau]) rotate([90, 0, 0]) linear_extrude(e2)plateau_cote_l(l, lg, h, e);
    translate([0,lg,-h_plateau]) rotate([90, 0, 0]) linear_extrude(e2)plateau_cote_l(l, lg, h, e);
    translate([0,0,-h_plateau]) rotate([90, 0, 90]) linear_extrude(e2) plateau_cote_lg1(l, lg, h, e);
    translate([l-e,0,-h_plateau]) rotate([90, 0, 90]) linear_extrude(e2) plateau_cote_lg(l, lg, h, e);
    
    //translate([l/2,0,0]) rotate([90, 0, 90]) separation_lg1(l, lg, h, e);
    translate([l/4,0,0]) rotate([90, 0, 90]) linear_extrude(e2) separation_lg2(l, lg, h, e);
    
    translate([0,lg/3 + e,0]) rotate([90, 0, 0]) linear_extrude(e2) separation_1(l, lg, h, e);
    translate([0,2*lg/3 + e,0]) rotate([90, 0, 0]) linear_extrude(e2) separation_1(l, lg, h, e);
    
} else {
    %square([609, 456]);
    de  = 0.4;

    plateau(l, lg, h, e);
    translate([0,lg + de,0]) plateau_cote_l(l, lg, h, e);
    translate([0,lg + h + 2*de,0]) plateau_cote_l(l, lg, h, e);
    translate([l + de, lg]) rotate([0,0, -90]) plateau_cote_lg1(l, lg, h, e);
    translate([l + h + 2*de, lg]) rotate([0,0, -90]) plateau_cote_lg(l, lg, h, e);
    translate([l + 2*h + 3*de + 15, lg]) rotate([0,0, -90]) separation_lg2(l, lg, h, e);
    //translate([l + 2*h + 3*e + 18 + h1, lg]) rotate([0,0, -90]) separation_lg1(l, lg, h, e);
    
    translate([l + de, lg + l/4 + 3*e]) rotate([0,0, -90]) separation_1(l, lg, h, e);
    translate([l + de + 1*(de + h1), lg + l/4 + 3*e]) rotate([0,0, -90]) separation_1(l, lg, h, e);
    //translate([l + de + 2*(de + h1), lg + l/4 + 2*de]) rotate([0,0, -90]) separation_1(l, lg, h, e);
}
