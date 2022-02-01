l = 200;
lg = 200;

h1 = 150;
h2 = 150;

z1 = 20-h1;
z2 = 22;


for(i = [-180,-90,0,90]){
    rotate([0,0,i]) translate([-l/2, lg/2-5, z1]) cube([l, 5, h1]);
    
    rotate([0,0,i]) translate([-l/2, lg/2, z1]) cube([l, 3, 30]);
    rotate([0,0,i]) translate([-l/2, lg/2, z1]) cube([l, 30, 3]);
}

for(i = [0,180,0]){
    rotate([0,0,i]) translate([-250, lg/2, 0]) cube([500, 40, 40]);
    
}

for(i = [-180,-90,0,90]){
    rotate([0,0,i]) translate([-l/2, lg/2-5, z2]) cube([l, 5, h2]);
    
    rotate([0,0,i]) translate([-l/2, lg/2, z2+h2-30]) cube([l, 3, 30]);
    rotate([0,0,i]) translate([-l/2, lg/2, z2+h2-5]) cube([l, 30, 3]);
}

%difference(){
    translate([-500, -500, -90])cube([1000,1000,90]);
    cube([270,270,1000], center = true);
}
