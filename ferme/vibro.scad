$fs=$fs/4;
$fa=$fa/4;

l2 =800;

l2_bis =1000;

l3 =700;

module tube(l){
    cube([40,l,40]);
}

module tube2(l){
    cube([40,l,4]);
}


module dent(){
    translate([0,0,-400])cube([40,10,400]);
}

translate([0, -l2/2]) tube(l2);

translate([0, -l2/2+20]) rotate([0,0,-90])tube(l3);
translate([0, l2/2+20]) rotate([0,0,-90])tube(l3);


inter = 115;

y1 = 200;
translate([y1, -l2/2]) tube2(l2);
for(i=[0:2]){
    translate([y1, -l2/2+50+i*inter*3]) dent();
}

y2 = 450;
translate([y2, -l2_bis/2]) tube2(l2_bis);
for(i=[0:2]){
    translate([y2, -l2/2+50-inter+i*inter*3]) dent();
}

y3 = 700;
translate([y3, -l2_bis/2]) tube2(l2_bis);
for(i=[0:2]){
    translate([y3, -l2/2+50+inter+i*inter*3]) dent();
}


y4 = 50;
l4 = 1000;
lroulo = 1200;

for(i=[0,1]){
    mirror([0,i,0]) translate([50, -l2/2+20, 60]) rotate([0,0,-90])tube(l4);
}
translate([50, l2/2+20, 60]) rotate([0,0,-90])tube(l3);

translate([50+l4, -lroulo/2, 60])tube(lroulo);

for(i=[0,1]){
    mirror([0,i,0])translate([50+l4, lroulo/2, 60]) rotate([-90,0,-90])tube(200);
}

translate([l4+70, 0, -200])roulo();

r_roulo = 200;

module roulo(){
    for(i=[0,1]){
        mirror([0,i,0])translate([0,-lroulo/2+100])    rotate([90,0,0])cylinder(r=r_roulo, 1);
    }
    rotate([90,0,0])cylinder(r=12.5, lroulo, center = true);
}





