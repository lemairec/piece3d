$fs=$fs/2;
$fa=$fa/2;

echelle = 1/64;
e = echelle;
fosse_l = 4000*echelle;
fosse_lg = 4000*echelle;
fosse_h1 = 1000*echelle;
fosse_h2 = 6000*echelle;


elevateur_prof = 7000*echelle;
elevateur_h = 9000*echelle;
elevateur_tuyau_h = elevateur_h - 500*echelle;

cellule_gd_r = 8000*echelle/2;
cellule_pt_r = 8000*echelle/4;
cellule_h = 6000*echelle;

redler_h = cellule_h+1000*e;

batiment_h = 6000*e;
batiment_h2 = 9000*e;
batiment_lg = 9000*e;

batiment_travee = 4500*e;

fosse2_h1 = 1000*echelle;
fosse2_h2 = 3000*echelle;
fosse2_mur_h = 1000*echelle;

trou_h = fosse2_h2+500*e;
    
elevateur2_prof = fosse2_h2 + 800*echelle;



module fosse(){
    hull(){
        translate([-fosse_l/2,0,-fosse_h1]) cube([fosse_lg,fosse_l,fosse_h1]);
        translate([0,0,-fosse_h2]) cube([1,1,1]);
    }
}
module fosse_t(){
    hull(){
        translate([-fosse_l/2,-fosse_l,-fosse_h1]) cube([fosse_lg,3000*e,fosse_h1]);
        translate([-1000*e,-1000*e,-fosse_h2]) cube([1,1,1]);
    }
    
    hull(){
        translate([-000*e,-fosse_l,-fosse_h1]) cube([2000*e, fosse_lg-300*e,fosse_h1]);
        translate([2000*e,-500*e,-4000*e]) cube([1,1,1]);
        translate([000*e,-500*e,-fosse_h2]) cube([1,1,1]);
    }
}

module moi(){
    cylinder(r=100*e, 1800*e);
    translate([0,0,1700*e]) sphere(r=150*e);
}

module camion(){
    camion_l = 12000*e;
    camion_lg = 2500*e;
    camion_h = 5000*e;
    camion_h1 = 1000*e;
    difference(){
        translate([-camion_lg/2,0,camion_h1])  cube([camion_lg, camion_l, camion_h-camion_h1]);
        translate([-camion_lg/2+1,1,camion_h1+1])  cube([camion_lg-2, camion_l-2, camion_h-camion_h1+1]);
    }
    translate([-camion_lg/2,2000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
    translate([-camion_lg/2,3000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
    translate([-camion_lg/2,4000*e,500*e]) rotate([0,90,0]) cylinder(r=500*e, camion_lg);
}

module elevateur(){
    translate([0,0,-elevateur_prof]) cube([200*e,200*e,elevateur_h+elevateur_prof]);
    translate([400*e,0,-elevateur_prof]) cube([200*e,200*e,elevateur_h+elevateur_prof]);
}

module cellule_gd(){
    translate([0,0,0]) 
    difference(){
        cylinder(r=cellule_gd_r, cellule_h);
        translate([0,0,-1]) cylinder(r=cellule_gd_r-1, cellule_h+2);
    }
}
module cellule_gd1(){
    translate([0,0,0]) cellule_gd();
    difference(){
        hull(){
            translate([0,0,1500*e]) cylinder(r=cellule_gd_r, cellule_h-1500*e);
            translate([0,0,-1000*e]) cylinder(r=1, cellule_h-1500*e);
        }
        hull(){
            translate([0,0,1500*e]) cylinder(r=cellule_gd_r-1, cellule_h-1500*e+1);
            translate([0,0,-1000*e+1]) cylinder(r=1, cellule_h-1500*e);
        }
    }
}

module cellule_pt(){
    difference(){
        cylinder(r=cellule_gd_r/2, cellule_h);
        translate([0,0,-1]) cylinder(r=cellule_gd_r/2-1, cellule_h+2);
    }
}

module redler(l){
    translate([400*e,0,0]) cube([l,200*e,200*e]);
}

module tuyau_camion2(){
    translate([-batiment_travee,-000*e,redler_h-300*e]) rotate([-90-40, 0,0]) 
        cylinder(r=150*e, 3000*e);
}

module redler_bas(){
    translate([-batiment_travee*7,0*e,-2000*e])  redler(batiment_travee*5);
}

module galerie_bas(l){
    translate([-batiment_travee*7,-500*e,-2000*e]) cube([batiment_travee*5.5,1000*e,2000*e]);
}




batiment_l = batiment_travee*9;
    
module batiment(){
    for(i=[0:9]){
        translate([batiment_travee*2.5-i*batiment_travee,-batiment_lg/2,0])  cylinder(r=250*e/2, batiment_h);
        translate([batiment_travee*2.5-i*batiment_travee,batiment_lg/2,0])  cylinder(r=250*e/2, batiment_h);
    }
    hull(){
        translate([-batiment_travee*6.5,-batiment_lg/2-500*e,batiment_h])cube([batiment_l,1,1]);
        translate([-batiment_travee*6.5,0,batiment_h2])cube([batiment_l,1,1]);
    }
    hull(){
        translate([-batiment_travee*6.5,0,batiment_h2])cube([batiment_l,1,1]);
        translate([-batiment_travee*6.5,batiment_lg/2+2500*e,batiment_h])cube([batiment_l,1,1]);
        
    }
    
}



/*
*
*/


module elevateur1(){
    translate([-1200*e,-500*e,0])  elevateur();
}
module puit_elevateur1(){
    translate([-2000*e,-900*e,-elevateur_prof]) cube([1800*e,800*e,elevateur_prof]);
}


module fosse2(){
    hull(){
        translate([-fosse_l/2,0,-fosse2_h1]) cube([fosse_lg,fosse_l,fosse_h1]);
        translate([0,0,-fosse2_h2]) cube([1,fosse_lg,1]);
    }
}

module elevateur_new(){
    translate([-1200*e,-500*e,0]) translate([0,0,-elevateur2_prof]) cube([300*e,300*e,elevateur_h+elevateur2_prof]);
    translate([-1200*e,-500*e,0]) translate([400*e,0,-elevateur2_prof]) cube([300*e,300*e,elevateur_h+elevateur2_prof]);
}

module redler_new(){
    redler_l = 4500*e;
    translate([-300*e/2,fosse_l-redler_l,-fosse2_h2-150*e]) cube([300*e,redler_l,300*e]);
}

module support_fosse(){
    p = 100*e;
    for(y = [p, fosse_l/2-p/2, fosse_l-p]){
        translate([-fosse_l/2,y,-fosse2_h2-150*e-p]) cube([fosse_l,p,p]);
        for(i =[0,1]){
            mirror([i,0,0]) translate([fosse_l/2-p,y,-trou_h]) cube([p,p,trou_h-fosse2_h1-200*e]);
            mirror([i,0,0]) translate([500*e-p,y,-trou_h]) cube([p,p,800*e]);
            mirror([i,0,0]) translate([500*e,y,-trou_h+800*e-p]) rotate([0,-46,0])cube([2200*e,p,p]);
        }
    }
}

module tuyau_camion(){
    translate([-500*e,-000*e,elevateur_tuyau_h]) rotate([0,-90-40, -35]) 
        cylinder(r=150*e, 5000*e);
}

module mur_new(){
    difference(){
        translate([-2000*e,-0,-trou_h]) cube([4000*e,100*e,trou_h + fosse2_mur_h]);
        translate([-2000*e,-1,-trou_h]) cube([800*e,110*e+2,1500*e]);
    }
    //translate([-fosse_l/2,0,0]) cube([fosse_lg,1,fosse2_mur_h]);
    translate([fosse_l/2,0,0]) cube([1,fosse_lg,fosse2_mur_h]);
}

module vis_new(){
    
    translate([batiment_travee*1.5,0,-800*e]) rotate([0,-90+33, -5]) 
        cylinder(r=150*e, 6000*e);
}

module trou(){
    union(){
        translate([-fosse_l/2,0,-trou_h]) cube([fosse_lg,fosse_l,trou_h]);
        translate([-fosse_l/2,-1000*e,-elevateur2_prof]) cube([fosse_lg,1000*e,elevateur2_prof]);
        
        hull(){
            translate([-fosse_l/2,-fosse_l,-1]) cube([fosse_lg,3000*e,1]);
            translate([-fosse_l/2,-2000*e,-trou_h]) cube([fosse_lg,1000*e,1]);
        }
    }
}


i = 8;

//plan1 = true;
//plan2 = true;



translate([-2500*e, 2000*e,0]) moi();

translate([-batiment_travee, -4000*e, 0])camion();


if(i == 0 || i == 10){
    batiment();
    color("red") fosse();
    color("red") fosse_t();
    color("red") elevateur1();;
    %puit_elevateur1();
    color("red") hull(){
        translate([6000*e,0,-1000*e]) cylinder(r=1, 1);
        translate([2000*e,-500*e,-4000*e]) cylinder(r=1, 1);
    }
}
if(i == 1){
    color("red") fosse();
    color("red") fosse_t();
    color("red") elevateur1();;
    %puit_elevateur1();
    color("red") hull(){
        translate([6000*e,0,-1000*e]) cylinder(r=1, 1);
        translate([2000*e,-500*e,-4000*e]) cylinder(r=1, 1);
    }
}
if(i == 2){
    %fosse();
    %fosse_t();
    %puit_elevateur1();
}

if(i == 3){
    %trou();
    
    %fosse();
    %fosse_t();
    %puit_elevateur1();
}

if(i == 4){
    %trou();
}

if(i == 5){
    %trou();
    color("black") support_fosse();
    color("grey") mur_new();
}

if(i == 6){
    %trou();
    color("black") support_fosse();
    color("grey") mur_new();
    color("green") elevateur_new();
    color("green") redler_new();
}

if(i > 6){
    %trou();
    color("black") support_fosse();
    color("grey") mur_new();
    color("green") elevateur_new();
    color("green") redler_new();
    color("green") fosse2();
    color("green") vis_new();
    color("green") tuyau_camion();
}

if(i == 8 || i == 10){
    %batiment();
}

color("red") translate([-batiment_travee*4.5,-800*e,cellule_h+1000*e])
    redler(batiment_travee*6);
    
translate([batiment_travee*1.5, 0,0]) cellule_gd1();

translate([-batiment_travee*2, -2000*e,0]) cellule_pt();
translate([-batiment_travee*2, 2000*e,0]) cellule_pt();
translate([-batiment_travee*3, -2000*e,0]) cellule_pt();
translate([-batiment_travee*3, 2000*e,0]) cellule_pt();
translate([-batiment_travee*4.5, 0,0]) cellule_gd();
translate([-batiment_travee*6, -2000*e,0]) cellule_pt();
translate([-batiment_travee*6, 2000*e,0]) cellule_pt();

color("blue") translate([-batiment_travee*7, 0,0])fosse();
color("blue") translate([-batiment_travee*7-1200*e,-500*e,0])  elevateur();
color("blue") translate([-batiment_travee*7,00*e,redler_h])  redler(batiment_travee*6);
color("blue") tuyau_camion2();

color("blue") redler_bas();
%galerie_bas();




echo("grand cellule", (cellule_gd_r/e)*3.14*(cellule_gd_r/e)*(cellule_h/e)/1000000000*0.75, "t");
echo("petite cellule", (cellule_pt_r/e)*3.14*(cellule_pt_r/e)*(cellule_h/e)/1000000000*0.75, "t");

echo("fosse1", (fosse_l/e)*(fosse_lg/e)*(fosse_h1/e)/1000000000*0.75+(fosse_l/e)*(fosse_lg/e)*(fosse_h2/e-fosse_h1/e)/3000000000*0.75, "t");

echo("fosse2", (fosse_l/e)*(fosse_lg/e)*(fosse2_h1/e)/1000000000*0.75+(fosse_l/e)*(fosse_lg/e)*(fosse2_h2/e-fosse_h1/e)/2000000000*0.75, "t");
echo("elevateur", (elevateur2_prof/e+elevateur_h/e)/1000, "m");