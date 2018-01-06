include <config.scad>
//$fs=$fs/2;
//$fa=$fa/2;

tiroir_l = 380;
tiroir_lg = 380;
tiroir_h = 90;
tiroir_h2 = 45;

$fn=100;

e = 3; //2.74
cran = 25;

tiroir_division_lg = [tiroir_lg/2];

tiroir_division_l1 = [120, tiroir_l-120-e];
tiroir_division_l1_lg = tiroir_lg/2+e;

tiroir_division_l2 = [tiroir_l/3+30];
tiroir_division_l2_lg = tiroir_lg - tiroir_division_l1_lg+e;

module fond_tiroir(){
    difference(){
        square([tiroir_l, tiroir_lg]);
        
        translate([0, -1])cran_x(tiroir_l, e + 1, cran, true);
        translate([0, tiroir_lg - e])cran_x(tiroir_l, e + 1, cran, true);
        
        translate([-1, 0])cran_y(tiroir_lg, e , cran, true);
        translate([tiroir_l-e, 0 ])cran_y(tiroir_lg, e + 1, cran, true);
        
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
        square([tiroir_lg, tiroir_h]);
        
        cran_x(tiroir_lg, e, cran, false);
        
        for(i = tiroir_division_lg){
            translate([i, 0])cran_y(tiroir_h, e + 1, cran, true);
        } 
        
        translate([-1, 0])cran_y(tiroir_h, e + 1, cran, true);
        translate([tiroir_lg-e, 0])cran_y(tiroir_h, e + 1, cran, true);
    }
}

module tiroir_l(){
    difference(){
        square([tiroir_l, tiroir_h]);
        
        cran_x(tiroir_l, e, cran, false);
        translate([-1, 0])cran_y(tiroir_h, e + 1, cran, false);
        translate([tiroir_l-e, 0])cran_y(tiroir_h, e + 1, cran, false);
    }
}

module tiroir_l_left(){
    difference(){
        tiroir_l();
        
        for(i = tiroir_division_l1){
            translate([i, 0])cran_y(tiroir_h2, e, cran, true);
        }
    }
}

module tiroir_l_right(){
    difference(){
        tiroir_l();
        
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


if(false){
    e2 = 1;
    translate([-tiroir_lg/2, -tiroir_l/2])union(){
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
} else {
    %square([456, 609]);
    de  = 0.4;

    fond_tiroir();
    translate([0,tiroir_lg + de,0]) tiroir_lg();
    translate([0,tiroir_lg + 2*de + tiroir_h,0]) tiroir_lg();
    translate([-456, 0]) tiroir_l_left();
    translate([-456, (tiroir_h+de)]) tiroir_l_right();
    translate([-456, 2*(tiroir_h+de)])tiroir_division_lg_();
    translate([-456, 3*(tiroir_h+de)])tiroir_division_l2();
    translate([-456, 4*(tiroir_h+de)])tiroir_division_l1();
    translate([-456, 5*(tiroir_h+de)])tiroir_division_l1();
}
