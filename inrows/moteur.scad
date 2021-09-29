use <4040.scad>;

e = 5;

module moteur(){
    union(){
        translate([-30,-30,0]) cube([90,60,e]);
        for(i = [-1,1]){
            translate([i*20, -20, 0]) cylinder(r=2.5,10);
            translate([i*20, 20, 0]) cylinder(r=2.5,10);
        }
        translate([-20, 0, 0]) cylinder(r=5,8);
        translate([-20, 0, 0]) cylinder(r=4,12);
        translate([40, 0, -50]) cylinder(r=20,50);
    }
}

x_moteur = -20;

x_truc = -70;
module support_moteur(){

    difference(){
        translate([-90,-60,0]) cube([120,90,e]);
    
    
        for(i = [-1,1]){
            translate([i*20, -20,-1]) cylinder(r=2.5,e+2);
            translate([i*20, 20,-1]) cylinder(r=2.5,e+2);
        }
        translate([x_moteur, 0,-1]) cylinder(r=5,e+2);
        translate([x_truc, 0,-1]) cylinder(r=5,e+2);
        
        translate([-65, -50,-1]) cylinder(r=4.5,e+2);
        translate([ 15, -50,-1]) cylinder(r=4.5,e+2);
    }
}

module support_bas(){

    difference(){
        translate([-90,-60,0]) cube([120,90,e]);
    
    
        translate([x_moteur, 0,-1]) cylinder(r=5,e+2);
        translate([x_truc, 0,-1]) cylinder(r=5,e+2);
        
        translate([-65, -50,-1]) cylinder(r=4.5,e+2);
        translate([ 15, -50,-1]) cylinder(r=4.5,e+2);
    }
}

translate([0,0,-20]) support_moteur();
translate([0,0,-25]) %moteur();
translate([0,0,20]) support_bas();
