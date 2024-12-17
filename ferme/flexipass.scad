use <libs/threads.scad>
$fs=$fs/4;
$fa=$fa/4;


l_batti = 3000;
lg_batti = 600;

e = 120;





module dent60(){
    for(i=[0:5]){
        color("blue") translate([-600*(i-2.5)-50,0,0]) cube([100,100,600]);
    }
}

module dent(){
    translate([-l_batti/2,0,0]) cube([l_batti,e,e]);
    translate([-l_batti/2,1000,0]) cube([l_batti,e,e]);
}

module batti(){
    translate([-l_batti/2,0,0]) cube([l_batti,e,e]);
    translate([-l_batti/2,lg_batti,0]) cube([l_batti,e,e]);
    
    translate([450-50,-100,-100]) cube([20,250,250]);
    translate([450+50,-100,-100]) cube([20,250,250]);
    translate([-450-50,-100,-100]) cube([20,250,250]);
    translate([-450+50,-100,-100]) cube([20,250,250]);
    
    translate([-50,-100,500]) cube([20,250,250]);
    translate([+50,-100,500]) cube([20,250,250]);
    
    
    translate([-e/2,0,0]) cube([e,e,750]);
    translate([-e/2,lg_batti,0]) rotate([55,0,0]) cube([e,e,1200]);
    
    
    translate([1000-150,00,0]) cube([e,lg_batti,e]);
    translate([-1000,0,0]) cube([e,lg_batti,e]);
}


module plaque_dent(){
    hull(){
        translate([-125,-20,0]) cube([250,150,20]);
        translate([0,180,0]) cylinder(r=20,20);
    }
    
    
}

module support_dent2(){
    translate([-10-20,0,0]) cube([20,250,100]);
    translate([0,0,0]) cylinder(r=20,100);
    translate([-10+20,0,0]) cube([20,250,100]);
    
    translate([-50,70,100]) cube([100,180,20]);
}

module support_dent3(){
    rotate([-10,0,0])union(){
        translate([0,200,-400]) cube([20,180,500]);
        translate([0,200,-100]) cube([20,250,50]);
    }
}

module support_dent4(){
    translate([-10-20,150,125]) cube([20,100,150]);
    translate([-10+20,150,125]) cube([20,100,150]);
    translate([-50,70,125]) cube([100,180,20]);
    translate([0,300,125]) cylinder(r=40, 250);
    translate([0,300,125-250]) cylinder(r=20, 250);
}

module dent(){
    color("green") translate([0,0,100]) plaque_dent();
    color("green")translate([0,0,-20]) plaque_dent();
    color("blue")translate([0,150,0])support_dent2();
    
    
    color("gray")support_dent3();
    %translate([0,150,0])support_dent4();
}


module dent45(){
    for(i=[0:2]){
        translate([-900*(i-1.25)-50,0,0]) dent();
        translate([-900*(i-0.75)-50,lg_batti,0]) dent();
    }
}

module dent50(){
    for(i=[0:2]){
        color("blue") translate([-1000*(i-1.25)-50,0,0]) dent();
        color("blue") translate([-1000*(i-0.75)-50,lg_batti,0]) dent();
    }
}

batti();
dent45();
dent50();
///dent60();

