use <../../config.scad>

$fs=$fs/2;
$fa=$fa/2;

/*translate([-20,0,0])cube([40,800,20]);



translate([-20,0,10]) rotate([0,90,0]) cylinder(r=10, 100);

translate([20,0,10]) rotate([0,90,0]) cylinder(r=20, 20);
rotate([-20,0,0]){
    translate([30,0,-10]) cube([10,300,40]);
    translate([30,-20,-10]) cube([10,40,100]);
}*/

module plaque(){
    difference(){
        translate([0,30,0])cube([60,150,3]);
        translate([30,150-30, -30]) cylinder(r=6, 80);
        translate([30,150-80, -30]) cylinder(r=4, 80);
        translate([50,150-80, -30]) cylinder(r=4, 80);
    }
}

module element(){
    difference(){
        union(){
            translate([-20,-400,0])cube([40,400,20]);
            translate([20,10,10]) rotate([0,-90,0]) cylinder(r=10, 40);
            
        }
        translate([21,10,10]) rotate([0,-90,0]) cylinder(r=6, 42);
        translate([0,-100, -30]) cylinder(r=6, 80);
        translate([21,-40,10]) rotate([0,-90,0]) cylinder(r=4, 42);
    }
}

module support(){
    union(){
        translate([-20,0,0])cube([40,400,20]);
        difference(){
            translate([-20,-200,-20])cube([40,400,20]);
            translate([0,-150, -30]) cylinder(r=6, 80);
        }
        translate([-20,-150,-20]) rotate([0,-90,0]) plaque();
        translate([23,-150,-20]) rotate([0,-90,0]) plaque();
        
    }
}

support();
translate([0,-40,0])element();