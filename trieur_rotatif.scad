use <config.scad>

$fs=$fs/2;
$fa=$fa/2;

r_cylindeur = 60;
l_cylindeur =200;

trou1_r = 1.5;
trou1_nb = 48;
trou1_h=trou1_r*3;

trou2_r = 2;
trou2_nb = 48;
trou2_h=trou2_r*3;

trou3_r = 3;
trou3_nb = 18;
trou3_h=trou3_r*3;

module tamie(){
    difference(){
        cylinder(l_cylindeur, r=r_cylindeur);
        translate([0,0,-1]) cylinder(l_cylindeur+2, r=r_cylindeur-e1);
        
        /*for(j=[1:l_cylindeur/3/trou1_h]){
            for(i=[0:nb_trou1]){
                translate([0,0,j*trou1_h]) rotate([90,0,i*360/nb_trou1])cylinder(l_cylindeur, r=2);
            }
        }
        for(j=[1:l_cylindeur/3/trou2_h]){
            for(i=[0:nb_trou2]){
                translate([0,0,l_cylindeur/3 + j*trou2_h]) rotate([90,0,i*360/nb_trou2])cylinder(l_cylindeur, r=trou2_r);
            }
        }
        for(j=[1:l_cylindeur/3/trou3_h-1]){
            for(i=[0:nb_trou3]){
                translate([0,0,2*l_cylindeur/3 + j*trou3_h]) rotate([90,0,i*360/nb_trou3])cylinder(l_cylindeur, r=trou3_r);
            }
        }*/
    }
    
}

tamie2_r = 60;
tamie2_l = 60;
tamie2_e = 1;
nb = 6;

e2=12;
e1=10;
e3=8;

e_vis= 5;


module tamie2(trou_r, nb_trou, trou_h){
    difference(){
        union(){
            cylinder(tamie2_l, r=tamie2_r);
            cylinder(2, r=tamie2_r+e2);
            cylinder(10, r=tamie2_r+e1);
        }
        translate([0,0,-1]) cylinder(tamie2_l+2, r=tamie2_r-tamie2_e);
        for(j=[0:(tamie2_l-20)/trou_h]){
            translate([0,0,15+j*trou_h]){
                for(i=[0:nb_trou/2]){
                    rotate([90,0,i*360/nb_trou])cylinder(l_cylindeur, r=trou_r, center = true);
                }
            }
        }
        
        for(i=[0:nb]){
            rotate([0,0,(i)*360/nb]) translate([0,tamie2_r-1+e_vis,-1]) m3(100);
        }
       
                    
    }
    
    for(i=[0:nb]){
        rotate([0,0,(0.5+i)*360/nb]) translate([0,tamie2_r-1,0]) 
            difference(){
                union(){
                    translate([-e3/2, 0, 0])cube([e3,e3, tamie2_l]);
                    translate([-5, 0,tamie2_l-10])cube([10,10, 10]);
                   
                }
                translate([0, e_vis,tamie2_l-8]) rotate([0,0,90]) m3_nut(10);
                translate([0, e_vis,tamie2_l-15]) m3(100);
            }
            
    }
}

nb = 6;
module support_tamie(){
    difference(){
        union(){
            cylinder(2, r=tamie2_r+e2);
            cylinder(7, r=tamie2_r+e1, $fn=200);
        }
        translate([0,0,-1]) cylinder(10, r=tamie2_r-tamie2_e);
        translate([0,0,-1]) cylinder(7, r=tamie2_r);
        for(i=[0:nb]){
            rotate([0,0,(i)*360/nb]) translate([0,tamie2_r+e_vis,-1]) m4(100);
        }
    }
}

module tamie(trou_r, nb_trou, trou_h){
    r = tamie2_r-0.5;
    difference(){
        cylinder(tamie2_l, r=r);
        translate([0,0,-1]) cylinder(tamie2_l+2, r=r-0.8);
        
        for(j=[1:(tamie2_l)/trou_h-1]){
            translate([0,0,j*trou_h]){
                for(i=[0:nb_trou/2]){
                    rotate([90,0,i*360/nb_trou])cylinder(l_cylindeur, r=trou_r, center = true);
                }
            }
        }
        
    }
}

module support(){
    h = 18;
    difference(){
        union(){
            translate([-25,-10,0])cube([50, 20, 5]);
            for(i=[0:1]){
                mirror([i,0,0]) translate([5, -10, 0])cube([5, 20, 25]);
                mirror([i,0,0]) translate([4, 0, h]) rotate([0,90,0]) cylinder(1, r=7);
                //translate([4, 0, h]) cylinder(1, r=7);
                
            }
        }
        for(i=[0:1]){
            mirror([i,0,0])translate([-18,0,-1])cylinder(10, r=3);
        }
        translate([0,0,h]) rotate([0,90,0])cylinder(100, r=4.2, center=true);
    }
    //cube([20, 50, 3]);
    
}

//55

//support_tamie();

//support();

//translate([0,0,0])tamie(trou2_r, trou2_nb, trou2_h);
tamie(trou2_r, trou2_nb, trou2_h);
//translate([0,0,-tamie2_l])tamie2(trou1_r, trou1_nb, trou1_h);
