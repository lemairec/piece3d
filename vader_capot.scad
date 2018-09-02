$fs=$fs/4;
$fa=$fa/4;

lg = 55;
e = 1.5;

x1 = 40;
x2 = -15;
y2 = 100;

angle = atan((x1-x2)/y2);
angle2 = atan(x2/y2);

echo(angle3);
echo(angle2);

droite_h = 3;
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
    gauche_pt2 = [0, 6,10];
    gauche_pt3 = [0, 6,31];
    gauche_pt4 = [0, -6,29];
    hull(){
        translate([0, 13,0])  cube([gauche_e,0.1,0.1]);
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

canelure_pt = [0,-23,36];
canelure_r = 68/2;

e2=2.5;
difference(){
    union(){
        hull(){
            translate([-lg/2, 0,0]) cube([lg,0.1,0.1]);
            translate([-lg/2, x2,y2]) cube([lg,0.1,0.1]);
            
            translate([-lg/2, x1,0]) cube([lg,0.1,0.1]);
            
            translate([0, 53,0]) rotate([angle,0,0])  cylinder(r=0.1, 160);
            
            
        }
        translate([-e2/2, 53,-1]) rotate([angle,0,0]) translate([0,0,20]) hull(){
            cube([e2,0.1,65]);
            translate([0, 0,11]) cube([e2,5,12]);
        }
        
        translate([-lg/2-droite_h,0,0]) translate(canelure_pt)  rotate([0,90,0]) droite();
        translate([lg/2, 0,0]) gauche();
        %translate([-lg, 0 ,49]) cube([lg,1,1]);;
        
    }
    
    %translate(canelure_pt) rotate([0,90,0]) cylinder(r=canelure_r,34, center=true);
    translate(canelure_pt) rotate([0,90,0]) cylinder(r=canelure_r+1,lg-2*e, center=true);
    translate([-lg/2+e, -25,30]) rotate([angle,0,0]) cube([lg-2*e,40,100]);
    translate([-lg/2+e, -2,-10]) rotate([10,0,0]) cube([lg-2*e,16,30]);
    
    translate([-100, 0,-10]) cube([200,200,10]);
    
    rotate([-angle2,0,0]) translate([-100, -100,0])cube([200,100,200]);
        
}

