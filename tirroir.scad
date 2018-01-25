include <config.scad>
//$fs=$fs/2;
//$fa=$fa/2;

tiroir_l = 380;
tiroir_lg = 380;
tiroir_h = 90;
tiroir_h2 = 50;

$fn=100;

e = 3; //2.74
cran = 25;

tiroir_division_lg = [tiroir_lg/2];

tiroir_division_l1 = [120, tiroir_l-120-e];
tiroir_division_l1_lg = tiroir_lg/2+e;

tiroir_division_l2 = [tiroir_l/3+30];
tiroir_division_l2_lg = tiroir_lg - tiroir_division_l1_lg+e;


plateau_l = tiroir_l-110;
plateau_lg = tiroir_lg/2-3*e;
plateau_h = 40;

module fond(l, lg){
    difference(){
        square([l, lg]);
        
        translate([0, -1])cran_x(l, e + 1, cran, true);
        translate([0, lg - e])cran_x(l, e + 1, cran, true);
        
        translate([-1, 0])cran_y(lg, e , cran, true);
        translate([l-e, 0 ])cran_y(lg, e + 1, cran, true);
    }
}

module longueur(l, h){
    difference(){
        square([l, h]);
        
        cran_x(l, e, cran, false);
        translate([-1, 0])cran_y(h, e + 1, cran, false);
        translate([l-e, 0])cran_y(h, e + 1, cran, false);
    }
}

module largeur(lg, h){
    difference(){
        square([lg, h]);
        
        cran_x(lg, e, cran, false);      
        translate([-1, 0])cran_y(h, e + 1, cran, true);
        translate([lg-e, 0])cran_y(h, e + 1, cran, true);

    }
}

module plateau(l,lg,h, expand, de){
    if(expand){
        linear_extrude(de) fond(l,lg);
        
        translate([0,0,0]) rotate([90, 0, 90]) linear_extrude(de) largeur(lg,h);
        translate([l-e,0,0]) rotate([90, 0, 90]) linear_extrude(de) largeur(lg,h);
        translate([0,e,0]) rotate([90, 0, 0]) linear_extrude(de) longueur(l,h);
        translate([0,lg,0]) rotate([90, 0, 0]) linear_extrude(de) longueur(l,h);
    } else {
        translate([0, 0]) fond(l,lg);
        translate([0, lg + de + 0*(h+de)]) longueur(l,h);
        translate([0, lg + de + 1*(h+de)]) longueur(l,h);
        translate([0, lg + de + 2*(h+de)]) largeur(lg,h);
        translate([0, lg + de + 3*(h+de)]) largeur(lg,h);
    }
}


module fond_tiroir(){
    difference(){
        fond(tiroir_l, tiroir_lg);
        
        //separation
        for(i = tiroir_division_lg){
            translate([0, i])cran_x(tiroir_l, e, cran, true);
        }
        
        for(i = tiroir_division_l1){
            translate([i, 0])cran_y(tiroir_division_l1_lg, e, cran, true);
        }
        for(i = tiroir_division_l2){
            translate([i, tiroir_lg+e-tiroir_division_l2_lg-e])cran_y(tiroir_division_l2_lg, e, cran, true);
        }
    }
}

module tiroir_lg(){
    difference(){
        largeur(tiroir_lg, tiroir_h);
        
        for(i = tiroir_division_lg){
            translate([i, 0])cran_y(tiroir_h, e, cran, true);
        } 
     }
}


module tiroir_l_left(){
    difference(){
        longueur(tiroir_l, tiroir_h);
        
        for(i = tiroir_division_l1){
            translate([i, 0])cran_y(tiroir_h2, e, cran, true);
        }
        
        hull(){
            translate([tiroir_l/2-70, tiroir_h]) circle(20);
            translate([tiroir_l/2+70, tiroir_h]) circle(20);
        }
    }
}

module tiroir_l_right(){
    difference(){
        longueur(tiroir_l, tiroir_h);
        
        for(i = tiroir_division_l2){
            translate([i, 0])cran_y(tiroir_h, e, cran, true);
        }
    }
}


module tiroir_division_lg_(){
    difference(){
        square([tiroir_l, tiroir_h]);
        
        translate([0, -1])cran_x(tiroir_l, e + 1, cran, false);
        translate([-1, 0])cran_y(tiroir_h, e + 1, cran, false);
        translate([tiroir_l-e, 0])cran_y(tiroir_h, e + 1, cran, false);
        
        for(i = tiroir_division_l1){
            translate([i, 0])cran_y(tiroir_h2, e, cran, true);
        }
        for(i = tiroir_division_l2){
            translate([i, 0])cran_y(tiroir_h, e, cran, true);
        }
    }
}

module tiroir_division_l1(){
    difference(){
        square([tiroir_division_l1_lg, tiroir_h2]);
        
         translate([0, -1])cran_x(tiroir_division_l1_lg, e + 1, cran, false);
        translate([-1, 0])cran_y(tiroir_h2, e + 1, cran, false);
        translate([tiroir_division_l1_lg-e, 0])cran_y(tiroir_h2, e + 1, cran, false);
    }
}

module tiroir_division_l2(){
    difference(){
        square([tiroir_division_l2_lg, tiroir_h]);
        
        translate([0, -1])cran_x(tiroir_division_l2_lg, e + 1, cran, false);
        translate([-1, 0])cran_y(tiroir_h, e + 1, cran, false);
        translate([tiroir_division_l2_lg-e, 0])cran_y(tiroir_h, e + 1, cran, false);
    }
}

module plateau_fond(){
    difference(){
        square([plateau_l, plateau_lg]);
        
        translate([0, -1])cran_x(plateau_l, e + 1, cran, true);
        translate([0, plateau_lg - e])cran_x(plateau_l, e + 1, cran, true);
        
        translate([-1, 0])cran_y(plateau_lg, e , cran, true);
        translate([plateau_l-e, 0 ])cran_y(plateau_lg, e + 1, cran, true);
    }
}

module plateau_lg(){
    difference(){
        square([plateau_lg, plateau_h]);
        
        cran_x(plateau_lg, e, cran, false);
        translate([-1, 0])cran_y(plateau_h, e + 1, cran, true);
        translate([plateau_lg-e, 0])cran_y(plateau_h, e + 1, cran, true);
    }
}

module plateau_l(){
    difference(){
        square([plateau_l, plateau_h]);
        
        cran_x(plateau_l, e, cran, false);
        translate([-1, 0])cran_y(plateau_h, e + 1, cran, false);
        translate([plateau_l-e, 0])cran_y(plateau_h, e + 1, cran, false);
    }
}

if(true){
    e2 = e;
    translate([-tiroir_l/2, -tiroir_lg/2])union(){
        linear_extrude(e2) fond_tiroir();
        translate([0,0,0]) rotate([90, 0, 90]) linear_extrude(e2) tiroir_lg();
        translate([tiroir_l-e,0,0]) rotate([90, 0, 90]) linear_extrude(e2) tiroir_lg();
        translate([0,e,0]) rotate([90, 0, 0]) linear_extrude(e2)tiroir_l_left();
        translate([0,tiroir_lg,0]) rotate([90, 0, 0]) linear_extrude(e2)tiroir_l_right();
        
        for(i = tiroir_division_lg){
            translate([0, i+e])rotate([90, 0, 0]) linear_extrude(e2) tiroir_division_lg_();
        }
        for(i = tiroir_division_l1){
            translate([i,0]) rotate([90, 0, 90]) linear_extrude(e2)tiroir_division_l1();
        }
        for(i = tiroir_division_l2){
            translate([i, tiroir_lg+e-tiroir_division_l2_lg-e]) rotate([90, 0, 90]) linear_extrude(e2)tiroir_division_l2();
        }
        
        
    }
    
    translate([-tiroir_l/2 +1.5*e, -tiroir_lg/2 +1.5*e,tiroir_h2]) union(){ 
        plateau(plateau_l, plateau_lg, plateau_h, true, e2);
        
        
        
    }
       
} else {
    de=1;
    %square([456, 609]);
    
    fond_tiroir();
    translate([0,tiroir_lg + de,0]) tiroir_lg();
    translate([0,tiroir_lg + 2*de + tiroir_h,0]) tiroir_lg();
    translate([-456, 0]) tiroir_l_left();
    translate([-456, (tiroir_h+de)]) tiroir_l_right();
    translate([-456, 2*(tiroir_h+de)])tiroir_division_lg_();
    translate([-456, 3*(tiroir_h+de)])tiroir_division_l2();
    translate([-456, 4*(tiroir_h+de)])tiroir_division_l1();
    translate([-456, 5*(tiroir_h+de)])tiroir_division_l1();
    translate([456, 0]) plateau(plateau_l, plateau_lg, plateau_h, false, de);
}
