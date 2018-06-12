$fs=$fs/4;
$fa=$fa/4;

h = 34;

d_ext =  58;
d_int =  28;
d_int2 = 36;
d_int2_h =2;
nbr = 11;

//17, 6 ,6
canelure_h = 16/2;
support_e = 0.5;

module d_cylinder(r, h, e, angle){
    difference(){
        cylinder(r=r, h);
        translate([0, 0,-1]) cylinder(r=r-e, h+2);
        translate([-r-1, 0,-1]) cube([2*r+2, 2*r+2, h+2]);
        rotate([0,0,180-angle]) translate([-r-1, 0,-1]) cube([2*r+2, 2*r+2, h+2]);
    }
}

module canelure(){
    //cylinder(r=6,6, center = true);
    translate([0,-3,-3])cube([6,6,6]);
}

module canelure(){
    c = 10;
    hull(){
        translate([0,-3,-3])cube([6,6,6]);
        translate([-2,-c/2,-c/2])cube([1,c,c]);
    }
}

module support_canelure(h){
    c = 10;
    difference(){
        translate([support_e,-3,0])cube([6-support_e,6,h]);
        translate([0,-3+support_e,-1])cube([6+1,6-2*support_e,h+2]);
    }
}

module piece1(){
    
    difference(){
        cylinder(r=d_ext/2,h, center = true);
        cylinder(r=d_int/2,h+1, center = true);
        cylinder(r=d_int/2,h+1, center = true);
        
        for(i=[0,1]){
            mirror([0,0,i]) translate([0,0,h/2-d_int2_h])cylinder(r=d_int2/2,10);
        }
        
        for(i=[0,90]){
            rotate([0,0,i]) cube([34,5,h+1], center=true);
        }
    }
    
    h2 = h/2-3;
    for(i=[0:nbr]){
        rotate([0,0,i*360/nbr])translate([d_ext/2, 0,canelure_h]) canelure();
        rotate([0,0,(i+0.5)*360/nbr])translate([d_ext/2, 0,-canelure_h]) canelure();
    }
}



canelure2_d = 53;
canelure2_h = 5;
canelure2_nbr = 30;

canelure_body_h = 47;
canelure_body_d = 28;

canelure_body_int_d = 24;

canelure_body_z = 13;

module canelure2(){
    c1 = 1;
    c = 4;
    h2 = canelure2_h-0.5;
    hull(){
        translate([0,-c1/2,-c1/2])cube([2,c1,c1]);
        translate([-1,-c/2,-h2/2])cube([1,c,h2]);
    }
}

z_canelure2 = canelure_body_h-canelure2_h;
module piece2(){
    difference(){
        union(){
            cylinder(r=d_ext/2,h);
            cylinder(r = canelure_body_d/2, canelure_body_h);
            translate([0,0,z_canelure2]) cylinder(r = canelure2_d/2, canelure2_h);
        }
        translate([0,0,-1])cylinder(r = canelure_body_int_d/2, canelure_body_h+2, $fn=6);
    }
        
    for(i=[0:canelure2_nbr]){
        rotate([0,0,i*360/canelure2_nbr])translate([canelure2_d/2, 0,z_canelure2+canelure2_h/2]) canelure2();
    }
    
    for(i=[0:nbr]){
        rotate([0,0,i*360/nbr])translate([d_ext/2, 0,h/2+canelure_h]) canelure();
        rotate([0,0,(i+0.5)*360/nbr])translate([d_ext/2, 0,h/2-canelure_h]) canelure();
    }
}



module support2(){
    support_nbr = 36;
    support_h = 35; 
    difference(){
        cylinder(r = d_ext/2+6, support_e);
        translate([0,0,-1]) cylinder(r = d_ext/2+support_e, 10);
       
    }
    
    
    support_l = 10;
    for(i=[0:support_nbr]){
        rotate([0,0,i*360/support_nbr]) translate([canelure2_d/2-support_l,0,h])cube([support_l, support_e, z_canelure2-h]);

    }
    
    for(i=[0:nbr]){
        rotate([0,0,i*360/nbr])translate([d_ext/2, 0,0]) support_canelure(h/2+canelure_h);
        //rotate([0,0,i*360/nbr+5]) d_cylinder(d_ext/2 + 6, h/2+canelure_h-4, support_e, 10);
        rotate([0,0,(i+0.5)*360/nbr])translate([d_ext/2, 0,0]) support_canelure(h/2-canelure_h);
    }
    
}


piece2();
support2();
