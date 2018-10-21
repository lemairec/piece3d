$fs=$fs/4;
$fa=$fa/4;

l = 110;
lg = 80;
h = 12;

d=25;
d_e = 3;
d_e2 = 0;

r1 = 3;
e=3;

/*difference(){
    union(){
        hull(){
            translate([-l/2,  0, 0]) cylinder(r=r1, h=12);
            translate([-l/2,  lg, 0]) cylinder(r=r1, h=12);
            translate([ l/2,  0, 0]) cylinder(r=r1, h=12);
            translate([ l/2,  lg, 0]) cylinder(r=r1, h=12);
            
        }
        
        hull(){
            translate([-d/2-d_e,  -d/2, 0]) cube([d+d_e*2, d/2, h]);
            translate([0,  -d/2-d_e, 0]) cylinder(r=d/2+d_e, h);
        }
        translate([-d/2+d_e2,  -d*1-12, 0]) cube([d-d_e2*2, d, h]);
    }
    
    hull(){
        translate([-l/2+e,  e, e]) cylinder(r=r1, h=12);
        translate([-l/2+e,  lg-e, e]) cylinder(r=r1, h=12);
        translate([ l/2-e,  e, e]) cylinder(r=r1, h=12);
        translate([ l/2-e,  lg-e, e]) cylinder(r=r1, h=12);
    }
    for(i=[-4:4]){
        hull(){
            translate([i*12,  lg-10, -1]) cylinder(r=r1, h=12);
            translate([i*12,  10, -1]) cylinder(r=r1, h=12);
        
        }
    }
    
    translate([0,  -d/2-d_e, -1]) cylinder(r=d/2, h+2);
    %translate([0,  -d/2-d_e, -1]) cylinder(r=d/2, h+2);
    
    translate([0,  -d-d_e-4, h/2]) rotate([0,90,0]) cylinder(r=2, 40, center=true);
    translate([0,  -d-d_e-4, h/2]) rotate([0,90,0])%cylinder(r=2, 40, center=true);
    
    translate([-d/2+d_e2+d_e,  -d*1-13, -1]) cube([d-d_e2*2-2*d_e, d, h+2]);
}*/

/*offset(){
difference(){
    cylinder(r=12, 10);
    translate([0,0,1])cylinder(r=10, 10);
}
}*/

offset(2){
union(){
    square([10, 20]);
    %translate([0,0,1])cylinder(r=10, 10);
}
}