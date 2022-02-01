include <../config.scad>
$fn=100;

e1 = 4;
cran_e = 10;
cran_h = 6;
r_roue = 180/2;
pignon_r = 6/2;
h=30;
h2=10;

module cran1(){
    for(i=[0:12]){
        rotate([0,0,i*30]) hull() {
            translate([r_roue-1,-cran_h/2,0])cube([cran_h,cran_e,1]);
            rotate([0,0,5]) translate([r_roue-1,-cran_h/2,h/2])cube([cran_h,cran_e,1]);
        }
        rotate([0,0,i*30]) hull() {
            rotate([0,0,5]) translate([r_roue-1,-cran_h/2,h/2])cube([cran_h,cran_e,1]);
            translate([r_roue-1,-cran_h/2,h-1])cube([cran_h,cran_e,1]);
            
        }
    }
}

module cran2(){
    for(i=[0:12]){
        rotate([0,0,15+i*30]) translate([r_roue-1,0,0])
        hull() {
            translate([0,-cran_h/2,0])cube([cran_h,cran_e,h/2-5]);
            translate([0,-cran_h/2,h/2])cube([0.1,cran_e,0.1]);
        }
        rotate([0,0,i*30]) translate([r_roue-1,0,0])
        translate([0,0,h])mirror([0,0,1])hull() {
            translate([0,-cran_h/2,0])cube([cran_h,cran_e,h/2-5]);
            translate([0,-cran_h/2,h/2])cube([0.1,cran_e,0.1]);
        }
    }
}

module support(){
    for(i=[0:6]){
        rotate([0,0,(i)*60]) translate([0,-e1/2,0])cube([r_roue, e1, h/2]);
        rotate([0,0,i*60]) translate([24,0,0])cylinder(r=5/2+e1, h/2);;
    }
    translate([0,0,0])cylinder(r=4.5+e1, h/2, $fn=16);
            
}

module roue(){
    difference(){
        union(){
            cylinder(r = r_roue,e1);
            
            difference(){
                cylinder(r = r_roue,h);
                translate([0,0,1])cylinder(h,r_roue-15,r_roue-cran_h);
            }
            
            support();
            cran2();
        
        }
        translate([0,0,-1])cylinder(r=4.5, 35, $fn=16);
        
        //translate([7,0,20])rotate([0,-90,0])m3_nut(10);
        //translate([0,0,20])rotate([0,90,0])m3(20);
        
        for(i=[0:6]){
            rotate([0,0,i*60]) translate([24,0,-1])cylinder(r=5/2, 35);;
        }
        
        
        
        
    }

}


roue();
