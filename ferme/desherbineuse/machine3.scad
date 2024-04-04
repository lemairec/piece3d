$fs=$fs/4;
$fa=$fa/4;

batteur_r =400;
element_h = 600;

r_roue = 280/2;
h_roue = 100;

module batteur(){
    l = 3000;
    for(i=[0:6]){
        rotate([i*60,0,0])translate([0,0,-batteur_r])cube([l,100,5], center = true);
    }
    
    for(j=[-1,0,1]){
        for(i=[0:6]){
            translate([j*l/2,0,0]) rotate([i*60,0,0])cube([5, 100, batteur_r*2], center = true);
        }
    }
    
    rotate([0,90])cylinder(l+300, r=30, center = true);
    %rotate([0,90])cylinder(l, r=batteur_r, center = true);
}

module petit_batteur(){
    l = 3000;
    rotate([0,90])cylinder(l+300, r=30, center = true);
    for(i=[-3:2]){
        color("gray")translate([450*(i+0.5)-h_roue/2-5,0,0])
        rotate([0,90])cylinder(h_roue, r=r_roue, center = true);
        color("gray")translate([450*(i+0.5)+h_roue/2+5,0,0])
        rotate([0,90])cylinder(h_roue, r=r_roue, center = true);
    
    }
    //%rotate([0,90])cylinder(l, r=300, center = true);
}


module element2(){
    batteur();
}

module batti(){
    l=3200;
    lg=1400;
    translate([0,-lg/2,0])cube([l,100,100], center= true);
    translate([0,lg/2,0])cube([l,100,100], center= true);
    
    translate([-l/2,0,0])cube([100,lg+100,100], center= true);
    translate([l/2,0,0])cube([100,lg+100,100], center= true);
    
    
    translate([0,-lg/2,400]) union(){
        translate([-200, 0, 0])rotate([0,-60,0])cube([800,100,100], center=true);
        translate([200, 0, 0])rotate([0,-120,0])cube([800,100,100], center=true);
    }
    
}

module machine(){
    batti();
    translate([0,0,190])batteur();
    translate([0,470,-90])petit_batteur();
    
}

translate([0,0,400]) machine();


for(i=[-3:2]){
    color("green")translate([450*(i+0.5),0,0])cube([5, 4000, 5], center=true);
    
}