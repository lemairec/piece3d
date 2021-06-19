include <config.scad>

tel_l = 148;
tel_lg = 80;
tel_e = 13;
tel_e2 = 11;
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

module support_pulve(h, e){
    l1 = 40;
    l2 = 30;
    r2 = 4;
    hull(){
        cylinder(h, r = l2/2 + e, center = true);
        translate([-l1/2+r2, 0,0]) cylinder(h, r = r2 + e, center = true);
        translate([l1/2-r2, 0,0]) cylinder(h, r = r2 + e, center = true);
        
    }
}


module support_same130(){
    difference(){
        union(){
            cube([l,2*e+2, lg], center = true);
            translate([x_support_tracteur, 0,0])support(lg, e);
            translate([x_support_pulve,0,0]) support_pulve(lg, e);
        }
        cube([400,2,400], center = true);
        for(i=t){
           translate([i,0,0]) rotate([90,0,0])cylinder(3*e, r = 4, center = true);
        }
        translate([x_support_tracteur, 0,0]) support(lg+1, 0);
        translate([x_support_pulve,0,0]) support_pulve(lg+1, 0);
    }
}


module support_tracteur(){
    tel_h = 140;
    h = 10;
    h2 = 70;
    y_support = 40;
    angle_tel = -6;
    e = 4;
     difference(){
        union(){
            hull(){
                translate([tel_lg/2,0,-1]) rotate([angle_tel,0,0]) cylinder(h+1, r = 9);
                translate([-tel_lg/2,0,-1]) rotate([angle_tel,0,0]) cylinder(h+1, r = 9);
                translate([-tel_lg/2,y_support,0]) cube([tel_lg, e + 2, h]);
            }
            translate([-tel_lg/2-2,-tel_e/2-2,4]) rotate([angle_tel,0,0]) cube([tel_lg+4, tel_e+4, h2]);
            //translate([x_support_tracteur, 0,0])support(lg, e);
            translate([0,y_support,h/2]) support_pulve(h, e);
        }
        mirror([0,1,0]) rotate([-angle_tel,0,0]) translate([0,-tel_e/2,3]) tel();
        
        translate([0,y_support,10]) support_pulve(h2+1, 0);
        translate([-100,y_support,-1]) cube([200, 2, 30]);
        translate([-100,-100,-10]) cube([200, 200, 10]);
        
        for(i=[-1,1]){
           translate([i*32,0,h/2]) rotate([-90,0,0])cylinder(100, r = 2);
           translate([i*32,25,h/2]) rotate([90,-90,0])support_nut(4);
            
        }
        
        %translate([0,y_support,tel_h/2]) support_pulve(tel_h, 0);
        
    }
    %mirror([0,1,0]) rotate([-angle_tel,0,0]) translate([0,-tel_e/2,3]) tel();
        
    
}



//full_support();
//support_voiture();

support_tracteur();