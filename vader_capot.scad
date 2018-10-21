$fs=$fs/4;
$fa=$fa/4;

lg = 55;
e = 1.5;

x1 = 53;
x1_2 = x1+13;
x2 = -15;
y2 = 100;

angle = atan((x1-x2)/y2);
angle2 = atan(x2/y2);

echo(angle3);
echo(angle2);

droite_h = 2.8;
module droite(){
    droite_r = 58/2;
    difference(){
        cylinder(r = droite_r, droite_h);
        translate([0, 0,-1]) cylinder(r = droite_r-4, 10);
        
        translate([0, 0,-1])  rotate([0,0,120])cube([200,200,200]);
        //translate([0, -100,-1]) cube([200,200,200]);
    }
}

module gauche(){
    gauche_e = 2;
    gauche_pt1 = [0, 14,0];
    gauche_pt2 = [0, 6,10];
    gauche_pt3 = [0, 7,34];
    gauche_pt4 = [0, -6,32];
    hull(){
        translate(gauche_pt1)  cube([gauche_e,0.1,0.1]);
        translate(gauche_pt2)  cube([gauche_e,4,0.1]);
    }
    
    hull(){
        translate(gauche_pt2)  cube([gauche_e,4,0.1]);
        translate(gauche_pt3) rotate([0,90,0]) cylinder(r=2, gauche_e);
    }
    hull(){
        translate(gauche_pt3) rotate([0,90,0]) cylinder(r=2, gauche_e);
        translate(gauche_pt4) rotate([0,90,0]) cylinder(r=2, gauche_e);
    }
}

canelure_pt = [0,-22,36];
canelure_r = 68/2;

e2=2.5;

e_bas = 3;
difference(){
    union(){
        hull(){
            translate([-lg/2, 0,0]) cube([lg,0.1,0.1]);
            translate([-lg/2, x2,y2]) cube([lg,0.1,0.1]);
            
            translate([-lg/2, x1,0]) cube([lg,0.1,0.1]);
            
            translate([0, x1_2,0]) rotate([angle,0,0])  cylinder(r=0.1, 160);
        }
        
        
        hull(){
            translate([-lg/2-e_bas, 10,0]) cube([10,0.1,0.1]);
            translate([-lg/2, 10,e_bas]) cube([10,0.1,0.1]);
            
            translate([-lg/2, 35,0]) cube([lg+e_bas,0.1,0.1]);
            translate([-lg/2, 35,e_bas]) cube([lg,0.1,0.1]);
            
            translate([0, x1+e_bas/2,0]) cube([lg+2*e_bas,0.1,0.1], center = true);
            translate([0, x1_2+e_bas,0]) rotate([angle,0,0])  cylinder(r=0.1, 0.1);
            
            translate([0, x1-2,e_bas]) cube([lg,0.1,0.1], center = true);
            translate([0, x1_2,0]) rotate([angle,0,0])  cylinder(r=0.1, e_bas);
        }
        
        translate([-e2/2, x1_2,-1]) rotate([angle,0,0]) translate([0,0,20]) hull(){
            cube([e2,0.1,65]);
            translate([0, 0,11]) cube([e2,7,20]);
        }
        
        translate([-lg/2-droite_h,0,0]) translate(canelure_pt)  rotate([0,90,0]) droite();
        translate([lg/2, 0,0]) gauche();
        %translate([-lg, 0 ,49]) cube([lg,1,1]);;
        
    }
    
    %translate(canelure_pt) rotate([0,90,0]) cylinder(r=canelure_r,34, center=true);
    translate(canelure_pt) rotate([0,90,0]) cylinder(r=canelure_r+1,lg-2*e, center=true);
    translate([-lg/2+e, -18,30]) rotate([angle,0,0]) cube([lg-2*e,40,100]);
    translate([-lg/2+e, 8,-15]) rotate([-angle2+20,0,0]) cube([lg-2*e,16,30]);
    translate([0, -1,0]) rotate([45,0,0]) cube([lg+2,6,6], center=true);
    
    translate([-100, 0,-10]) cube([200,200,10]);
    
    rotate([-angle2,0,0]) translate([-100, -100,0])cube([200,100,200]);
        
}

e_support = 0.3;
translate([-lg/2-5, -5,0]) cube([lg+10,10,e_support]);

translate([-lg/2-2.5, -5,0]) cube([e_support, 10,15]);
translate([lg/2+1.5, -5,0]) cube([e_support, 9,32]);
