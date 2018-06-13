include <config.scad>
$fn = 100;

e_porte = 3;
r = 4;
r_d = 1.1;
h_axe = e_porte + 4;
h_axe_female = e_porte-h_axe+r;
    
angle_ouverture = 45;

l = 14;
l_d = 0.5;
trou_l = 40;

x_male = 10;
x_female = 15;

module little_charniere(x){
    hull(){
        translate([0,0,h_axe])rotate([0,90,0])cylinder(r=r,l, center = true);
        translate([-l/2, 0,0])cube([l, 3, 1]);
    }
    translate([-l/2, 0,0])cube([l, x, r]);
}

module male(){
    difference(){
        union(){
            little_charniere(x_male);
            hull(){
                translate([-trou_l/2, x_male, 0])cylinder (r=r,r);
                translate([trou_l/2, x_male, 0])cylinder (r=r,r);
            }
        }
        translate([0,0,h_axe])rotate([0,90,0])cylinder(r=1.6,100, center = true);
        translate([-trou_l/2, x_male, -1])cylinder (r=1.6,r+2);
        translate([trou_l/2, x_male, -1])cylinder (r=1.6,r+2);
            
    }
}

module female(){
    difference(){
        union(){
            for(i = [-1,1]){
                hull(){
                    translate([i*(l+l_d),0,h_axe_female])rotate([0,90,0])cylinder(r=r,l, center = true);
                    translate([-l/2+i*(l+l_d), 0,0])cube([l, 1, 1]);
                }
                translate([-l/2+i*(l+l_d), 0,0])cube([l, x_female, r]);
            }
            hull(){
                translate([-20, x_female, 0])cylinder (r=r,r);
                translate([20, x_female, 0])cylinder (r=r,r);
            }
            
        }
        translate([0,0,h_axe_female])rotate([0,90,0])cylinder(r=1.6,100, center = true);
        translate([-trou_l/2, x_female, -1])cylinder (r=1.6,r+2);
        translate([trou_l/2, x_female, -1])cylinder (r=1.6,r+2);
            
    }
}

module charniere(angle = 0){
    male();
    translate([0,0,h_axe]) rotate([180-angle,0,0]) translate([0,0,-h_axe_female]) female();
    % translate([-10,-30,0]) cube([20,20,e_porte]);
    %translate([0,0,h_axe])rotate([0,90,0])cylinder(r=1.5,50, center = true);
}

if(true){
    charniere(angle_ouverture);
   
} else {
   male();
   translate([0,  x_male+ x_female, r]) mirror([0,0,1]) female();
}