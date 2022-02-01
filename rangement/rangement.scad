use <../config.scad>
use <../inc/rounded_box.scad>


l = 164;
e = 2;
e2 = 1;

module big_casier(){
    difference(){
        myRoundedBox(l,l,l,3);
        translate([0,0,e])myRoundedBox(l-2*e,l-2*e,l,3);
    }
}

module little_casier(){
    difference(){
        myRoundedBox(l,l,l/2,3);
        translate([0,0,e])myRoundedBox(l-2*e,l-2*e,l,3);
    }
    
    for(i = [-4:4]){
        %translate([-l/2,i*20-e2/2,1])cube([l, e2, l/2]);
    }
}

little_casier();