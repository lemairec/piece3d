$fs=$fs/4;
$fa=$fa/4;

roue_d=450;
element_h = 600;
l_machine = 3000;

module element(){
    
    color("gray") translate([ roue_d/2, -20, 50]) rotate([90,0])cylinder(100, r=roue_d/2);
    translate([ roue_d/2, -20, 50]) rotate([-90,0])cylinder(300, r=15);
    color("gray") translate([-roue_d/2, -20, 50]) rotate([90,0])cylinder(100, r=roue_d/2);
    translate([-roue_d/2, -20, 50]) rotate([-90,0])cylinder(300, r=15);
    
    translate([-element_h/2,0])cube([element_h, 5, 100]);
    translate([-element_h/2,0])cube([element_h, 300, 5]);
}


module element2(){
    rotate([180,0])element();
}

module batti(){
    translate([-l_machine/2,-150,0])rotate([45,0,0])cube([l_machine,100,100]);
    translate([-l_machine/2,1000-150,0])rotate([45,0,0])cube([l_machine,100,100]);
    
    translate([1.5*450,-500,150])cube([100,1500,100]);
    translate([-1.5*450,-500,150])cube([100,1500,100]);
    
    //translate([-1750,-100,0])cube([5,1000,100]);
    //translate([1750,-100,0])cube([5,1000,100]);
    
    translate([0,-400,400]) union(){
        translate([-200, 0, 0])rotate([0,-60,0])cube([800,100,100], center=true);
        translate([200, 0, 0])rotate([0,-120,0])cube([800,100,100], center=true);
    }
    translate([-0, 300, 300])rotate([-25,0,0])cube([100,1400,100], center=true);
}

module machine(){
    batti();
    for(i=[-1:1]){
        translate([450*(2*i-0.5),-80,-80])rotate([-45,0,0])element2();
    }
    
    for(i=[-1:1]){
        translate([450*(2*i+0.5),1000-80,-80])rotate([-45,0,0])element2();
    }
    
}

translate([0,1000,300]) machine();


for(i=[-3:2]){
    color("green")translate([450*(i+0.5),0,0])cube([5, 4000, 5], center=true);
    
}

d2=340;
for(i=[-6:6]){
    %translate([d2*(i+0.5),0,17]) rotate([-90,0])cylinder(100, r=d2/2, center=true);
    
}


//roue 18x8.5
