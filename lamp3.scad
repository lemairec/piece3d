e = 2.9;
de = 0.35;
//$fn=50;

module male(l){
    difference(){
        translate([-l/2-e, -e/2]) square([l/2+e,e]);
        for(i=[0,1]){
            //mirror([0,i])translate([-l/4, e/2]) circle(de, $fn=16);
        }
    }
}

module female(l){
    translate([0, -e/2]) square([l/2+e,e]);
    //translate([-l/4, -e/2]) square([de,e]);
}

module test(){
    translate([-21,0]) difference(){
        square([40,40], center = true);
        male(40);
    }

    translate([21,0]) difference(){
        square([40,40], center = true);
        female(40);
    }
}

lamp_r = 250/2;
nb_face = 12;
lamp_r2 = 90/2;
douille_r = 40/2;
angle = 20;

h1 = 150;
h2 = 50;
x1 = 50;
x2 = 120;

l1 = 10;
l2 = 10;



module center(){
    difference(){
        circle(lamp_r);
        for(i=[0:nb_face-1]){
            rotate([0,0,i*360/nb_face]) translate([lamp_r-l1/2,0,0]) female(l1);
        }
        circle(lamp_r-l1);
    }
}

module center2(){
    difference(){
        circle(lamp_r2);
        circle(douille_r);
    }
}



module cote_e(r){
    hull(){
        translate([-x1,h2]) circle(r);
        translate([x1,h2]) circle(r);
        translate([-x2,-h1]) circle(r);
        translate([x2,-h1]) circle(r);
        translate([0,-h1-50]) circle(r);
    }
}


e2= 6;
r= 50;
module cote(){
    angles = [16, 26, 40, 61, 89, 117.5, 138.5, 153];
    //angles = [16, 26.5];

    difference(){
        
        cote_e(50);
        cote_e(50-20);
        
        for(i=[0,1]){
            mirror([i,0,0])rotate([0,0,18]) square([30,1000]);
            mirror([i,0,0])rotate([0,0,180-15]) square([30,1000]);
        }
        translate([0,-h1-r])square([160,100], center = true);
        translate([0,h2+r])square([x1-27,100], center = true);

        intersection(){
            union(){
                for(a = angles){
                    rotate([0,0,a]) translate([-e2/2,0,0])square([e2,250]);
                }
            }
            cote_e(50-10);
        }
        
        difference(){
            union(){
                for(a = angles){
                    rotate([0,0,-a]) translate([-e2/2,0,0])square([e2,250]);
                }
            }
            cote_e(50-10);
        }


    }
}

if(true){
    translate([0,0,90-angle])center2();
    for(i=[0:nb_face-1]){
            rotate([0,0,i*360/nb_face])rotate([60,0,0]) linear_extrude(height = 3)cote();
    }
} else {
    translate([-170,0]) center2();
    cote();
}
