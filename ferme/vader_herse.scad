r1=60;
e = 40;

angle = 55;
l = r1+e;

l2 = 160;

l5 = 300;

difference(){
    union(){
        hull(){
            circle(r1+e);
            translate([-r1-e,0])square([e,180]);
            rotate([0,0,-angle])translate([r1,0])square([e,l2]);
        }
        
        translate([-2*l,r1])square([r1+e, e]);
        
    }
    
    hull(){
        circle(r1);
        translate([0.1,l5]) circle(r1);
        //rotate([0,0,-angle]) translate([r1,0])square([0.1,l5]);
    }
    
    hull(){
        rotate([0,0,-angle])translate([r1,l2])circle(0.1);
        rotate([0,0,-20])translate([r1,0])circle(0.1);
        translate([0.1,l5]) circle(r1);
    }
}