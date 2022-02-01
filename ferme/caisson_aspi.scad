$fs=$fs/4;
$fa=$fa/4;

r = 2.6;
carre_l = 40;

dh=40;

ouverture = 200;
l = 1000+2*carre_l;
lg = 1000+2*carre_l;
h = 1000;
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

module tole_plie(){
    angle = 30;
    plie_l = l/cos(angle)/2;
    translate([-l/2, 0,0]) rotate([angle,0,0])cube([l,plie_l,1]);;
    translate([-l/2, 0,0]) rotate([180-angle,0,0])cube([l,plie_l,1]);;
    
}

module caisson2(){
    for(i=[0,1]){
        mirror([0,i,0])union(){
            translate([-l/2-carre_l, -lg/2-carre_l,0])  barre(h);
            translate([ l/2, -lg/2-carre_l, 0])  barre(h);
            translate([ l/2, -lg/2-carre_l, h/2-carre_l/2])  rotate([0,-90,0])barre(lg);
        }
        
        mirror([i,0,0])union(){
            translate([ l/2, -lg/2, h/2+carre_l/2])  rotate([-90,0,0])barre(lg);
        }
    }
    
     
    
    
    for(i=[0,90,180,270]){
        //color("blue")
        %rotate([90,0,i]) translate ([-l/2, 0,l/2-2]) cube([l,lg,1]);
    }
    tole_plie();
    
    
    
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