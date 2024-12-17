
o_hangar_lg=10000;
o_hangar_l=55000;
o_hangar_h=6000;
o_hangar_t = 5000;

toit = true;

module o_trave(){
    translate([0/2, 0])cube([200,200, o_hangar_h]);
    translate([o_hangar_lg, 0])cube([200,200, o_hangar_h]);
    translate([0, 0, o_hangar_h]) rotate([0,90-30,0])cube([200,200, 5600]);
    translate([o_hangar_lg+3000, 0, 5000]) rotate([0,-90+25,0])cube([200,200, 9000]);
}


module o_hangar(){
    translate([0, 0, 0]) cube([o_hangar_lg,        o_hangar_l, 1]);
    for(i=[0:11]){
        translate([0, i*o_hangar_t, 0]) o_trave();
    }
    
    if(toit){
        translate([0, 0, o_hangar_h]) rotate([0,-30,0])cube([5600,o_hangar_l, 1]);
        translate([o_hangar_lg+3000, 0, 5000+200]) rotate([0,180+25,0])cube([9000,o_hangar_l, 1]);
    }
}

module o_hangar_bas(){
    translate([0, 0, 0]) cube([o_hangar_lg, o_hangar_t*4-500, 1]);
    translate([0, o_hangar_t*4, 0]) cube([o_hangar_lg, o_hangar_t-500, 1]);
    translate([0, o_hangar_t*5, 0]) cube([o_hangar_lg, o_hangar_t*6, 1]);
}

module o_hangar2(){
    translate([0, 0, 0]) cube([o_hangar_lg, o_hangar_t*4-500, 1]);
    
    translate([0, o_hangar_t*4, 0]) union(){
        cube([o_hangar_lg, o_hangar_t*7, 1]);
        for(i=[0:7]){
            translate([0, i*o_hangar_t, 0]) o_trave();
        }
        
        if(toit){
            translate([0, 0, o_hangar_h]) rotate([0,-30,0])cube([5600,o_hangar_t*7, 1]);
            translate([o_hangar_lg+3000, 0, 5000+200]) rotate([0,180+25,0])cube([9000,o_hangar_t*7, 1]);
        }
    }
}





/*module trave_m(){
    translate([lg_hangar, 0])cube([200,200, h2]);
    translate([0, 0])cube([200,200, h1]);
    translate([0, 0, h1]) rotate([0,90-angle,0])cube([200,200, l3]);
    translate([lg_hangar, 0, h2]) rotate([0,-90+angle,0])cube([200,200, l4]);
    
}*/

/*module trave_b(){
    h_b = 7000;
    translate([lg_hangar, 0]) translate([-200, 0])cube([200,200, h_b]);
    translate([0, 0]) cube([200,200, h_b]);
    translate([0, 0, h_b]) rotate([0,90-22,0])cube([200,200, 9000]);
    translate([lg_hangar, 0, h_b]) rotate([0,-90+22,0]) translate([-200, 0])cube([200,200, 9000]);
    
}*/

h_b = 6000;
nb_travee = 7;
lg_hangar_b = 24000;
travee_l_b = 12000;
angle_b = 22/100*90;
l_toit_b = 11500;
l_hangar_b = nb_travee*travee_l_b;


module trave_b(){
    translate([lg_hangar_b, 0]) translate([-200, 0])cube([200,200, h_b]);
    translate([0, 0]) cube([200,200, h_b]);
    translate([0, 0, h_b]) rotate([0,90-angle_b,0])cube([200,200, l_toit_b]);
    translate([lg_hangar_b, 0, h_b]) rotate([0,-90+angle_b,0]) translate([-200, 0])cube([200,200, l_toit_b]);
    
}

module hangar_bipente(){
    for(i =[0:nb_travee]){
        translate([0, i*travee_l_b, 0]) trave_b();
    
    }
    if(toit){
        translate([0, 0, h_b]) rotate([0,-angle_b,0])cube([l_toit_b,l_hangar_b, 1]);
        translate([lg_hangar_b, 0, h_b]) rotate([0,-90+angle_b,0])cube([1,l_hangar_b, l_toit_b]);
    }
    
}


lg_hangar_m = 24000;
h1_m = 5000;
h2_m = 8500;

h_m_ = 9400;
l_m_ = 17500;

angle_m = 15;
l3_m = 20000;
l4_m = 6000;

travee_l1_m = 12000;
nb_travee_m = 4;
l_hangar_m = travee_l1_m*nb_travee_m;


module trave_m(){
    translate([lg_hangar_m, 0])cube([200,200, h2]);
    translate([0, 0])cube([200,200, h1]);
    translate([0, 0, h1]) rotate([0,90-angle,0])cube([200,200, l3_m]);
    translate([lg_hangar_m, 0, h2]) rotate([0,-90+angle,0])translate([0,0,-1000])cube([200,200, l4_m]);
}

module hangar_m(){
    ///translate([0, 0, 0]) cube([lg_hangar, l_hangar, 1]);

    for(i =[0:nb_travee_m]){
        translate([0, i*travee_l1_m, 0]) trave_m();
    
    }
    if(toit){
        translate([0, 0, h1]) rotate([0,-angle,0])cube([l3_m,l_hangar_m, 1]);
        translate([lg_hangar_m, 0, h2+220]) rotate([0,-90+angle,0])translate([0,0,-1000])cube([1,l_hangar_m, l4_m]);
    }
    
}

lg_hangar = 20000;
l_hangar = 84000;
h1 = 5000;
h2 = 8500;

h_ = 9400;
l_ = 17500;

angle = 15;
l3 = 18000;
l4 = 4000;

travee_l1 = 6000;

module trave_wolf(){
    translate([lg_hangar, 0])cube([200,200, h2]);
    translate([0, 0])cube([200,200, h1]);
    translate([0, 0, h1]) rotate([0,90-angle,0])cube([200,200, l3]);
    translate([lg_hangar, 0, h2]) rotate([0,-90+angle,0])translate([0,0,-1000])cube([200,200, l4]);
}

module hangar_wolf(){
    ///translate([0, 0, 0]) cube([lg_hangar, l_hangar, 1]);



    trave_wolf();
    translate([0, 2*travee_l1, 0]) trave_wolf();
    translate([0, 4*travee_l1, 0]) trave_wolf();
    translate([0, 6*travee_l1, 0]) trave_wolf();
    translate([0, 8*travee_l1, 0]) trave_wolf();
    translate([0, 10*travee_l1, 0]) trave_wolf();
    translate([0, 12*travee_l1, 0]) trave_wolf();
    translate([0, 14*travee_l1, 0]) trave_wolf();
    
    if(toit){
        translate([0, 0, h1]) rotate([0,-angle,0])cube([l3,l_hangar, 1]);
        translate([lg_hangar, 0, h2+220]) rotate([0,-90+angle,0])translate([0,0,-1000])cube([1,l_hangar, l4]);
    }
    
}


module f_wolf(){
    translate([lg_hangar, 0]) translate([-750,-750,-1500])cube([1500,1500, 1500]);
    translate([0, 0])translate([-750,-750,-1500])cube([1500,1500, 1500]);
}

module fondation_wolf(){
    translate([0, -150, -500]) cube([lg_hangar, 300, 300]);
    translate([0, 14*travee_l1-150, -500]) cube([lg_hangar, 300, 300]);
    translate([0, -150, -500]) cube([300, l_hangar, 300]);
    translate([lg_hangar, -150, -500]) cube([300, l_hangar, 300]);
    
    
    f_wolf();
    translate([0, 2*travee_l1, 0]) f_wolf();
    translate([0, 4*travee_l1, 0]) f_wolf();
    translate([0, 6*travee_l1, 0]) f_wolf();
    translate([0, 8*travee_l1, 0]) f_wolf();
    translate([0, 10*travee_l1, 0]) f_wolf();
    translate([0, 12*travee_l1, 0]) f_wolf();
    translate([0, 14*travee_l1, 0]) f_wolf();
    
    echo("plot");
    echo(8*2*1.5*1.5*1.5);
    echo((l_hangar+lg_hangar)*0.3*0.3*2/1000);
}

module benne(angle){
    e = 1;
    camion_l = 10600*e;
    camion_lg = 2500*e;
    camion_h = 3500*e;
    camion_h1 = 1000*e;
    angle_b = 20;
    
    rotate([0,0,-90])union(){
        translate([0,0,camion_h1]) rotate([angle,0,0])difference(){
            translate([-camion_lg/2,0,0])  cube([camion_lg, camion_l, camion_h-camion_h1]);
            translate([-camion_lg/2+1,1,1])  cube([camion_lg-2, camion_l-2, camion_h-camion_h1+1]);
        }
        translate([-camion_lg/2,0,camion_h1])  cube([camion_lg, camion_l, 100]);
        translate([-camion_lg/2,2000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
        translate([-camion_lg/2,3000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
        translate([-camion_lg/2,4000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
    }
}

module trave_beton(){
    cube([200,12000,2000]);
    cube([20000,200,2000]);
    translate ([0,0,-200])cube([20000,12000,200]);
    translate ([0,12000,0]) cube([20000,200,2000]);
}

module trave_ventille(){
    translate ([0,6000,0]) cube([17000,400,800]);
    
    for(i =[0:7]){
        
        translate ([1000,800 +i*1500,-300]) cube([15000,300,350]);
    }
}


module trave_elevateur(){
    translate ([0,12000,0]) cube([20000,200,2000]);
    
    //fosse
    translate ([12000,1000,30]) hull(){
        cube([4000,4000,35]);
        translate ([0,2000, -3000]) cube([30,30,30]);
    }
    
    //elevateur
    translate ([10000,1000,30]) cube([1500,4000,35]);
    
    
    translate ([11000,3000,-4000]) cube([400,400,12000]);
    translate ([10000,-10000,7000]) cube([300,15000,350]);
}

mode = 1;

 /*translate([8100, 0000]) rotate([0,0,-9.5])union(){
        %polygon([[0,0], [-8600, 0],  [-9600, 8000], [-0, 7800]]);
        %polygon([[-0, 7800], [-9600, 8000],  [-20500,72300], [-0, 78350]]);

        translate([10000, 17000, 0]) o_hangar();
    }*/
    

if(mode == 0){
    %polygon([[0, 8300], [0, 74300],  [20800,76500], [9600, 6600]]);
    

    
    
} else if(mode == 1){
    %polygon([[0, 8300], [0, 74300],  [20800,76500], [9600, 6600]]);
    %translate([20800, 15000]) rotate([0,0,-9.5])o_hangar();
    translate([20800, 15000]) rotate([0,0,-9.5]) o_hangar_bas();
    translate([5000, 5000]) hangar_m();
} else if(mode == 2){
    %translate([10000, 17000, 0]) o_hangar();
    
    translate([-8500+5000, 4000]) rotate([0, 0, 9]) union(){
        color("gray")fondation_wolf();
    }
}else if(mode == 3){
    translate([5000, 4000])union(){
        //hangar_wolf();
        hangar_screb();
        %translate([-1000, 0])  translate([5000, 3000])benne(30);
        color("gray")fondation_wolf();
    }
     %translate([8100, 0000]) rotate([0,0,-9.5]) translate([10000, 17000, 0]) o_hangar();
   
} else if(mode == 4){
    translate([-8500+5000, 4000]) rotate([0, 0, 9]) union(){
        hangar_wolf();
        color("gray")fondation_wolf();
        %translate([-1000, 0])  translate([5000, 3000])benne(25);
        color("gray") trave_beton();
        color("gray") translate([0, 12000])trave_beton();
        color("blue") translate([0, 12000]) trave_ventille();
    
        
    }
} else if(mode == 10){
    %polygon([[0,0], [-8600, 0],  [-9600, 8000], [-0, 7800]]);
    %polygon([[-0, 7800], [-9600, 8000],  [-20500,72300], [-0, 78350]]);%translate([10000, 17000, 0]) o_hangar();
    
    translate([-8500+5000, 4000]) rotate([0, 0, 9]) union(){
        color("gray")fondation_wolf();
    }
}   else {
    hangar_wolf();
        color("gray")fondation_wolf();
        %translate([-1000, 0])  translate([5000, 3000])benne(25);
        color("gray") trave_beton();
        color("gray") translate([0, 12000])trave_beton();
        color("blue") translate([0, 12000]) trave_ventille();
    color("green") translate([0, 24000]) trave_elevateur();
} 


