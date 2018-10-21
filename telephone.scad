include <config.scad>

tel_l = 141;
tel_lg = 74;
tel_e = 12;
tel_e2 = 8;
e = 2;

tel_ecran_lg = 65;
tel_ecran_h = 115;

module tel(l = tel_l, ecran = true){
    difference(){
        translate([-tel_lg/2, 0,0])cube([tel_lg, tel_e, l]);
        translate([-tel_lg/2+5, 0,-1])cylinder(r = (tel_e - tel_e2), l+2);
        translate([ tel_lg/2-5, 0,-1])cylinder(r = (tel_e - tel_e2), l+2);
    }
    if(ecran){
        translate([-tel_ecran_lg/2,tel_e2,10])cube([tel_ecran_lg, 20, tel_ecran_h]);
        translate([-10, 0, -5])cube([20, 20, 20]);
        translate([-tel_lg/2-2*e,tel_e-tel_e2,68])cube([tel_ecran_lg, tel_e2, 40]);
    }
}


module test(){
    difference(){
        translate([-tel_lg/2-2, -2,0])cube([tel_lg+4, tel_e+4, 10]);
        tel();
    }
}

module full_support(){
    difference(){
        translate([-tel_lg/2-e, -e,0])cube([tel_lg+2*e, tel_e+2*e, tel_l+2*e]);
        translate([0,0, e])tel(tel_l+2*e);
        
    }
}

module support_venti(lg, l){
    e1 = 2;
    e2 = 3;
    e3 = 2;
    l1 = 12;
    difference(){
        union(){
            cube([l1, e1 + e2 + e3, lg]);
            cube([l, e1, lg]);
        }
        translate([4, e1, -1])cube([l1-4-0.2, e2, lg + 2]);
    }
}

module support_voiture(){
    l = 37;
    l2 = 60;
    difference(){
        translate([0, 0, l2]) rotate([0,180,0])full_support();
        translate([-100, -100, -100]) cube([200,200,100]);
        translate([-10, 0, l2-10]) cube([20,20,20]);
    }
    for(i = [-1,1]){
        translate([i*20, -l, 0]) rotate([90, 0, 90])support_venti(5, l);
    }
}


full_support();