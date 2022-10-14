$fs=$fs/4;
$fa=$fa/4;
 
l1 =60;
lg1 =60;

l2 =100;
lg2 =80;

e = 2;
e2 = 2.2;
h1=10;

module bas(){
    difference(){
        union(){
            hull(){
                translate([0,0,e/2])cube([l2,80, e], true);
                translate([0,55, 0]) cylinder(r = 5, e);
            }
            for(i = [-1,1]){
                for(j = [-1,1]){
                    translate([i*l1/2, j*lg1/2, 0]) cylinder(r = 1.7+e, 6);
                }
            }
            difference(){
                translate([0,0,5])cube([100,80, 10], true);
                translate([0,0,5])cube([100-2*e,80-2*e, 12], true);
            }
        }
        
        for(i = [-1,1]){
            for(j = [-1,1]){
                translate([i*l1/2, j*lg1/2, -1]) cylinder(r = 1.7, 10);
                translate([i*(l1/2+10), j*lg1/2, -1]) cylinder(r = 1.7, 10);
                translate([i*(l2/2-5), j*(lg2/2-5), -1]) cylinder(r = 1.7, 10);
            }
        }
        
        hull(){
            translate([0,45, -1]) cylinder(r = 1.7, 10);
            translate([0,55, -1]) cylinder(r = 1.7, 10);
        }
        translate([0,45, -1]) cylinder(r = 4, 10);
        
        for(i=[-3:4]){
           translate([(i-0.5)*10-2,-135, e]) cube([4,100,9]); 
        }
        //
        for(i = [-1,1]){
            translate([l2/2-5,i*8, -1]) cylinder(r = 1.7, 10);
            translate([-l2/2+5,i*10, -1]) cylinder(r = 1.7, 10);
        }
        
        translate([-100,-6, h1-5]) cube([100,12,6]);
            
    }
}

module haut(){
    h=25+e;
    h2=25+2*e;
    difference(){
        union(){
            translate([0,0,e/2])cube([l2,80, e], true);
            difference(){
                translate([0,0,h/2])cube([100,80, h], true);
                translate([0,0,h/2])cube([100-2*e2,80-2*e2, h+e], true);
            }
            difference(){
                translate([0,0,h2/2])cube([100-2*e2,80-2*e2, h2], true);
                translate([0,0,h2/2])cube([100-4*e2,80-4*e2, h2+e], true);
            }
        }
        
        for(i = [-1,1]){
            for(j = [-1,1]){
                translate([i*(l2/2-5), j*(lg2/2-5), -1]) cylinder(r = 1.7, h2+2);
            }
        }
        
        translate([0,-4, h]) cube([100,8,9]);
        
            
    }
}

mode = 2;
if(mode==0){
    bas();
    rotate([0,180,0]) translate([0,0, -50])  haut();
} else if(mode==1){
    bas();
} else if(mode==2){
    haut();
}
    