include <../config.scad>
$fn=100;

e = 3;
r_roue = 160/2;
pignon_r = 6/2;
h=30;
module roue(){
    difference(){
        union(){
            cylinder(r = r_roue,e);
            
            difference(){
                cylinder(r = r_roue,h);
                translate([0,0,1])cylinder(h,r_roue-15,r_roue-e);
            }
            
            for(i=[0:12]){
                rotate([0,0,i*30]) translate([r_roue,0,0])
                hull() {
                    cube([e,e,h/2-5]);
                    translate([0,0,h/2])cube([0.1,e,0.1]);
                }
                rotate([0,0,15+i*30]) translate([r_roue,0,0])
                translate([0,0,h])mirror([0,0,1])hull() {
                    cube([e,e,h/2-5]);
                    translate([0,0,h/2])cube([0.1,e,0.1]);
                }
            }
        }
        translate([0,0,-1])cylinder(r=4.5, 35, $fn=16);
        %translate([0,0,5])cylinder(r=58/2, 35);
        
        //translate([7,0,20])rotate([0,-90,0])m3_nut(10);
        //translate([0,0,20])rotate([0,90,0])m3(20);
        
        for(i=[0:6]){
            rotate([0,0,i*60]) translate([24,0,-1])cylinder(r=5/2, 35);;
        }
        
        
    }

}


roue();
