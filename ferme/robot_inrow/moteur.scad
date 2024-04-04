use <4040.scad>;


e = 5;
$fs=$fs/2;
$fa=$fa/2;



module support_moteur3d(){
    difference(){

        translate([-40,-30,0]) square([80,90]);

        
        for(i = [-1,1]){
            translate([i*20, 10]) circle(r=2.2);
            translate([i*20, 50]) circle(r=2.2);
        }
        translate([20, 30]) circle(r=5);
        
        translate([-25, -20])circle(r=4.2);
        translate([ 25, -20]) circle(r=4.2);
    }
}


module moteur3d(){
    translate([-30, -25,-25])cube([60,100,25]);
    for(i = [-1,1]){
        translate([i*20, 0]) cylinder(r=2.2,10);
        translate([i*20, 40]) cylinder(r=2.2,10);
    }
    translate([0, 0]) cylinder(r=5,10);
    translate([0, 50,-75]) cylinder(r=20,75);
    
    translate([0, 0,10])  cylinder(r=125, 50);
}



for(i=[0,1]){
    support_moteur3d();
}
