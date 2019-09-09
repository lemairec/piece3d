l1 = 30;

x=3;//6.5//11

ferme = true;
angle = asin((l1-3)/113);



module portail(){
    l2 = 113*cos(angle)+x;
    translate([-1,0,0])cube([2,350/2,10]);
    translate([-1,l2-5,0])cube([3,1,3]);
}

if(ferme){
    translate([0,5,0]) portail();
    translate([l1,x,0]) rotate([0,0,angle]) cube([2,113,2]);
} else {
    translate([0,5,0]) rotate([0,0,-90])portail();
    translate([l1,x,0]) rotate([0,0,-90]) cube([1,77,2]);
}