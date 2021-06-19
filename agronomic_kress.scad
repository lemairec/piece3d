use <config.scad>

module tube(){
    translate([-25,0,0])cube([50, 1000, 30]); 
}

module support_tube(){
    translate([-25,-30,0])cube([50, 5, 10]);
    translate([-25,30,0])cube([50, 5, 10]); 
    translate([-25,-30,5])cube([50, 60, 5]); 
    color("green")translate([-10,-25,0])cube([200, 50, 5]);
    translate([0,0,10])cylinder(7, r = 11, $fn = 6);;
    translate([0,0,10])cylinder(20, r = 6);;
    translate([0,0,30])cylinder(7, r = 11, $fn = 6);;
    
}


module tube2(){
    translate([-25,0,0])cube([50, 500, 30]);
    hull(){
        translate([-25,500,0])cube([50, 1, 30]);
        translate([-50-25,600,0])cube([50, 1, 30]);
    }
    translate([-50,700,30]) support_tube();
    translate([-50-25,600,0])cube([50, 200, 30]);
    hull(){
        translate([-50-25,800,0])cube([50, 1, 30]);
        translate([50-25,1000,0])cube([50, 1, 30]);
    
    }
    translate([50,1100,30]) rotate([0,0,180]) support_tube();
    translate([50-25,1000,0])cube([50, 200, 30]);
}

module tube3(){
    translate([-25,0,0])cube([50, 550, 30]);
    translate([-50,700,30]) support_tube();
    translate([-50-25,500,0])cube([50, 450, 30]);
    
    translate([50,1100,30]) rotate([0,0,180]) support_tube();
    translate([-25,850,0])cube([50, 100, 30]);
    translate([50-25,850,0])cube([50, 300, 30]);
}

tube2();