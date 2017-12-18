include <config.scad>

$fn=100;
sphere_r=5;
e = 3;
vis_r = 4.1;
l= 40;
h = sphere_r+e;

sphere_r=30/2;
cylinder_r = 8;
e = 5;
l = 80;
h = sphere_r+e;


module male(){
    difference(){
        union(){
            hull(){
                translate([-20,0,0])cylinder(e, r=cylinder_r);
                translate([20,0,0])cylinder(e, r=cylinder_r);
            };
            cylinder(h+e, r=cylinder_r);
            translate([0,0,h+e])sphere(sphere_r);
        }
        translate([-20,0,-1])cylinder(e+2, r=vis_r);
        translate([20,0,-1])cylinder(e+2, r=vis_r);
    }
}

module toto(){
    hull(){
        cylinder(4*sphere_r, r=cylinder_r, center=true);
        translate([20,0,0])cylinder(4*sphere_r, r=cylinder_r, center=true);
    }
}

module female(){
    difference(){
        union(){
            hull(){
                translate([-l/2,0,0])sphere(r=sphere_r+e);
                translate([l/2,0,0])sphere(r=sphere_r+e);
            };
        }
        translate([l/2,0,-0.5])sphere(r=sphere_r);
        translate([-l/2,0,-0.5])sphere(r=sphere_r);
        translate([-2*l,-2*l,-4*l]) cube([4*l,4*l,4*l]);
        for(i=[0,1]){
            mirror([i,0,0]) translate([l/2+3*sphere_r/4,-l/2,-1]) cube([l,l,l]);
            //mirror([i,0,0]) translate([l/2,0,-1]) rotate([90,0,0]) toto();
            mirror([i,0,0]) translate([l/2,0,-1]) rotate([0,0,0]) toto();
        }
        translate([0,0,-1]) cylinder(100, r=vis_r);
    }
    for(i=[0,1]){
        //mirror([i,0,0]) translate([l/2+3*sphere_r/4-0.5,-(sphere_r+e),0]) cube([0.5, 2*(sphere_r+e), e]);
        //mirror([i,0,0]) translate([0,-(sphere_r+e/2),0]) cube([l/2+3*sphere_r/4,0.5, e]);
        //mirror([i,0,0]) translate([0,+(sphere_r+e/2),0]) cube([l/2+3*sphere_r/4,0.5, e]);
    }
}

translate([0, -2*sphere_r-3*e, 0]) male();
female();

translate([0, 2*sphere_r+3*e, 0]) female();
