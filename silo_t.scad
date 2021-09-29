$fs=$fs/4;
$fa=$fa/4;

boitier_l = 70;
boitier_lg = 70;
h=15;

module cube_arrondi(l,lg,h,r){
    hull(){
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*l/2, j*lg/2]) cylinder(r=r,h);
            }
        }
    }
}

module down(h){

    difference(){
        union(){
            difference(){
                cube_arrondi(boitier_l, boitier_l, h,4);
                
                translate([0,0,1]) cube_arrondi(boitier_l, boitier_l, h,2.5);
            } 

            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*30, j*30]) cylinder(r=4,3);
                }
            }
        }
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*30, j*30,-1]) cylinder(r=1.5,10);
            }
            for(j=[-1,1]){
                translate([i*35, j*35,-1]) cylinder(r=1.5,10);
            }
        }
        translate([0, -20, 3]) cube([boitier_l,4,h]);
        for(i=[-1:1]){
            translate([-2+20*i, 0, 3]) cube([4,boitier_l,h]);
        }
    }
}

module up(h){

    difference(){
        union(){
            difference(){
                cube_arrondi(boitier_l, boitier_l, h,4);
                
                translate([0,0,1]) cube_arrondi(boitier_l, boitier_l, h,2.4);
            } 

            for(i=[-1,1]){
                for(j=[-1,1]){
                    translate([i*35, j*35]) cylinder(r=2.4,h+2);
                }
            }
        }
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*30, j*30,-1]) cylinder(r=1.5,h+4);
            }
            for(j=[-1,1]){
                translate([i*35, j*35,-1]) cylinder(r=1.5,h+4);
            }
        }
    }
}

mode=1;
if(mode == 1){
    up(20);
} else {
    down(10);
} 

