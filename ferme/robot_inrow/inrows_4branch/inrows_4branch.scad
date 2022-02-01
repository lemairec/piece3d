use <4040.scad>;
use <../../libs/gears.scad>
use <../../config.scad>

e = 5;

modul = 3; tooth_number1 = 26; tooth_number2 = 60; //old 60

pressure_angle = 20;
//pressure_angle = 20;
helix_angle = 0;

x_truc = 80;

l = 130;
lg = 95;

module pignon2(){
    difference(){
        spur_gear (modul=modul, tooth_number=tooth_number1, width=12, bore=2, pressure_angle=pressure_angle, helix_angle=helix_angle, optimized=false);
        translate([0,0,-1])cylinder(r=4.5, 35, $fn=16);
        translate([0,0,5])cylinder(r=58/2, 35);
        
        //translate([7,0,20])rotate([0,-90,0])m3_nut(10);
        //translate([0,0,20])rotate([0,90,0])m3(20);
        
        for(i=[0:6]){
            rotate([0,0,i*60]) translate([24,0,-1])cylinder(r=5/2, 35);;
        }
    }

}
module pignon3(){
    h = 16;
    difference(){
        translate([0,0,0])cylinder(r=70/2, h);
        
        translate([0,0,-1])cylinder(r=4.5, 35);
        
        for(i=[0:6]){
            rotate([0,0,i*60]) translate([24,0,-1])cylinder(r=5/2, 35);;
        }
        
        for(i=[0:6]){
            translate([0,0,h/2]) rotate([0,-90,30+i*60]) translate([0,0,22]) support_nut(8, 20,20);;
            translate([0,0,h/2]) rotate([90,0,i*60]) translate([0,0,-5]) m8(100);;
        }
    }

}


module moteur(){
    union(){
        translate([-30,-30,0]) cube([90,60,e]);
        for(i = [-1,1]){
            translate([i*20, -20, 0]) cylinder(r=2.5,10);
            translate([i*20, 20, 0]) cylinder(r=2.5,10);
        }
        translate([-20, 0, 0]) cylinder(r=5,8);
        translate([-20, 0, 0]) cylinder(r=4,12);
        translate([40, 0, -50]) cylinder(r=20,50);
    }
}

x_moteur = 20;

module support_moteur(){

    difference(){
        union(){
            translate([-30,-60,0]) cube([l,lg,e]);
            translate([x_truc, 20,e/2-6]) cylinder(r=25/2,6);
        }
    
    
        for(i = [-1,1]){
            translate([i*20, -20,-1]) cylinder(r=2.5,e+2);
            translate([i*20, 20,-1]) cylinder(r=2.5,e+2);
        }
        translate([0, 20,-1]) cylinder(r=5,e+2);
        translate([x_truc, 20,-1]) cylinder(r=5,e+2);
        translate([x_truc-15, 20,-1]) cylinder(r=2,e+2);
        translate([x_truc+15, 20,-1]) cylinder(r=2,e+2);
        translate([x_truc, 20,e/2-7]) cylinder(r=22.5/2,7);
        
        translate([-30+10, -50,-1]) cylinder(r=4.5,e+2);
        translate([30+10, -50,-1]) cylinder(r=4.5,e+2);
        translate([-30+120-10, -50,-1]) cylinder(r=4.5,e+2);
    }
}

module support_bas(){

    difference(){
        union(){
            translate([-30,-60,0]) cube([l,lg,e]);
            translate([x_truc, 20,e/2]) cylinder(r=25/2,6);
        
        }
    
    
        translate([0, 20,-1]) cylinder(r=5,e+2);
        translate([x_truc, 20,-1]) cylinder(r=5,e+2);
        translate([x_truc, 20,e/2]) cylinder(r=22.5/2,7);
        translate([x_truc-15, 20,-1]) cylinder(r=2,e+2);
        translate([x_truc+15, 20,-1]) cylinder(r=2,e+2);
        
        translate([-30+10, -50,-1]) cylinder(r=4.5,e+2);
        translate([-30+120-10, -50,-1]) cylinder(r=4.5,e+2);
    }
}

module support_angle(){
    h_sup =32+e;
    difference(){
        union(){
            hull(){
                translate([-15, 0,0]) cylinder(r=4,e);
                translate([+15, 0,0]) cylinder(r=4,e);
                translate([0, 0,0]) cylinder(r=22.5/2,e);
            
            }
            translate([-15, 0,0]) cylinder(r=4,h_sup);
            translate([+15, 0,0]) cylinder(r=4,h_sup);
        }
        translate([-15, 0,-1]) cylinder(r=1.7,h_sup+5);
        translate([+15, 0,-1]) cylinder(r=1.7,h_sup+5);
        translate([0, 0,-1]) cylinder(r=4,10);
    }
}

mode=4;
if(mode==0){
    translate([-100,-50,0])rotate([0,90,0])barre4040(200);

    translate([0,0,20]) support_moteur();
    translate([0,0,30]) rotate([-180,0,-90])%moteur();
    translate([0,0,-25]) support_bas();

    translate([0,20,0])pignon2();
    translate([x_truc,20,0]) rotate([0,0,360/(26*2)])pignon2();
    
    translate([x_truc,20,-60]) rotate([0,0,360/(26*2)])pignon3();
} else if(mode==1){
    rotate([0,180, 0])translate([0,0,0]) support_moteur();
} else if(mode==2){
     support_bas();
} else if(mode==3){
     pignon2();
} else if(mode==4){
     pignon3();
} else if(mode==5){
     support_angle();
}