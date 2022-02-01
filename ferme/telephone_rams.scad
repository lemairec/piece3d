include <../config.scad>

tel_l = 170;
tel_lg = 82;
tel_e = 17;
tel_e2 = 5;
e = 2;

tel_ecran_lg = tel_lg-8;
tel_ecran_h = tel_l-5;

module tel(l = tel_l, ecran = true){
    translate([-tel_lg/2, 0,0])cube([tel_lg, tel_e, l]);
    
    if(ecran){
        translate([-tel_ecran_lg/2,tel_e2,10])cube([tel_ecran_lg, 20, tel_ecran_h]);
        translate([-15, 0, -5])cube([30, 30, 20]);
        //translate([-tel_lg/2-2*e,tel_e-tel_e2,68])cube([tel_ecran_lg, tel_e2, 40]);
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
    l = 34;
    l2 = 60;
    difference(){
        translate([0, 0, l2]) rotate([0,180,0])full_support();
        translate([-100, -100, -200]) cube([200,200,200]);
        translate([-10, 0, l2-10]) cube([20,20,20]);
    }
    for(i = [-1,1]){
        translate([i*20, -l, 0]) rotate([90, 0, 90])support_venti(5, l);
    }
    
    translate([-20, 13, 48]) cube([40,2,1]);
}







module support(h, e){
    r2 = 10;
    x = 36/2+e-r2;
    //rotate([-90,0,0]) cylinder(h, r = lg/2, center = true);
    rotate([0,0,angle_tracteur])hull(){
        translate([x,  x, 0]) cylinder(h, r = r2, center = true);
        translate([x,  -x, 0]) cylinder(h, r = r2, center = true);
        translate([-x,  x, 0]) cylinder(h, r = r2, center = true);
        translate([-x,  -x, 0]) cylinder(h, r = r2, center = true);
        %cylinder(r=36/2, h, center = true);
        
    }
}

module support_rams(){
    h2 = 90;
    h3 = 150;
    y_support = 40;
    e = 4;
    e2 = 8;
    de = 3;
     difference(){
         union(){
            translate([-tel_lg/2-de,0,0])cube([tel_lg+2*de, tel_e+10, h2]);
            hull(){
                translate([-tel_lg/2-de,0,0])cube([tel_lg+2*de,e2, h2]);
                translate([0,0,h3])rotate([-90,0,0])cylinder(r=5, e2);
            }

        }
        mirror([0,1,0]) translate([0,-e2,3]) rotate([0,0,180]) tel();
        
        translate([-100,y_support,-1]) cube([200, 2, 30]);
        translate([-100,-100,-10]) cube([200, 200, 10]);
        
        for(i=[-1,1]){
           translate([i*25,0,50]) rotate([90,0,0])cylinder(100, r = 2.5, center = true);
           translate([i*25,e2+1,50]) rotate([90,30,0]) nut(4,5);
           // %translate([i*25,e2+1,50]) rotate([90,30,0]) nut(4);
            
        }
        
        
        

        
    }
    //%mirror([0,1,0])translate([0,-6,3])  rotate([0,0,180]) tel();
        
    
}



//full_support();
//support_voiture();

support_rams();