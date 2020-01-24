include <config.scad>

lg=20;
l = 80;
h=10;

de = 10;
e = 2;

module ble(){
    difference(){ 
        translate([-0, l/2-e]) cube_arrondi(lg, l, h, 3);
        translate([0,l/2,h]) rotate([0,45,0]) cube([h, l, h], center =true);
        for(i=[0:10]){
            translate([0,i*10,h]) rotate([0,45,0]) cube([h+1, 0.5, h+1], center =true);
        }
    }
}

lde = 0.3;
h2=6;
h21=4;
h22=1;
module ble2(){
    difference(){ 
        cube_arrondi(25,105,h2, 3);
        //translate([-10, -l/2, h21]) cube([20,l,5]);;
        
        for(i=[0:4]){
            translate([-10,i*10,h22]) cube([20,10,h2]);
            translate([-11,(i)*10-lde/2,h22]) cube([22,lde,h2]);
            translate([-11,(-1-i)*10-lde/2,h22]) cube([22,lde,h2]);
            
            translate([-10,(-1-i)*10,h22]) cube([20,10,h2]);
            
        }
    }
}

ble2();