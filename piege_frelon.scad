include <config.scad>
$fs=$fs/2;
$fa=$fa/2;


r = 50;
e = 2;

frelon_e = 3;

bouchon_h = 10;
bouchon_frelon_r1 = 30;
bouchon_frelon_r2 = 5;
bouchon_frelon_h = 40;

pot_r = r+e;
pot_h = 100;
pot_h1 = 40;
pot_h2 = 20;

pot_trou_ep = 3;
pot_trou_nb = 40;

pot_trou_nb2 = 10;

module bouchon(){
    difference(){
        union(){
            difference(){
                cylinder(r=pot_r+e, bouchon_h);
                translate([0,0,e])cylinder(r=pot_r, bouchon_h);
            }
            cylinder(bouchon_frelon_h, bouchon_frelon_r1+e, bouchon_frelon_r2+e);
        }
        translate([0,0,-0.1])cylinder(bouchon_frelon_h+0.2, bouchon_frelon_r1, bouchon_frelon_r2);
        for(i=[0:pot_trou_nb]){
            rotate([0,0,(i+0.5)*360/pot_trou_nb])
            translate([-3*r/4,0,-1])
                cylinder(r=frelon_e/2, 10);
        }
        for(i=[0:pot_trou_nb]){
            rotate([0,0,(i+0.5)*360/pot_trou_nb])
            translate([-3.5*r/4,0,-1])
                cylinder(r=frelon_e/2, 10);
        }
        
        translate([0,0,bouchon_frelon_h/2+15]) for(i=[0:pot_trou_nb2]){
            rotate([0,90,(i)*360/pot_trou_nb2])
            
                cylinder(r=frelon_e/2, r);
        }
        
        translate([0,0,bouchon_frelon_h/2+10]) for(i=[0:pot_trou_nb2]){
            rotate([0,90,(i+0.5)*360/pot_trou_nb2])
            
                cylinder(r=frelon_e/2, r);
        }
        
        translate([0,0,bouchon_frelon_h/2+5]) for(i=[0:pot_trou_nb/2]){
            rotate([0,90,(i)*720/pot_trou_nb])
            
                cylinder(r=frelon_e/2, r);
        }
        
        translate([0,0,bouchon_frelon_h/2]) for(i=[0:pot_trou_nb/2]){
            rotate([0,90,(i+0.5)*720/pot_trou_nb]) cylinder(r=frelon_e/2, r);
        }
        
        translate([0,0,bouchon_frelon_h/2-5]) for(i=[0:pot_trou_nb/2]){
            rotate([0,90,(i)*720/pot_trou_nb])
            
                cylinder(r=frelon_e/2, r);
        }
        
        translate([0,0,bouchon_frelon_h/2-10]) for(i=[0:pot_trou_nb/2]){
            rotate([0,90,(i+0.5)*720/pot_trou_nb])
            
                cylinder(r=frelon_e/2, r);
        }
        
        translate([0,0,bouchon_frelon_h/2-15]) for(i=[0:pot_trou_nb/2]){
            rotate([0,90,(i)*720/pot_trou_nb])
            
                cylinder(r=frelon_e/2, r);
        }
        
        
    }
}



module pot(){
    difference(){
        cylinder(r=r+e, pot_h);
        translate([0,0,e])cylinder(r=r, pot_h);
        for(i=[0:pot_trou_nb]){
            rotate([0,0,i*360/pot_trou_nb])
            translate([-pot_trou_ep/2,0,pot_h1])
                cube([pot_trou_ep, r+2*e, pot_h2]);
        }
        for(i=[0:pot_trou_nb]){
            rotate([0,0,(i+0.5)*360/pot_trou_nb])
            translate([-pot_trou_ep/2,0,pot_h1+ pot_h2+e])
                cube([pot_trou_ep, r+2*e, pot_h2]);
        }
    }
}

if(false){
    pot();
    translate([0,0,pot_h+e]) rotate([0,180,0]) bouchon();  
} else {
     pot();
    translate([2*pot_r+2*e,0,0])bouchon();  
}