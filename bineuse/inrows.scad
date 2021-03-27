

module toto(){
    h = 20;
    difference(){
        union(){
            translate([-15, 0, 0]) cube([30, 16, h]);
            hull(){
                translate([-8, 0, 0]) cube([16, 3, h]);
                translate([0, 10, 0]) cylinder(r= 8, h);
            }
        }
        translate([0, 10, -1]) cylinder(r= 4.2, h+2);
        translate([-10, 10, h/2]) rotate([90,0,0]) cylinder(r= 2.2, 100, center = true);
        translate([ 10, 10, h/2]) rotate([90,0,0]) cylinder(r= 2.2, 100, center = true);
    }
    
}

toto();