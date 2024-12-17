$fs=$fs/2;
$fa=$fa/2;

d = 120;
h1=12;
h2=5;


/*linear_extrude(height = h2, center = false, convexity = 10, twist = 360, $fn = 100){
        translate([d/2-3, 0, 0])
        circle(r = 3);
    }*/

module bol(){
    union(){
        cylinder(r=d/2, h=1);
        hull(){
            cylinder(r=6, h=h1);
            cylinder(r=d/2-5, h=1);
        }
        
        difference(){
            cylinder(r=d/2, h=h1);
            cylinder(r=d/2-1, h=h1+2);
        }
        
        
    }
}

module bol1(){
    union(){
        bol();

        for(i = [0:3500]){
             rotate([0,0,i/10]) translate([d/2-6, 0, 0]) cube([5,1,1+(i/3500)*5]);
        }
    }
}

module bol2(){
    %cube([150,150,4], center=true);
    difference(){union(){
            hull(){
                translate([50, 0, 0]) cylinder(r=5,3);
                translate([-50, 0, 0]) cylinder(r=5,3);
            }
            hull(){
                translate([0, 0, 0]) cylinder(r=78/2,20);
                translate([-15, 95, 20]) cube([30,2,1]);
                translate([-2, 95, 0]) cube([4,2,20]);
            }
        }
        hull(){
            translate([0, 0, 8]) cylinder(r=78/2-2,40);
            translate([0, 98, 20]) cube([28,1,1], center=true);
            translate([0, 97, 2]) cube([1,1,1], center=true);
        }
        translate([50, 0, 0]) cylinder(r=2,3);
        translate([-50, 0, 0]) cylinder(r=2,3);
    }
    
}


bol2();
