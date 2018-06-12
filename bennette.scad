include <config.scad>
//$fs=$fs/2;
//$fa=$fa/2;

echelle = 1/10;

e1 = 80*echelle;
e2 = 40*echelle;

poid1 = 2.83;
prix1 = 10;
poid2 = 2.31;
prix2 = 7;

e1 = 50*echelle;
e2 = 30*echelle;

poid1 = 2.31;
prix1 = 8;
poid2 = 1.68;
prix2 = 5;

l = 1200*echelle;
lg = 700*echelle;
h = 600*echelle;

angle = 33;

module triangle_attelage(){
    for(i = [0,1]){
        mirror([i,0,0])translate([-730*echelle/2,-80*echelle,0]) rotate([0,30,0])
        cube([30*echelle, 80*echelle, 700*echelle]);    
    }
}

triangle_attelage();

translate([-l/2, 0,0])cube([l, e2, e1]);
translate([-l/2, 0,h-e1])cube([l, e2, e1]);
for(i = [0,1]){
    mirror([i,0,0]) translate([-l/2, 0,e1]) cube([e1, e2, h-2*e1]);
    mirror([i,0,0]) translate([-l/2, 0,0]) cube([e2, lg, e1]);
    
    mirror([i,0,0]) translate([-l/2, 0,h-e2]) cube([e2, lg, e2]);
    mirror([i,0,0]) translate([-l/2, lg-e2,e1]) cube([e2, e2, h-e1-e2]);
}

poid1=1.67;

echo("cadre 1: ");
temp1 = 2*l/echelle+2*h/echelle;
echo(temp1);
echo("cadre 2:");
temp2 = 2*lg/echelle;
echo(temp2);
temp3 = 2*(lg+h)/echelle;
echo(temp3);
temp4 = 2*(l)/echelle;
echo(temp4);


echo(((temp1+temp2)*poid1+(temp3+temp4)*poid2)/1000, "kg");
echo(((temp1+temp2)*prix1+(temp3+temp4)*prix2)/1000, "euros");