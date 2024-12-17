$fs=$fs/2;
$fa=$fa/2;

l = 50;
d = 14;
h2 = 8;
h1 = 4;
    

module support(h, d){
    difference(){
        translate([-l/2,-l/2,0])cube([l,l,h2]);
        for(i = [180,90,0,-90]){
            rotate([0,0,i])translate([l/2-5,l/2-5,-1])cylinder(r = 2.5, h2*2);
        }
        translate([0,0,-1])  cylinder(r = d/2, h2+2);
    }
}

module optique(){
    difference(){
        support(h2, d);
        
        translate([-2,0,h1]) rotate([-90,0,0]) cylinder(r = 2/2, 60);
        translate([2,0,h1]) rotate([-90,0,0]) cylinder(r = 2/2, 60);
        
        translate([0,0,h1]) rotate([90,0,0]) cylinder(r = 5/2, 60);
        translate([0,-d/2-1,h1]) rotate([90,0,0]) cylinder(r = 7/2, 15);
        translate([0,d/2+5-1,h1]) rotate([90,0,0]) cylinder(r = 6/2, 5);
    }
    
}

module demi1(){
    difference(){
        optique();
        translate([0,0,h1]) cylinder(r=100, 100);
    }
}

mode=1;

if(mode==0){
    optique();
} else {
    demi1();
    translate([l+2,0,0]) demi1();
    translate([0,l+2,0]) support(10, d+2);
    translate([l+2,,l+2,0]) support(10, d);
}