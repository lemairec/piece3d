nb_rang = 1;

lg_roue = 450*nb_rang;
lg = lg_roue-50;
l = 400;
h = 150;
roue_d = 180;
roue_d2 = 150;
h_cam = 500;

e =30;


for(i=[0:12]){
    for(j=[-20:20]){
        translate([(i-6)*450,j*200,1]) color("green") cube([20,20,1], center = true);
    }
}


module chassis(){
    translate([-lg/2,150])cube([lg,e,e]);
    translate([-lg/2,0])cube([e,l,e]);
    translate([lg/2-e,0])cube([e,l,e]);
    translate([-lg/2,l])cube([lg,e,e]);
    
    translate([lg/2-e,40])cube([e,e,300]);
    translate([-lg/2,40])cube([e,e,300]);
    
    translate([-lg/2,40, 100])cube([lg,e,e]);
    translate([-lg/2,40, 300])cube([lg,e,e]);
    
    
    translate([0,40, 300]) rotate([-40,0,0])cube([e,l*1.2,e]);
    
}

module colonne1(){
    
    
    translate([-20,0, 100])cube([40,40,400]);
    translate([0,-40, h_cam-h])rotate([-20,0,0]) cylinder(80, r=20);
}

module colonne2(){
    translate([-20-50,0, -50])cube([40,40,400]);
}

module moteur(){
    translate([-30,-30, -40]) cube([60,100,20]);
    translate([0,50, -40-70]) cylinder(70, r=25);
    
    cylinder(r=50, 10, center = true);
    translate([0,0, -30])cylinder(r=4, 80, center = true);
    for(i=[1:3]){
        rotate([0,0,i*120+30])rotate([90,0,0]) cylinder(160, r=10);
    }
}

color("black")translate([0,0,h]) chassis();
for(i=[0:0]){
    translate([0,0,h]) colonne1();
    translate([i*450,0,h]) colonne2();
    color("blue")translate([i*450,-20,h]) rotate([90,0,0]) moteur();
}
color("blue")translate([0,-20,h]) rotate([90,0,0]) moteur();
translate([-lg_roue/2,roue_d/2,roue_d/2]) rotate([0,90,0])cylinder(r=roue_d/2, 10, center = true);
translate([ lg_roue/2,roue_d/2,roue_d/2]) rotate([0,90,0])cylinder(r=roue_d/2, 10, center = true);
translate([-lg_roue/2,l,roue_d2/2]) rotate([0,90,0])cylinder(r=roue_d2/2, 10, center = true);
translate([ lg_roue/2,l,roue_d2/2]) rotate([0,90,0])cylinder(r=roue_d2/2, 10, center = true);





