use <config.scad>

$fs=$fs/2;
$fa=$fa/2;

r_cylindeur = 80;
e_cylindeur = 1;
l_cylindeur =200;
e=4;
nb_trou = 12;
nb_trou2 = 6;

support_e1 = 14;
support_e2 = 10;
support_trou_e = 7;


module support_trou(encoche = true){
    for(i=[0:nb_trou]){
            rotate([0,0,i*360/nb_trou])translate ([0,r_cylindeur+support_trou_e, 0]) circle(r=2);
    }
    
    if(encoche){
        for(i=[0:nb_trou2]){
            rotate([0,0,i*360/nb_trou2])translate ([-e/2,r_cylindeur+support_e1-e, 0]) square([e,e]);
            rotate([0,0,i*360/nb_trou2])translate ([-e/2,r_cylindeur-1, 0]) square([e,e+1]);;
        }
    }
}

module support_tamie1(){
    difference(){
        
        circle(r_cylindeur+support_e1);
        circle(r_cylindeur);
        support_trou();
    }
}

module support_tamie1_bis(){
    difference(){
        
        circle(r_cylindeur+support_e1);
        circle(r_cylindeur-20);
        support_trou();
    }
}

module support_tamie2(){
    difference(){
        
        circle(r_cylindeur+support_e2);
        circle(r_cylindeur);
        support_trou(false);
    }
}

module support_tamie3(){
    difference(){
        
        circle(r_cylindeur+support_e2);
        circle(r_cylindeur-1);
        support_trou(false);
    }
}

module support_tamie4(){
    union(){
        square([l_cylindeur, support_e1], center=true);
        for(i=[0:1]){
            for(j=[0:1]){
                mirror([0,j,0])mirror([i,0,0])translate([l_cylindeur/2, -support_e1/2])square([e, e]);
            }
        }
    }
}


e_bis = 5;

translate([-2.5*e_bis,0,0])rotate([0,90,0]) rotate([0,0,360/nb_trou]) linear_extrude(e)support_tamie1();
translate([-1.5*e_bis,0,0])rotate([0,90,0])linear_extrude(e)support_tamie2();
translate([-0.5*e_bis,0,0])rotate([0,90,0])linear_extrude(e)support_tamie3();
translate([0.5*e_bis,0,0])rotate([0,90,0])linear_extrude(e)support_tamie2();
translate([1.5*e_bis,0,0])rotate([0,90,0])linear_extrude(e)support_tamie1();

for(i=[0:nb_trou2]){
    rotate([i*360/nb_trou2],0,0)translate([l_cylindeur/2+2.5*e_bis, r_cylindeur+support_e1/2,-e/2]) linear_extrude(e)support_tamie4();
}

l=l_cylindeur+2.5*e_bis;
translate([l,0,0])rotate([0,90,0])linear_extrude(e)support_tamie1();
translate([l+e_bis,0,0])rotate([0,90,0])linear_extrude(e)support_tamie2();
translate([l+2*e_bis,0,0])rotate([0,90,0])linear_extrude(e)support_tamie3();
translate([l+3*e_bis,0,0])rotate([0,90,0])linear_extrude(e)support_tamie3();
translate([l+4*e_bis,0,0])rotate([0,90,0])linear_extrude(e)support_tamie2();
translate([l+4*e_bis,0,0])rotate([0,90,0])  rotate([0,0,360/nb_trou]) linear_extrude(e)support_tamie1_bis();

//circle(r_cylindeur); 