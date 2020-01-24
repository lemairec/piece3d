$fs=$fs/2;
$fa=$fa/2;

ep = 30;
l=600;
h = 1600;
l2 = l/4*1.5;


 

translate([-l/2, -ep/2, 0]) cube([l,ep,ep]);
translate([-ep/2, -l/2, 0])cube([ep,l,ep]);


translate([-ep/2, -ep/2, 0])cube([ep,ep,h]);

translate([-ep/2, -100, h])cube([ep,200,ep]);

for(i=[0:3]){
    rotate([0,0,90*i])translate([-l/4, -ep/2,0]) rotate([0,-45, 0]) cube([l2,ep,ep]);
}

for(i=[0:3]){
    rotate([0,0,90*i])translate([-l/2+2*ep,0,0]) rotate([0,180, 0]) cylinder(200, ep/2, 4);
}

echo(l2,"4x");
echo(l,"1x");
echo(l/2,"2x");
echo(h)
echo(200);

echo(4*l2+2*l+h+200);