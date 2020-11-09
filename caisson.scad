$fs=$fs/4;
$fa=$fa/4;

r = 2.6;
l = 920;
lg = 920;
h = 1000;
h2 = 300;


carre_l = 40;

module tole(){
    rotate([20,0,0]) hull(){
        translate ([-100, 0,0]) cube([200,1,1]);
        translate ([-l/2, 470,0]) cube([l,1,1]);
        
    }
}

module barre(l){
    cube([carre_l, carre_l, l]);
}

module barre2(l){
    translate([-100,0,0])cube([200,l,  100]);
}

module caisson(){
    for(i=[0,1]){
        mirror([0,i,0])union(){
            translate([-l/2-carre_l, -lg/2-carre_l, 0])  barre(h);
            translate([ l/2, -lg/2-carre_l, 0])  barre(h);
            translate([ l/2, -lg/2-carre_l, 100])  rotate([0,-90,0])barre(lg);
            translate([ l/2, -lg/2-carre_l, h2])  rotate([0,-90,0])barre(lg);
        }
    }


    translate([-320, -l/2-carre_l, 00]) barre2(lg+2*carre_l);
    translate([ 320, -l/2-carre_l, 00]) barre2(lg+2*carre_l);


    support_moteur2();

    cube([200,200,2], center = true);

    for(i=[0,90,180,270]){
        rotate([0,0,i]) translate ([0, 100,0]) rotate([20,0,0]) tole();
    }
}


caisson();

v = l*lg*(h-h2)/1000000;
v2 = (l+200)*(lg+200)*h2/3/1000000;
v3 = v+v2;
echo(v3);