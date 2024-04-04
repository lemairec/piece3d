use <4040.scad>;

e = 5;


module support_angle(){
    h_sup =32+e;
    difference(){
        union(){
            hull(){
                translate([-15, 0,0]) cylinder(r=4,e);
                translate([+15, 0,0]) cylinder(r=4,e);
                translate([0, 0,0]) cylinder(r=22.5/2,e);
            
            }
            translate([-15, 0,0]) cylinder(r=4,h_sup);
            translate([+15, 0,0]) cylinder(r=4,h_sup);
        }
        translate([-15, 0,-1]) cylinder(r=1.7,h_sup+5);
        translate([+15, 0,-1]) cylinder(r=1.7,h_sup+5);
        translate([0, 0,-1]) cylinder(r=4,10);
    }
}


module new_support_angle(){
    h_sup =35;
    l = 42;
    difference(){
        union(){
            hull(){
                translate([-l/2, 0,0]) cylinder(r=4,e);
                translate([+l/2, 0,0]) cylinder(r=4,e);
                translate([0, 0,0]) cylinder(r=22.5/2,e);
                rotate([0,0,30])translate([-15, 0,0]) cylinder(r=4,e);
                rotate([0,0,30])translate([15, 0,0]) cylinder(r=4,e);
            
            }
            translate([-l/2, 0,0]) cylinder(r=5,h_sup);
            translate([+l/2, 0,0]) cylinder(r=5,h_sup);
        }
        translate([-l/2, 0,-1]) cylinder(r=2.5,h_sup+5);
        translate([+l/2, 0,-1]) cylinder(r=2.5,h_sup+5);
        rotate([0,0,30])translate([-15, 0,-1]) cylinder(r=1.7,h_sup+5);
        rotate([0,0,30])translate([15, 0,-1]) cylinder(r=1.7,h_sup+5);
        translate([0, 0,-1]) cylinder(r=4,10);
    }
}



new_support_angle();

