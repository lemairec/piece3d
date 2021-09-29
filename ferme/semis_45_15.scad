$fs=$fs/4;
$fa=$fa/4;


cube([200,6000,1], center = true);

for(i=[0:11]){
    translate([0,(i-5.5)*450,1]) color("green") cube([400,10,1], center = true);
}

for(i=[0:12]){
    translate([0,(i-6)*450,1]) color("green") cube([140,100,1], center = true);
}


for(i=[-1,1]){
    translate([0,i*900,1]) color("green") cube([400,230,1], center = true);
}

for(i=[0:39]){
    translate([0,(i-19.5)*150,1]) color("blue") cube([100,10,1], center = true);
}