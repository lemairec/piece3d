$fs=$fs/4;
$fa=$fa/4;

l = 2000;
a1 = 25;
a2 = 90-a1;

l2 = 3*800;
x = sin(a1)*l+sin(a2)*l;
y2 = cos(a1)*l;

module toto(){
    cube([40,40,l]);
    translate([0, 0,l-200]) cube([40,l2,40]);
    translate([0, l2,0]) cube([40,40,l]);
}

for(i=[0,1]){
    mirror([i,0,0])translate([-x, 0,0])union(){
        rotate([0,a1,0]) toto();

        translate([sin(a1)*l, 0,cos(a1)*l])rotate([0,a2,0])toto();
    }
}
translate([y2, 0, 0])cube([40,40,y2]);

echo(l2);
echo(2*x/1000);
echo(y2);



echo((3*3+4*4*2)/6*40); //40

echo(3*4*12);


echo((4*3+4*2*2)/6*40); //40