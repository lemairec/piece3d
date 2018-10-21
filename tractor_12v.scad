use <config.scad>
use <telephone.scad>

lg = 20;
e = 8;

l = 180;

t = [-l/2+10, 0, l/2-10];
angle_tracteur = -15;
x_support_tracteur = 40;
x_support_pulve = -40;

module support_pulve(h, e){
    l1 = 42;
    r1 = 32/2;
    r2 = 12/2;
    hull(){
        cylinder(h, r = r1 + e, center = true);
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
    tel_l = 70;
    h = 15;
    h2 = 50;
    y_support = 100;
    e = 4;
    h_12v = 35;
    h_12v_lg = 45;
    difference(){
        union(){
            translate([-tel_l/2,0,0]) cube([tel_l, y_support+e, h]);
            
            hull(){
                translate([0,0,h_12v]) rotate([-90,0,0])cylinder(10, r = 27/2+5);
                for(i=[-1,1]){
                    translate([i*h_12v_lg/2, 0,h_12v]) rotate([-90,0,0])cylinder(10, r = 8);
                }
                translate([-tel_l/2,0,0]) cube([tel_l, 10, h]);
            
            }
            //translate([-tel_l/2,0,0]) cube([tel_l, 10, h+39]);
            translate([0,y_support,h/2]) support_pulve(h, e);
        }
        
        translate([0,y_support,10]) support_pulve(h2+1, 0);
        translate([0,y_support,0]) cube([100,1, 100], center =true);
        
        for(i=[-1,1]){
           %translate([i*28,y_support,h/2]) rotate([-90,0,0])cylinder(100, r = 2, center=true);
           translate([i*28,y_support-15,h/2]) rotate([90,-90,0])support_nut(4);
        }
        
        
        translate([0,0,h_12v]) rotate([90,-90,0])cylinder(100, r = 27/2, center=true);
        for(i=[-1,1]){
            translate([i*h_12v_lg/2, 0,h_12v]) rotate([90,-90,0])cylinder(100, r = 5/2, center=true);
        }
             
        %translate([0,y_support,0]) support_pulve(60, 0);
        
    }
    
}



support_tel_same130();
