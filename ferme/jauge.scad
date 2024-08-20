$fs=$fs/4;
$fa=$fa/4;

support_d = 20;
support_vis = 50;

x1=-10;
l1 =66;
lg1 =26;

l2 =100;
lg2 =40;
h2 = 15;


e = 2;
e2 = 2.2;
h1=10;

e3 = 4;

y = 35;

module bas(){
    difference(){
        union(){
            translate([0,0,e/2])cube([l2,lg2, e], true);
            translate([y,0,e/2])cube([30,60,e], true);
            for(i = [-1,1]){
                for(j = [-1,1]){
                    translate([x1+i*l1/2, j*lg1/2, 0]) cylinder(r = 1.7+e, e3);
                }
            }
            
            for(i = [-1,1]){
                for(j = [-1,1]){
                    translate([i*(l2/2-2), j*(lg2/2-2), 0]) cylinder(r = 3, h2);
                }
            }
            hull(){
                translate([y,-3,0])cylinder(r=5,e3-1);
                translate([y, 3,0])cylinder(r=5,e3-1);
                translate([y+2,-10,0])cylinder(r=3,e3-1);
                translate([y+2, 10,0])cylinder(r=3,e3-1);
            }
            translate([y+2,-10,0])cylinder(r=2.5,e3);
            translate([y+2, 10,0])cylinder(r=2.5,e3);
            translate([-l2/2,-lg2/2,0])difference(){
                cube([l2,lg2, 15]);
                 translate([e,e,0])cube([l2-2*e,lg2-2*e, 20]);
            }
        }
        
        for(i = [-1,1]){
            for(j = [-1,1]){
                translate([x1+i*l1/2, j*lg1/2, -1]) cylinder(r = 1.5, e3+2);
            }
        }
        
        for(i = [-1,1]){
                for(j = [-1,1]){
                    translate([i*(l2/2-2), j*(lg2/2-2), -1]) cylinder(r = 1.5, h2+2);
                }
            }
        
        translate([y,-25, -1]) cylinder(r = 1.5, 6);
        translate([y, 25, -1]) cylinder(r = 1.5, 6);
        
        translate([y+2,-10,-1])cylinder(r=1.5,e3+2);
        translate([y+2, 10,-1])cylinder(r=1.5,e3+2);
        
        hull(){
            translate([y,-3,-1])cylinder(r=4,10);
            translate([y, 3,-1])cylinder(r=4,10);
        }
        
        
            
    }
}

module haut(){
    h=20+e;
    h2=25+2*e;
    difference(){
        union(){
            translate([0,0,e/2])cube([l2,lg2, e], true);
            difference(){
                translate([0,0,h/2])cube([100,lg2, h], true);
                translate([0,0,h/2])cube([100-2*e2,lg2-2*e2, h+e], true);
            }
            difference(){
                translate([0,0,h2/2])cube([100-2*e2,lg2-2*e2, h2], true);
                translate([0,0,h2/2])cube([100-4*e2,lg2-4*e2, h2+e], true);
            }
        }
        
        for(i = [-1,1]){
            for(j = [-1,1]){
                translate([i*(l2/2-5), j*(lg2/2-5), -1]) cylinder(r = 1.7, h2+2);
            }
        }
        
        translate([0,-4, h-5]) cube([100,8,20]);
        
            
    }
}

mode = 1;
if(mode==0){
    bas();
    rotate([0,180,0]) translate([0,0, -50])  haut();
} else if(mode==1){
    bas();
} else if(mode==2){
    haut();
}
    

/*difference(){

    translate([-40,-10,0]) cube([80,50,2]);
    
    hull(){
        translate([-3,0])cylinder(r=3,10);
        translate([3,0])cylinder(r=3,10);
    }
}*/
