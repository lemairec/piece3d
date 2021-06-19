use <config.scad>
use <telephone.scad>

lg = 20;
e = 8;

l = 180;

t = [-l/2+10, 0, l/2-10];
angle_tracteur = -15;
x_support_tracteur = 40;
x_support_pulve = -40;



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


module support_tel_same130(){
    tel_l = 74;
    tel_h = 140;
    tel_e = 12;
    tel_e2 = 8;
    h = 10;
    h2 = 50;
    y_support = 35;
    angle_tel = -5;
    e = 4;
     difference(){
        union(){
            hull(){
                translate([tel_l/2,0,-1]) rotate([angle_tel,0,0]) cylinder(h+1, r = 8);
                translate([-tel_l/2,0,-1]) rotate([angle_tel,0,0]) cylinder(h+1, r = 8);
                translate([-tel_l/2,y_support,0]) cube([tel_l, e + 2, h]);
            }
            translate([-tel_l/2-2,-tel_e/2-2,4]) rotate([angle_tel,0,0]) cube([tel_l+4, tel_e+4, h2]);
            //translate([x_support_tracteur, 0,0])support(lg, e);
            translate([0,y_support,h/2]) support_pulve(h, e);
        }
        translate([0,tel_e/2,1]) rotate([angle_tel,0,0]) mirror([0,1,0])tel();
   
        translate([0,y_support,10]) support_pulve(h2+1, 0);
        translate([-100,y_support,-1]) cube([200, 2, 30]);
        translate([-100,-100,-10]) cube([200, 200, 10]);
        
        for(i=[-1,1]){
           translate([i*32,0,h/2]) rotate([-90,0,0])cylinder(100, r = 2);
           translate([i*32,25,h/2]) rotate([90,-90,0])support_nut(4);
            
        }
        
        %translate([-tel_l/2,-tel_e/2,2]) rotate([angle_tel,0,0]) cube([tel_l, tel_e, tel_h]);
        %translate([0,y_support,tel_h/2]) support_pulve(tel_h, 0);
        
    }
    
}



support_tel_same130();
