$fs=$fs/4;
$fa=$fa/4;

twin_l1 = 32;
twin_l2 = 46;
twin_e = 6;
branch = 3;

include <../4040.scad>

module twin1(){
    translate([0,0,-twin_e/2])difference(){
        hull(){
            cylinder(r=10, twin_e);
            translate([twin_l1,0,0])cylinder(r=15, twin_e);
            translate([0,twin_l2,0])cylinder(r=15, twin_e);
            
            
            translate([-80,twin_l2,0])cylinder(r=15, twin_e);
            translate([-80,0,0])cylinder(r=15, twin_e);
        }
        
        translate([twin_l1,0,-1])cylinder(r=6, twin_e+2);
        translate([0,twin_l2,-1])cylinder(r=6, twin_e+2);
    }
};


module twin_dent(){
    translate([60,-100,0])union(){
        cube([40,10,400]);
        
         hull(){
            
            
            translate([-60,60,0])cube([60,1,3]);;
            translate([100,-130,0])cube([60,1,3]);
        }
    }
    
   
};



e = 4;


module support_moteur2d(){
    translate([-20,-30,0])difference(){

        translate([-40,-30,0]) square([80,90]);

        
        for(i = [-1,1]){
            translate([i*20, 10]) circle(r=2.2);
            translate([i*20, 50]) circle(r=2.2);
        }
        translate([20, 30]) circle(r=5);
        
        translate([-25, -20])circle(r=4.2);
        translate([ 25, -20]) circle(r=4.2);
    }
}


module moteur3d(){
    rotate([0,0,90]) union(){
        translate([-30, -25,-25])cube([60,100,25]);
        for(i = [-1,1]){
            translate([i*20, 0]) cylinder(r=2.2,10);
            translate([i*20, 40]) cylinder(r=2.2,10);
        }
        translate([0, 0]) cylinder(r=5,10);
        translate([0, 50,-75]) cylinder(r=20,75);
    }
}



module dents_2d(){
    difference(){
        union(){
            circle(r=50);
            for(i = [1:branch]){
                rotate([0,0,360/branch*i])union(){
                    translate([0,-20,0])square([100, 40]);
                }
            }
        }
        for(i = [1:branch]){
            rotate([0,0,360/branch*i])union(){
                translate([50,0,0])circle(r=4.1);;
                translate([80,0,0])circle(r=4.1);;
                translate([90,0,0])circle(r=2.1);;
            }
        }
        for(i = [0:5]){
            rotate([0,0,60*i])union(){
                translate([23,0,0])circle(r=2.1);
            }
        }
        circle(r=4.1);
    }
}

l_dent = 200-35;
    
module dent_2d(){
    lg = 30;
    difference(){
        union(){
            translate([0,-lg/2,0])square([l_dent, lg]);
            translate([0,-5,0])square([l_dent+e, 10]);
        }
        translate([15,0,0])circle(r=4.1);;
        translate([45,0,0])circle(r=4.1);;
        translate([55,0,0])circle(r=2.1);;
    }
}

module dent2_2d(){
    lg = 60;
    difference(){
        hull(){
            translate([-20,0,0])square([3, lg], center = true);
            translate([40,0,0])circle(r=0.1);
        }
        translate([0,0,0])square([10.2, e+0.2], center = true);;
    }
}

module dents(){
        union(){
        linear_extrude(e) dents_2d();
    
        for(i = [1:branch]){
            rotate([0,0,360/branch*i])
            union(){
                translate([35,0,5])linear_extrude(e) dent_2d();
                translate([200+5,0,5+2.5]) rotate([90,0,-90])linear_extrude(e)dent2_2d();
            }
        }
    }
}


module support_twin_2d(){
    difference(){
        union(){
            hull(){
                translate([twin_l1,0,0])circle(r=20);
                translate([0,twin_l2,0])circle(r=20);
                
                
                translate([support_l,-20,0])square([1,twin_l2+40]);
            }
            translate([support_l+e/2,twin_l2/2-30,0])square([e+0.2, 20], center=true);
            translate([support_l+e/2,twin_l2/2+30,0])square([e+0.2, 20], center=true);
        }
        
        translate([twin_l1,0])circle(r=6);
        translate([0,twin_l2])circle(r=6);
    }
}

module support_twin2_2d(){
    difference(){
        hull(){
            translate([-10,60,0])circle(r=20);
            translate([-10,-60,0])circle(r=20);
            translate([-25,60,0])circle(r=20);
            translate([-25,-60,0])circle(r=20);
        }
        translate([-10,60,0])circle(r=4.1);
        translate([-10,-60,0])circle(r=4.1);
        translate([-25,60,0])circle(r=4.1);
        translate([-25,-60,0])circle(r=4.1);
        
        x = -7+e;
        translate([x,-30,0])square([e+0.2, 20+0.2], center=true);
        translate([x,30,0])square([e+0.2, 20+0.2], center=true);
            
    }
}


support_l = 260;
module support_twin(){
    translate([0,0,-twin_e/2])
    union(){
        x = -5+e;
        linear_extrude(e) support_twin_2d();
        translate([support_l,twin_l2/2, x]) rotate([0,90,0])linear_extrude(e)  support_twin2_2d();
        
    }
};


mode = 1;
if(mode == 1){
    l = 305;
    translate([l, 0,200])rotate([0,90,0]) union(){
        linear_extrude(5) support_moteur2d();
        color("gray") moteur3d();
        rotate([0,0,0])translate([0, 0,30])dents();
        
        
    }
    translate([l, 0,200]) translate([-20, -50,-50]) color("gray") barre4040(500);

    translate([0,-45,400])rotate([90,0,0]) support_twin();






    color("red") translate([0,-50,400])rotate([90,0,0])twin1();
    color("red")translate([0,50,400])rotate([90,0,0])twin1();
    color("red")translate([-75,-100,400])cube([40,200,30]);


    color("black") mirror([0,1])twin_dent();

    for(i=[0,1]){
        mirror([0,i]) color("black") twin_dent();
        mirror([0,i]) color("black") translate([-405,-60,250/2]) rotate([90,0,10])cylinder(r=250/2, 2);;
    }
} else {
    //ranslate([-110,-200]) square([400,300]);
    //support_moteur2d();
    dents_2d();
    for(i = [1:branch]){
        translate([110,i*40-50]) dent_2d();
    }
    for(i = [1:branch]){
        rotate([0,0,360/branch*(i+0.5)]) translate([75,0]) 
        rotate([0,0,120]) dent2_2d();
    }
    translate([-85,-175])support_twin_2d();
    translate([170,-50]) rotate([0,0,90])support_twin2_2d();
    translate([220,-130]) rotate([0,0,90])support_moteur2d();
    
}