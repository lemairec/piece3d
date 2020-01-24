$fs=$fs/4;
$fa=$fa/4;

h=40;
module pied(r){
    difference(){
        cylinder( h+10, 20, r+2);
        translate([0,0,h]) cylinder( 100, r, r);
        translate([0,0,h+6]) rotate([0,90,0])cylinder( 100, r=1.5, center=true);
    };
}

//pied(20/2);
pied(25/2);