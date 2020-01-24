include <../config.scad>

resolution = 4; $fs=$fs/resolution; $fa=$fa/resolution;

LM10UU_l = 29.5;
LM10UU_r = 19/2;
e = 2;
LM10UU_re = LM10UU_r+e;
LM10UU_rouv = LM10UU_r-0.5;


tige_r = 5;

l_xy = 2*(e + 2*tige_r+LM10UU_l);
lg_xy = 40;

//tige_esp = l_xy - 2*e -2*tige_r;
tige_esp = 80;

module LMUU(){
	cylinder(LM10UU_l, r=LM10UU_r);
}


LMUU_h = 1;
module LMUU_OUT_in(buttom = 0, top = 0, e_h=1){
    l = buttom + LM10UU_l + top;
     union(){
        cylinder(l , r=LM10UU_re);
        translate([0,0,buttom]) hull(){
            translate([0,LM10UU_re,LM10UU_l/2])
                rotate([0,90,0])cylinder(2*(LM10UU_re), r=2+e, center = true);
            translate([-(LM10UU_re),0,0])cube([2*(LM10UU_re), 6, LM10UU_l]);
        }
        
    }
}


module LMUU_OUT_diff(buttom = 0, top = 0, e_h = 1, top_ = true){
    l = buttom + LM10UU_l + top;
    d_h = 2.5;
    translate([0,0,buttom]) difference(){
        translate([0,0,-e_h/2]) cylinder(LM10UU_l+e_h+top, r=LM10UU_r);
        translate([-6,-LM10UU_r,-10]) cube([12,d_h,10]);
        translate([-6,-LM10UU_r,LM10UU_l]) cube([12,d_h,1+top+e_h/2]);
    }
    translate([-LM10UU_rouv,0,-1])cube([LM10UU_rouv*2,30,l+2]);
    translate([-l/2,LM10UU_r+2,LM10UU_l/2 + buttom])rotate([0,90,0])m3(l);
    %translate([-l/2,LM10UU_r+2,LM10UU_l/2 + buttom])rotate([0,90,0])m3(l);
    
    if(top_){
        translate([0,0,-1]) cylinder(buttom+0.5-0.3, r=tige_r+1);
    } else {
        translate([0,0,-1]) cylinder(buttom+1, r=tige_r+1);    
    }
    %translate([0,0,buttom]) cylinder(LM10UU_l, r=LM10UU_r);
}

module LMUU_OUT(){
    difference(){
        LMUU_OUT_in(h);
        LMUU_OUT_diff(h);
    }

}



lg_xy = 40;
module corner(){
    de = 1;
    h = de + 3*tige_r+e;
	x = de + 2*tige_r+e;
    
    l = tige_esp + 2*(tige_r + e);
    r = 3;
    
    demi_h = l/2 - LM10UU_l -2;
	difference(){
        union(){
            translate([-10, -h]) hull(){
                translate([ lg_xy, r, -l/2]) cylinder(l, r=3);
                translate([0, r, -l/2]) cylinder(l, r=3);
                translate([lg_xy, h-r, -l/2]) cylinder(l, r=3);
                translate([0,h-r,  -l/2]) cylinder(l, r=3);
            }
        }

        
        translate([0, -2*tige_r-1, -tige_esp/2]) rotate([90,0,90]) cylinder(100, r=tige_r, center = true);
        translate([0, -2*tige_r-1, tige_esp/2]) rotate([90,0,90]) cylinder(100, r=tige_r, center = true);
    }
    //translate([-10, -10, LM10UU_l+2.3]) cube([20,10, 0.3]);
}


module middle(x_extrude){
    lg_d = 2;
	lg = 2*LM10UU_l+2*lg_d;
	h=3;
	x = 6 + LM10UU_r;
	l = tige_esp+ 15;
    pt_fan_radial = [-tige_esp/2-12,-12,-lg/2];
    pt_fan = [x_extrude,-13+27,-lg/2];
    fan_40_d = 31;
    difference(){
        union(){
            translate([-l/2,-13,-lg/2]) cube([l, h, lg]);
            mirror([0,0,1]) translate([-l/2,-13,-lg/2]) cube([l, 22, 8]);
            mirror([0,0,0]) translate([-l/2,-13,-lg/2]) cube([l, 22, 8]);
            translate([tige_esp/2, 0, 0]) LMUU_OUT_in(0.5,lg_d-0.5);
            translate([tige_esp/2, 0, -lg/2]) LMUU_OUT_in(lg_d-0.5, 0.5);
            translate([-tige_esp/2, 0, -lg/2]) LMUU_OUT_in(lg/2, lg_d);
		}
        for(i=[0,1]){
            mirror([0,0,i])translate([tige_esp/2, 0, 0]) LMUU_OUT_diff(0.5,2,2);
        } 
        translate([-tige_esp/2, 0, -lg/2]) LMUU_OUT_diff(lg/2, lg_d, 1, false);
        
        
       for(i = [0,1]){
            mirror([0,0,i]) translate([0,-50,lg/2 - 4]) rotate([-90,0,0]) m3(100);
        }
        
        
        translate([x_extrude, 0, 0]) rotate([90,0,0]) cylinder(100, r=14);
    }
}

h_fan = 44;

module xy(l, x = 0){
    l_tige = l+25;
    echo("longueur tige ", l_tige);
    translate([0,-l/2,0]) rotate([90, 0, 90])corner();
    mirror([0,1,0]) translate([0,-l/2,0]) rotate([90, 0, 90])corner();
    translate([0, x, -2*tige_r-1])rotate([-90,0,0])middle();
    %translate([tige_esp/2,-l_tige/2,-2*tige_r-1]) rotate([-90,0,0])cylinder(r=5,l_tige);
    %translate([-tige_esp/2,-l_tige/2,-2*tige_r-1]) rotate([-90,0,0])cylinder(r=5,l_tige);
}


i = 0;
if(i == 0){
    xy(200);
} else if(i == 1){
    corner();
} else if(i == 2){
    middle(false);
    //middle();
} else if(i == 3){
    radial_fan_out();
    
    //support_fan_radial();;
    //vent_fan_radial(44);
} else if(i == 4){
    rotate([-180,0,0])vent_fan_radial(44);
}

//corner();
//translate([0,90+2,0]) mirror([0,1,0]) corner();
//translate([0,2*lg_xy+4,0])middle();
