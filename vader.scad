$fs=$fs/4;
$fa=$fa/4;

canelure1_h = 34.5;
canelure1_d =  58;
canelure1_nbr = 11;

z_canelure2 = 41.5;

canelure2_d = 53;
canelure2_h = 5;
canelure2_nbr = 30;



canelure_body_h = z_canelure2+canelure2_h;
canelure_body_d = 28;

canelure_body_int_d = 23.5;

canelure_body_z = 13;

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

module canelure1_p(){
    c = 10;
    c1 = 4.5;
    hull(){
        translate([0,-c1/2,-c1/2])cube([c1,c1,c1]);
        translate([-2,-c/2,-c1/2])cube([1,c,c1]);
    }
}

module support_canelure(h){
    c = 10;
    c1 = 4.5;
    translate([support_e,0,0]) cube([c1-support_e,support_e,h]);
    translate([c1-support_e,-c1/2,0]) cube([support_e,c1,h]);
    
}

module canelure1(){
    cylinder(r=canelure1_d/2,canelure1_h);
    for(i=[0:canelure1_nbr]){
        rotate([0,0,i*360/canelure1_nbr])
            translate([canelure1_d/2, 0,canelure1_h/2+canelure_h]) canelure1_p();
        rotate([0,0,(i+0.5)*360/canelure1_nbr])
            translate([canelure1_d/2, 0,canelure1_h/2-canelure_h]) canelure1_p();
    }      
}

module canelure2_p(){
    c1 = 1;
    c = 3;
    h2 = canelure2_h-0.5;
    hull(){
        translate([0,-c1/2,-c1/2])cube([2,c1,c1]);
        translate([-1,-c/2,-h2/2])cube([1,c,h2]);
    }
}

module piece(support = true){
    difference(){
        union(){
            canelure1();
            cylinder(r = canelure_body_d/2, canelure_body_h);
            translate([0,0,z_canelure2]) cylinder(r = canelure2_d/2, canelure2_h);
        }
        translate([0,0,-1])cylinder(r = canelure_body_int_d/2, canelure_body_h+2, $fn=6);
    }
        
    for(i=[0:canelure2_nbr]){
        rotate([0,0,i*360/canelure2_nbr])
            translate([canelure2_d/2, 0,z_canelure2+canelure2_h/2]) canelure2_p();
    }
    
    if(support){
        support2(0);
    }
}

metal_h = 15.5;
metal_d = 25.5;

metal_support_d1 = 28.5;
metal_support_d = 30;
metal_support_e = 2;

metal_support_h = 8;
metal_support_h2 = 12.5;
metal_support_dh = metal_h- metal_support_h2;

module traceur(){
    difference(){
        union(){
            hull(){
                    translate([0,0,-1])cylinder(r = metal_d/2, metal_h+1);
                    translate([0,0,-1])cylinder(r = metal_d/2-2, metal_h+3);
                //translate([0,0,metal_h])sphere(r = metal_d/2);
            }
            
            hull(){
                translate([-metal_support_e/2,-metal_support_d/2,-1])cube([metal_support_e, metal_support_d, metal_h+1]);
                cylinder(r=10, metal_h);
            }
        }
        
        for(i=[0,1]){
            mirror([0,i,0])translate([-5,metal_support_d1/2,metal_support_h])cube([10,10,metal_support_h2-metal_support_h]);
        }
    }
    
    
    
}

module piece2(aimant, support = true){
    difference(){
        union(){
            canelure1();
            cylinder(r = canelure_body_d/2, canelure_body_h);
            translate([0,0,z_canelure2]) cylinder(r = canelure2_d/2, canelure2_h);
        }
        translate([0,0,-1])cylinder(r = canelure_body_int_d/2, canelure_body_h+2);
        
        traceur();
        if(aimant){
            for(i=[0:3]){
                rotate([0,0,90*i])translate([-48/2,0,-1])cylinder(r = 6.4/2, 21.5);
            }
        }
    }
        
    for(i=[0:canelure2_nbr]){
        rotate([0,0,i*360/canelure2_nbr])
            translate([canelure2_d/2, 0,z_canelure2+canelure2_h/2]) canelure2_p();
    }
    
    if(support){
        support2(0);
    }
}

module piece3(support = true){
    dh = 3;
    r = canelure_body_d/2+4;
    
    a = 45;
    
    support_nbr=16;
    
    difference(){
        union(){
            translate([0,0,dh])  piece2();
            for(j=[0,1]){
                for(i = [0:a]){
                    rotate([0,0,i+180*j])translate([0, -1/2, dh*i/a])
                        cube([r, 1, dh+1]);
                }
            }
            
            
        }
        translate([0,0,-1])cylinder(r = canelure_body_int_d/2, canelure_body_h+2+dh);
    }
    
    if(support){
        for(i=[canelure_body_int_d/2+support_e, r, r+5, canelure1_d/2]){
            difference(){
                cylinder(r = i, dh);
                translate([0,0,-1])cylinder(r = i-support_e, dh+2);
            }

        }
        support2(dh);
    }

}



module support2(dh=0){
    support_nbr = canelure2_nbr;
    support_h = 35; 
    difference(){
        cylinder(r = canelure1_d/2+6, support_e);
        translate([0,0,-1]) cylinder(r = canelure1_d/2+support_e, 10);
       
    }
    
    
    support_l = 10;
    for(i=[0:support_nbr]){
        rotate([0,0,i*360/support_nbr]) translate([canelure2_d/2-support_l,-support_e/2,canelure1_h+dh])cube([support_l+2, support_e, z_canelure2-canelure1_h+2]);

    }
    
    for(i=[0:canelure1_nbr]){
        rotate([0,0,i*360/canelure1_nbr])translate([canelure1_d/2, 0,0])
            support_canelure(canelure1_h/2+canelure_h+dh);
        //rotate([0,0,i*360/nbr+5]) d_cylinder(canelure1_d/2 + 6, h/2+canelure_h-4, support_e, 10);
        rotate([0,0,(i+0.5)*360/canelure1_nbr])translate([canelure1_d/2, 0,0]) support_canelure(canelure1_h/2-canelure_h+dh);
    }
    
}

module test(){
    cube([20,10,support_e]);
    for(i=[0:20/4]){
        translate([4*i,0,0])cube([support_e,10,20]);
    
    }
}

/*difference(){
    cylinder(r=18, 20);
    translate([0,0,-1])cylinder(r = canelure_body_int_d/2, canelure_body_h+2);
    traceur();
}*/
piece2(true);
