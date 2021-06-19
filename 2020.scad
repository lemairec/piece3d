$fs=$fs/4;
$fa=$fa/4;

r = 2.6;

module equerre(){
    e=5;
    difference(){
        union(){
            cube([20,e,20]);
            cube([e,20,20]);
        }
        translate([12,-10,10])rotate([90,0,0])cylinder(r=r, 100, center=true);
        translate([10,10,10])rotate([0,90,0])cylinder(r=r, 100, center=true);
    }
}


module moteur2(){
    translate([0,0,-70])cylinder(r=37/2, 70);
    for(i=[0, 60, 120, 180, 240, 300]){
         rotate([0,0,i]) translate([31/2, 0,0]) cylinder(r=3/2, 10);
    }
    translate([0, 7,0]) cylinder(r=13/2, 10);
    translate([0, 7,0]) cylinder(r=6/2, 10);
}


module support_moteur(){
    l = 60;
    difference(){
        union(){
            hull(){
                translate([0,-22,00])cylinder(r=37/2, 3);
                translate([-l/2,-20,00])cube([l,40,3]);
            }
            translate([-l/2,-3,00])cube([l,3,22]);
            hull(){
                translate([-22,-2,00])cube([2,2,20]);
                translate([-22,-20,00])cube([2,20,2]);
            }
        }  
        translate([0,-22,00])rotate([0,0,-90])moteur2();
        
        translate([15,10,00])cylinder(r=1.7, 100, center=true);
        translate([-15,10,00])cylinder(r=1.7, 100, center=true);
        translate([-26,0,13]) rotate([90,0,0])cylinder(r=1.7, 100, center=true);
        translate([26,0,13]) rotate([90,0,0])cylinder(r=1.7, 100, center=true);
        
    }
    
}

module support_moteur2(){
    difference(){
        translate([-22,-22,00])cube([44,48,5]);
        
        translate([15,-11,00])cylinder(r=r, 100, center=true);
        translate([-15,-11,00])cylinder(r=r, 100, center=true);
        
        translate([-12,3,00])cylinder(r=1.7, 100, center=true);
        translate([-12,3+18,00])cylinder(r=1.7, 100, center=true);
        translate([-12+20,3+18/2,00])cylinder(r=3, 100, center=true);
    }
}

module support_moteur3(){
    difference(){
        union(){
            translate([-22,-22,00])cube([44,50,2]);
            translate([-22,0,00])cube([44,2,22]);
            
            translate([5,0])hull(){
                cube([2,25,2]);
                cube([2,2,20]);
            }
        }
        translate([15,-10,00])cylinder(r=1.7, 100, center=true);
        translate([-15,-10,00])cylinder(r=1.7, 100, center=true);
        translate([0,0,12]) rotate([90,0,0])cylinder(r=1.7, 100, center=true);
        
        x=-18;
        translate([x,6,00])cylinder(r=1.7, 100, center=true);
        translate([x,6+18,00])cylinder(r=1.7, 100, center=true);
        translate([x+9,6+18/2,00])cylinder(r=4, 100, center=true);
        translate([x+33,6,00])cylinder(r=1.7, 100, center=true);
        translate([x+33,6+18,00])cylinder(r=1.7, 100, center=true);
        
    }
    
}

module support_moteur4(){
    l = 54;
    difference(){
        union(){
            translate([-l/2,-22,00])cube([l,75,2]);
            translate([-l/2,0,00])cube([l,2,22]);
            
            translate([5,0])hull(){
                cube([2,52,2]);
                cube([2,2,20]);
            }
        }
        translate([15,-10,00])cylinder(r=1.7, 100, center=true);
        translate([-15,-10,00])cylinder(r=1.7, 100, center=true);
        translate([0,0,12]) rotate([90,0,0])cylinder(r=1.7, 100, center=true);
        
        x=-18;
        translate([x,6,00])cylinder(r=2.1, 100, center=true);
        translate([x,6+40,00])cylinder(r=2.1, 100, center=true);
        translate([x,6+20,00])cylinder(r=4, 100, center=true);
        translate([x+40,6,00])cylinder(r=2.1, 100, center=true);
        translate([x+40,6+40,00])cylinder(r=2.1, 100, center=true);
        
    }
    
}

support_moteur();