use <4040.scad>;

e = 5;

difference(){

    union(){
        translate([-30,-30,0]) cube([60,90,e]);
        translate([-2,-30,0]) cube([4,90,2*e]);
    }
    
    for(i = [-1,1]){
        translate([i*20, 10,-1]) cylinder(r=2.5,e+2);
        translate([i*20, 50,-1]) cylinder(r=2.5,e+2);
    }
    translate([20, 30,-1]) cylinder(r=5,e+2);
    
    translate([-15, -20,-1]) cylinder(r=4.5,e+2);
    translate([ 15, -20,-1]) cylinder(r=4.5,e+2);
}