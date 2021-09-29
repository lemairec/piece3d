$fs=$fs/4;
$fa=$fa/4;

r = 2.6;
carre_l = 40;

dh=40;

lg = 300;
l = 300;
h = 400;

cone_l = 600;
cone_a = 36;

ouverture = 200;
/*l = 1000-2*carre_l;
lg = 1000-2*carre_l;
h = 1000;
h2 = 300;

cone_l = 470;
cone_a = 40;*/

/*ouverture = 150;
l = 1150;
lg = 1150;
h = 1050;
h2 = 450;

cone_l = 650;
cone_a = 40;*/

h3 = h-h2-dh;
r =40;


module tole(){
    rotate([0,0,0]) hull(){
        translate ([-ouverture/2, 0,0]) cube([ouverture,1,1]);
        translate ([-l/2, cone_l,0]) cube([l,1,1]);
        
    }
}

for(i = [0:4]){
    %rotate([0,0,90*i]) translate ([-lg/2, -lg/2, 0]) cube([lg, 1, h]);
}

translate ([0, 0, 200])  rotate([90,0]) cylinder(r = r, lg, center = true);

translate ([-15, 0, 200+r])  rotate([0,60])  translate ([0, -lg/2, 0]) cube([1, lg, 200]);
translate ([15, 0, 200-r-15])  rotate([0,-60])  translate ([0, -lg/2, 0]) cube([1, lg, 200]);

translate ([lg/2, 0,50])  rotate([0,-70])  translate ([0, -lg/2, 0]) cube([1, lg, 330]);
translate ([lg/2, 0,100])  rotate([0,-40])  translate ([0, -lg/2, 0]) cube([1, lg, 200]);

//square([500,400]);