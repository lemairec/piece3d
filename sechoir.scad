



air_chaud_r1=1400/2;
air_chaud_r2=700/2;

air_chaud_l1 = 2000;
air_chaud_l2 = 2500;

air_r = 1000/2;

sechoir_l = 3300;
sechoir_lg = 3700;
sechoir_h = 4000;

sechoir_h_l = 2600;
sechoir_h_lg = 3000;
sechoir_h2 = 600;
sechoir_h3 = sechoir_h/4+sechoir_h2;
    

sechoir_x1 = 700;

ailette_nb = 15;

sechoir_lg2 = sechoir_lg-sechoir_x1;

module chaudiere(){
    translate([ 0,-air_chaud_l2,air_chaud_r1])rotate([-90,0,0])hull(){
        cylinder(air_chaud_l1,r=air_chaud_r1);
        cylinder(air_chaud_l2,r=air_chaud_r2);
    }
    translate([ 0,-air_chaud_l2+400,air_chaud_r1])cylinder(air_chaud_l1,r=300/2);
}

module air_chaud(){
    translate([0,-800])chaudiere();
    translate([ 0,-800, air_chaud_r1])rotate([-90,0,0])cylinder(600,r=900/2);
    translate([ 0,-800, air_chaud_r1])cube([400,400,1000]);
    translate([ 0,-800, 1380])cube([400,800,400]);
    //translate([ 0,-air_chaud_l2+400,air_chaud_r1])cylinder(air_chaud_l1,r=300/2);
}

module air_froid(){
    translate([ 0,-800, 800])rotate([0,90,0])cylinder(400,r=800/2);
    translate([ 0,-800, 400])cube([400,800,400]);
    //translate([ 0,-air_chaud_l2+400,air_chaud_r1])cylinder(air_chaud_l1,r=300/2);
}

module air(){
    translate([ 0,0, air_r]) rotate([90,0,0])cylinder(800,r=air_r);
    translate([ -100,-500, air_r]) rotate([90,0,45])cylinder(800,r=air_r);
    translate([ 200,-900, air_r]) rotate([90,0,90])cylinder(2000,r=air_r);
}

module sechoir_caisse2(){
    cube([2, sechoir_lg, sechoir_h]);
    for(i=[0:4]){
        translate([-20,-20,i*sechoir_h/4]) cube([40, sechoir_lg, 40]);
    }
    
    translate([-20,sechoir_x1,-20]) cube([40, 40, sechoir_h]);
    translate([-20,sechoir_x1+sechoir_lg2/3,-20]) cube([40, 40, sechoir_h]);
    translate([-20,sechoir_x1+sechoir_lg2*2/3,-20]) cube([40, 40, sechoir_h]);
    translate([-20,sechoir_lg,-20]) cube([40, 40, sechoir_h]);
    
}

module sechoir_caisse3(){
    cube([sechoir_l, 2, sechoir_h]);
    for(i=[0:4]){
        translate([-20,-20,i*sechoir_h/4]) cube([sechoir_l, 40, 40]);
    }
    
    for(i=[0:9]){
        translate([i*sechoir_l/9,-20,-20]) cube([40, 40, sechoir_h]);
    }
    
}

module sechoir_caisseh(){
    cube([sechoir_h_l, 2, sechoir_h3]);
    cube([2, sechoir_h_lg, sechoir_h3]);
    translate([sechoir_h_l,0])cube([2, sechoir_h_lg, sechoir_h3]);
}

module cube_pointu(l,lg,h){
    hull(){
        cube([l, lg, h]);
        translate([l/2,0])cube([10, lg, h+l/2]);
    }
}

module sechoir_mais(){
    for(i=[1,3,5,7]){
        //translate([i*sechoir_l/9,sechoir_x1,-20]) cube([sechoir_l/9, sechoir_lg2, sechoir_h*3/4]);
    }
    echo(sechoir_l/9*sechoir_lg2*sechoir_h*3/4/1000000000*4*0.75);
    //translate([sechoir_l/9,sechoir_x1,sechoir_h*3/4]) cube([sechoir_h_l, sechoir_h_lg, sechoir_h3]);
    
    echo((sechoir_h_l*sechoir_h_lg*sechoir_h3)/1000000000*0.75);
    
}

module sechoir_air(){
    for(i=[4]){
        color("orange")translate([i*sechoir_l/9,sechoir_x1,-20]) cube_pointu(sechoir_l/9, sechoir_lg2, sechoir_h*4/4);
    }
    
    for(i=[2,6]){
        color("red")translate([i*sechoir_l/9,sechoir_x1,800]) cube_pointu(sechoir_l/9, sechoir_lg2, sechoir_h*3/4-800);
        color("blue")translate([i*sechoir_l/9,sechoir_x1,0]) cube([sechoir_l/9, sechoir_lg2, 800]);
    }
    
    for(i=[0,8]){
        color("orange")translate([i*sechoir_l/9,sechoir_x1,-20]) cube_pointu(sechoir_l/9, sechoir_lg2, sechoir_h*3/4);
    }
}


module porte(){
    for(i=[0,2,4,6,8]){
        translate([i*sechoir_l/9,00,-20]) cube([sechoir_l/9, 20, sechoir_h/4-20]);
    }
    
    for(i=[2,6]){
        translate([i*sechoir_l/9,00,sechoir_h/4]) cube([sechoir_l/9, 20, sechoir_h/4-20]);
    }
    
}

module porte2(){
    for(i=[2,6]){
        color("blue")translate([i*sechoir_l/9,00,-20]) cube([sechoir_l/9, 20, 800-20]);
    }
    
    for(i=[2,6]){
        color("red")translate([i*sechoir_l/9,00,800]) cube([sechoir_l/9, 20, 800]);
        color("red")translate([i*sechoir_l/9,00,2200]) cube([sechoir_l/9, 20, 800]);
    }
    for(i=[0,4,8]){
        color("orange")translate([i*sechoir_l/9,00,3000]) cube([sechoir_l/9, 20, 800]);
    }
    
}

volet_l = 200;
volet_x = 200;

module volet(){
    for(j=[1,3,5,7]){
        translate([(j+0.5)*sechoir_l/9,00,-20]) union(){
            for(i=[1:ailette_nb]){
                translate([-volet_x, sechoir_x1, i*volet_x]) rotate([0,60,0])cube([volet_l, sechoir_lg2, 2]);
                translate([volet_x, sechoir_x1, i*volet_x]) rotate([0,180-60,0])cube([volet_l, sechoir_lg2, 2]);
            }
        }
    }
    
}



module sechoir_caisse(){
    sechoir_caisse2();
    translate([sechoir_l, 0]) sechoir_caisse2();
    
    translate([sechoir_l/9, sechoir_x1, 3*sechoir_h/4]) sechoir_caisseh();
    
    sechoir_caisse3();
    
    for(i=[0:4]){
        translate([sechoir_l-20,-20,i*sechoir_h/4]) cube([40, sechoir_lg, 40]);
    }
    
    //translate([0, sechoir_lg])porte();
    translate([0, sechoir_x1])porte2();
    sechoir_mais();
    sechoir_air();
    
    volet();
}

translate([2100,0, 3000])air();
    



sechoir_caisse();
translate([1800+800,300])air_froid(); //80
translate([1800,0])air_chaud();