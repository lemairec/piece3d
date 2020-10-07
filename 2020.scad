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
    difference(){
        hull(){
            translate([0,-20,00])cylinder(r=37/2, 5);
            translate([-22,0,00])cube([44,20,5]);
        }
        translate([0,-20,00])moteur2();
        
        translate([15,10,00])cylinder(r=r, 100, center=true);
        translate([-15,10,00])cylinder(r=r, 100, center=true);
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

support_moteur2();