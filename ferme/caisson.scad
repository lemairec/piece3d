$fs=$fs/4;
$fa=$fa/4;

r = 2.6;
carre_l = 40;

dh=40;

ouverture = 200;
l = 1250-2*carre_l;
lg = 1250-2*carre_l;
h = 1050;
h2 = 400;

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


module tole(){
    rotate([0,0,0]) hull(){
        translate ([-ouverture/2, 0,0]) cube([ouverture,1,1]);
        translate ([-l/2, cone_l,0]) cube([l,1,1]);
        
    }
}



module tole_plie(b){
    translate([-l/2, 0, 0])cube([l,h3,1]);
    difference(){
        translate([l/2, 40, 0])cube([50,600-70,1]);
        translate([l/2+20, 70, 0])cylinder(r=5,300, center = true);
        translate([l/2+20, 300, 0])cylinder(r=5,300, center = true);
        translate([l/2+20, 540, 0])cylinder(r=5,300, center = true);
    }
    translate([-l/2, 0, 0]) rotate([0,b*-90,0]) translate([-50,0,0])cube([50,600,1]);
    rotate([b*(90-cone_a),0,0]){
        translate([0, -cone_l, 0])tole();
        translate([100, -cone_l, 0]) rotate([0, 50*b, -38]) 
            translate([0, 100, 0]) cube([50,600,1]);
    }
    if(!b){
        %translate([-500, -cone_l, 0])cube([1000,2000,1]);
        translate([-500, h3, 0])cube([1000,h3,1]);
    }
}

module barre(l){
    cube([carre_l, carre_l, l]);
}

module barre2(l){
    translate([-100,0,0])cube([200,l,  100]);
}

module barre3(l){
    translate([0,0,0])cube([30,30, l]);
}

module caisson(){
    for(i=[0,1]){
        mirror([0,i,0])union(){
            translate([-l/2-carre_l, -lg/2-carre_l,0])  barre(h);
            translate([ l/2, -lg/2-carre_l, 0])  barre(h);
            translate([ l/2, -lg/2-carre_l, 0])  rotate([0,-90,0])barre(lg);
            translate([ l/2, -lg/2-carre_l, dh+100])  rotate([0,-90,0])barre(lg);
            translate([ l/2, -lg/2-carre_l, dh+h2])  rotate([0,-90,0])barre(lg);
            translate([ l/2, -lg/2-carre_l, h-carre_l])  rotate([0,-90,0])barre(lg);
        }
        
        mirror([i,0,0])union(){
            translate([ l/2, -lg/2, dh+h2+carre_l])  rotate([-90,0,0])barre(lg);
            translate([ l/2, -lg/2, h])  rotate([-90,0,0])barre(lg);
        }
    }

    l2=330;
    translate([-l2, -l/2-carre_l, dh]) barre2(lg+2*carre_l);
    translate([ l2, -l/2-carre_l, dh]) barre2(lg+2*carre_l);


    support_moteur2();

    //cube([200,200,2], center = true);

    for(i=[0,90,180]){
        color("blue")rotate([90,0,i]) translate ([0, h2+dh,l/2-2]) tole_plie(1);
    }
    
    
    //bas
    bas_l = 860;
    bas_l2 = 450;
    for(i=[0,1]){
        mirror([0,i,0])union(){
            translate([bas_l/2, 100,0])  rotate([0,-90,0])barre(bas_l);
            translate([bas_l/2, 70,0])  rotate([0,-90,0])barre3(bas_l);
            //translate([bas_l2/2, 100+carre_l,carre_l])  rotate([0,-90,0])barre(bas_l2);
        }
    }
    
}

module tole1(){
    hull(){
        translate ([-ouverture/2, 0,0]) cube([ouverture,1,1]);
        translate ([-l/2, h2+dh,0]) cube([l,1,1]);
    }
}

module tole2(){
    hull(){
        translate ([0, 0,0]) cube([1,1,1]);
        translate ([0, 650,0]) cube([l,1,1]);
    }
}

module tole3(){
    hull(){
        translate ([-ouverture/2, 0,0]) cube([ouverture,1,1]);
        translate ([-l/2, 1230,0]) cube([l,1,1]);
    }
}

module toles(){
    translate([20,0,0])rotate([0,0,-90])tole3();
    tole2();
    mirror([0,1,0])tole2();
}


module caisson2(){
    for(i=[0,1]){
        mirror([0,i,0])union(){
            translate([-l/2-carre_l, -lg/2-carre_l,0])  barre(h);
            translate([ l/2, -lg/2-carre_l, 0])  barre(h);
            //%translate([ l/2, -lg/2-carre_l, 100])  rotate([0,-90,0])barre(lg);
            translate([ l/2, -lg/2-carre_l, h2])  rotate([0,-90,0])barre(lg);
            translate([ l/2, -lg/2-carre_l, h-carre_l])  rotate([0,-90,0])barre(lg);
        }
        
        mirror([i,0,0])union(){
            translate([ l/2, -lg/2, h2+carre_l])  rotate([-90,0,0])barre(lg);
            translate([ l/2, -lg/2, h])  rotate([-90,0,0])barre(lg);
        }
    }
    
    mirror([0,1,0])translate([ l/2, -lg/2-carre_l, 100])  rotate([0,-90,0])barre(lg);
    
    for(i=[0,1]){
        mirror([i,0,0]) translate([ l/2, -lg/2-carre_l, 100])  rotate([0,-90,0])barre(lg/2-ouverture/2);
        mirror([i,0,0]) translate([ ouverture/2, -lg/2-carre_l, 0])barre(h2);
    }

    l2=350;
    translate([-l2, -l/2-carre_l, 0]) barre2(lg+2*carre_l);
    translate([ l2, -l/2-carre_l, 0]) barre2(lg+2*carre_l);

    for(i=[0,90,180]){
        color("blue")rotate([90,0,i]) translate ([-l/2, h2+dh,l/2-2]) cube([l,600,1]);
    }
    
    color("blue")rotate([90,0,i]) translate ([0,0 ,l/2-2]) tole1();
    for(i=[0,1]){
        mirror([i,0,0]) color("blue")translate ([-ouverture/2,-l/2 , 0]) rotate([42,0,90]) tole2();
    }
    
    color("blue")translate ([0,-l/2 ,0])  rotate([20,0,0]) tole3();
    
    
    
}

mode=0;
if(mode ==0){
    caisson2();
} else {
    tole_plie(0);
}

v = l*lg*h3/1000000;
v2 = l*lg*h2/3/1000000;
v3 = v+v2;
echo("l", l, " lg ", lg, " h ", h);
echo("volume", v3, " pd ", (v3*0.7));
echo("hauteur",(h3/10), " conne l", cone_l/10);