use <config.scad>
use <libs/gears.scad>

n=3;
d = 150;
d2 =152;
a = 20;


e = 3;


//5120
lg_int = 45;
h_int = 5;
angle = 30;

//same
if(false){
    lg_int = 25;
    h_int = 30;
}

l = lg_int+10;
h2=h_int+5;



module couronne(){
    difference(){
        
        union(){
            spur_gear (modul=2, tooth_number=92, width=5, bore=d, pressure_angle=20, helix_angle=0, optimized=true);
            
            for(i=[0:n]){
                rotate([0,0,i*360/n])hull(){
                    translate([-l/2,d2/2,0]) cylinder(r=5,1);
                    translate([ l/2,d2/2,0]) cylinder(r=5,1);
                    translate([-l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2]) cylinder(r=5,1);
                    translate([ l/2,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2]) cylinder(r=5,1);
                }
            }
            
        }
        
        
        for(i=[0:n]){
            
            rotate([0,0,i*360/n])translate([0,d2/2,-1]) rotate([a,0,0]) translate([-lg_int/2,-10,h2+1.1-h_int]) cube([lg_int, 20, h_int]);
        
            rotate([0,0,i*360/n])translate([-l/2,d2/2,-1]) rotate([a,0,0]) cylinder(r=2,200);
            rotate([0,0,i*360/n])translate([ l/2,d2/2,-1]) rotate([a,0,0]) cylinder(r=2,200);
        }
        
        hull(){
            rotate([0,0,180-angle]) translate([0,0,-1]) cube([1,200,100]);
            rotate([0,0,180+angle]) translate([0,0,-1]) cube([1,200,100]);
        }
        
    }

   
}




module support_coronne(){
    difference(){
        hull(){
            translate([-l/2,0,0]) cylinder(r=5,e);
            translate([ l/2,0,0]) cylinder(r=5,e);
        }
        translate([-l/2,0,-1]) cylinder(r=2,10);
        translate([ l/2,0,-1]) cylinder(r=2,10);
    }
}

pignon_r = 5.4/2;
module pignon(){
    difference(){
        union(){
            spur_gear (modul=2, tooth_number=20, width=10, bore=0, pressure_angle=20, helix_angle=0, optimized=true);
            cylinder(r= 11, 20);
        }
        cylinder(r=pignon_r, 30, $fn=16);
        
        translate([8,0,15])rotate([0,-90,0])m3_nut(10);
        translate([12,0,15])rotate([0,-90,0])m3(12);
    }

}

module support_moteur(){
    difference(){
        union(){
            translate([-25,0,0])cube([50,45,40]);
            translate([-20,0,20])hull(){
                translate([0,-6, 0])cylinder(r=5, 20);
                translate([-5,0,0])cube([20,1,20]);
            }
        }
        translate([0,22+e,20+e]) rotate([0,180,0]) nema17();
        translate([-20,-6, -1])cylinder(r=2.2, 200);
        
        translate([-50,120, 70]) rotate([45+90,0,0])cube([100,100,100]);
    }
}

module support_volant(){
    difference(){
        union(){
            translate([0,0,0])cube([100,30,e]);
            
            hull(){
                cube([1,1,e]);
                translate([100,0,0])cube([e,e,50]);
            }
            
            translate([100,0,0])cube([e,30,50]);
            
            translate([100,0,0])hull(){
                translate([5,25, 0])cylinder(r=5, 50);
                translate([0,0,0])cube([e,e,50]);
            }
        }
        translate([105,25, -1])cylinder(r=2.2, 200);
        
        
        translate([0,19, 20])cube([150,150,22]);
    }
}

module support_direction(){
    difference(){
        union(){
            translate([0,0,0])cube([100,30,e]);
            
            hull(){
                cube([1,1,e]);
                translate([100,0,0])cube([e,e,50]);
            }
            
            translate([100,0,0])cube([e,30,50]);
            
            translate([100,0,0])hull(){
                translate([5,25, 0])cylinder(r=5, 50);
                translate([0,0,0])cube([e,e,50]);
            }
        }
        translate([105,25, -1])cylinder(r=2.2, 200);
        
        
        translate([0,19, 20])cube([150,150,22]);
    }
}

mode=5;

if(mode==0){
    couronne();
    for(i=[0:n]){
        rotate([0,0,i*360/n]) translate([0,d2/2,-1]) rotate([a,0,0]) translate([0,0,h2+2])          support_coronne();
    }
    translate([120,0,0]) pignon();
} else if(mode==1){
   couronne();
} else if(mode==2){
   pignon();
} else if(mode==3){
   support_moteur();
} else if(mode==4){
   support_volant();
}

 else if(mode==5){
   support_direction();
}

//


//support_moteur();





