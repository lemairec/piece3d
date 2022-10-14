use <../../config.scad>

resolution = 4; $fs=$fs/resolution; $fa=$fa/resolution;

lg =28;
l=28;


module tige(){
    difference(){
        translate([-10, -10]) cube([20,185,10]);
        
        translate([0, 0, -1]) cylinder(r=3.2, 100, center = true);
        for(i=[1:4]){
            translate([0, 35+i*30, 0]) cylinder(r=5.5, 100, center = true);
            translate([0, 35+15+i*30, 0]) cylinder(r=2, 100, center = true);
        }
        translate([-1, -21,-1]) cube([2,20,12]);
        translate([0, -6, 5]) rotate([0,90,0]) cylinder(r=2, 100, center = true);
        
    }
    if(true){
        rotate([0,0,180])
        difference(){
            translate([-5, 2.5, 0]) cube([10,1,10]);;
            translate([-1, -1,-1]) cube([2,20,12]);
        }
    } else {
        translate([-5, 2.5, 0]) cube([10,1,10]);;
    }
        
                
}

module support(){
    difference(){
        union(){
            translate([-40, 0]) cube([80,25,20]);
            for(i=[0,1]){
                mirror([i,0,0])translate([15, 5, 20]) cube([20,15,20]);
            }
        }
        
        for(i=[0,1]){
            mirror([i,0,0])translate([25, 12.5, -1]) cylinder(r=2.2, 100, center = true);
        }
        for(i=[0,1]){
            translate([7,0]) mirror([i,0,0])translate([25, 10, 10]) rotate([90,0,0]) cylinder(r=4.5, 100, center = true);
        }
        
    }
                
}

module support_tme(){
    difference(){
        union(){
            translate([-40, 0]) cube([80,30,20]);
        }
        
        for(i=[0,1]){
            mirror([i,0,0])translate([16, 23, -1]) cylinder(r=2.2, 100, center = true);
        }
        for(i=[0,1]){
            mirror([i,0,0])translate([25, 10, 10]) rotate([90,0,0]) cylinder(r=4.5, 100, center = true);
        }
        
    }
                
}

mode=1;
if(mode==0){
   support();
} else {
   rotate([0,0,45])tige(); 
}

