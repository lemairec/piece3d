
o_hangar_lg=10000;
o_hangar_l=55000;
o_hangar_h=6000;
o_hangar_t = 5000;

toit = true;

module o_trave(){
    translate([0/2, 0])cube([200,200, o_hangar_h]);
    translate([o_hangar_lg, 0])cube([200,200, o_hangar_h]);
    translate([0, 0, o_hangar_h]) rotate([0,90-30,0])cube([200,200, 5600]);
    translate([o_hangar_lg+3000, 0, 5000]) rotate([0,-90+25,0])cube([200,200, 9000]);
}


module o_hangar(){
    translate([0, 0, 0]) cube([o_hangar_lg,        o_hangar_l, 1]);
    for(i=[0:11]){
        translate([0, i*o_hangar_t, 0]) o_trave();
    }
    
    if(toit){
        translate([0, 0, o_hangar_h]) rotate([0,-30,0])cube([5600,o_hangar_l, 1]);
        translate([o_hangar_lg+3000, 0, 5000+200]) rotate([0,180+25,0])cube([9000,o_hangar_l, 1]);
    }
}






/*module trave_m(){
    translate([lg_hangar, 0])cube([200,200, h2]);
    translate([0, 0])cube([200,200, h1]);
    translate([0, 0, h1]) rotate([0,90-angle,0])cube([200,200, l3]);
    translate([lg_hangar, 0, h2]) rotate([0,-90+angle,0])cube([200,200, l4]);
    
}*/

/*module trave_b(){
    h_b = 7000;
    translate([lg_hangar, 0]) translate([-200, 0])cube([200,200, h_b]);
    translate([0, 0]) cube([200,200, h_b]);
    translate([0, 0, h_b]) rotate([0,90-22,0])cube([200,200, 9000]);
    translate([lg_hangar, 0, h_b]) rotate([0,-90+22,0]) translate([-200, 0])cube([200,200, 9000]);
    
}*/

module trave_b(){
    h_b = 7000;
    translate([lg_hangar, 0]) translate([-200, 0])cube([200,200, h_b]);
    translate([0, 0]) cube([200,200, h_b]);
    translate([0, 0, h_b]) rotate([0,90-22,0])cube([200,200, 9000]);
    translate([lg_hangar, 0, h_b]) rotate([0,-90+22,0]) translate([-200, 0])cube([200,200, 9000]);
    
}

lg_hangar = 20000;
l_hangar = 84000;
h1 = 5000;
h2 = 8500;

h_ = 9400;
l_ = 17500;

angle = 15;
l3 = 18000;
l4 = 3000;

travee_l1 = 6000;

module trave_wolf(){
    translate([lg_hangar, 0])cube([200,200, h2]);
    translate([0, 0])cube([200,200, h1]);
    translate([0, 0, h1]) rotate([0,90-angle,0])cube([200,200, l3]);
    translate([lg_hangar, 0, h2]) rotate([0,-90+angle,0])cube([200,200, l4]);
}

module hangar_wolf(){
    translate([0, 0, 0]) cube([lg_hangar, l_hangar, 1]);



    trave_wolf();
    translate([0, 2*travee_l1, 0]) trave_wolf();
    translate([0, 4*travee_l1, 0]) trave_wolf();
    translate([0, 6*travee_l1, 0]) trave_wolf();
    translate([0, 8*travee_l1, 0]) trave_wolf();
    translate([0, 10*travee_l1, 0]) trave_wolf();
    translate([0, 12*travee_l1, 0]) trave_wolf();
    translate([0, 14*travee_l1, 0]) trave_wolf();
    
    if(toit){
        translate([0, 0, h1]) rotate([0,-angle,0])cube([l3,l_hangar, 1]);
        translate([lg_hangar, 0, h2+220]) rotate([0,-90+angle,0])cube([1,l_hangar, l4]);
    }
    
}

module benne(angle){
    e = 1;
    camion_l = 12000*e;
    camion_lg = 2500*e;
    camion_h = 4500*e;
    camion_h1 = 1000*e;
    angle_b = 20;
    
    rotate([0,0,-90])union(){
        translate([0,0,camion_h1]) rotate([angle,0,0])difference(){
            translate([-camion_lg/2,0,0])  cube([camion_lg, camion_l, camion_h-camion_h1]);
            translate([-camion_lg/2+1,1,1])  cube([camion_lg-2, camion_l-2, camion_h-camion_h1+1]);
        }
        translate([-camion_lg/2,0,camion_h1])  cube([camion_lg, camion_l, 100]);
        translate([-camion_lg/2,2000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
        translate([-camion_lg/2,3000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
        translate([-camion_lg/2,4000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
    }
}


module benne2(){
    caisse_lg = 2500;
    caisse_l = 10500;
    caisse_h = 3500;
    caisse_h1 = 1500;
    angle = 15;
    
    translate([0, -caisse_lg/2, caisse_h1]) rotate([0, -angle, 0]) cube([caisse_l, caisse_lg, caisse_h]);
    
}


recul = 0;
if(recul == 0){
    translate([-5500, 5500]) rotate([0, 0, 9]) union(){
        hangar_wolf();
        translate([-1000, 0])  translate([5000, 3000])benne();
    }
} else {
    translate([5000, 5500])union(){
        hangar_wolf();
        translate([-1000, 0])  translate([5000, 3000])benne();
    }
}


%translate([10000, 17000, 0]) o_hangar();

//%translate([10000, 17000, 0]) translate([2000, 3000])benne();

%polygon([[0,0], [-8600, 0],  [-9600, 8000], [-0, 7800]]);

color("green")polygon([[-0, 7800], [-9600, 8000],  [-20500,72300], [-0, 78350]]);