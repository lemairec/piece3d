$fs=$fs/4;
$fa=$fa/4;

echelle = 1/64;
e = echelle;

//hauteur camion 4m5
//sogecis

fosse_x = 300*echelle;
fosse_l = 4000*echelle;
fosse_lg = 4000*echelle;
fosse_h1 = 500*echelle;
fosse_h2 = 4600*echelle;
fosse_t_h = 5000*echelle;


elevateur_prof = 7000*echelle;
elevateur_h = 9000*echelle;

cellule_gd_r = 8900*echelle/2;
cellule_pt_r = cellule_gd_r/2;
cellule_h = 6000*echelle;

redler_h = cellule_h+1000*e;

batiment_h = 7000*e;
batiment_h2 = 9500*e;
batiment_lg = 9000*e;

batiment_hanvent = 4000*e;
batiment_hanvent_h = 5000*e;

batiment_travee = 4500*e;
batiment_passerelle_h = 6500*e;

fosse2_h1 = 1000*echelle;
fosse2_h2 = 3000*echelle;
fosse2_mur_h = 1000*echelle;

trou_h = fosse2_h2+500*e;
    
elevateur2_prof = fosse2_h2 + 1500*echelle;

plan = 2;

elevateur100t=true;
i = 8;

module fosse(){
    translate([0,fosse_x,0]) hull(){
        translate([-fosse_l/2,0,-fosse_h1]) cube([fosse_lg,fosse_l,fosse_h1]);
        translate([0,0,-fosse_h2]) cube([1,1,1]);
    }
}
module fosse_t(){
    hull(){
        translate([-fosse_l/2,-fosse_l,-fosse_h1]) cube([fosse_lg,3000*e,fosse_h1]);
        translate([-1000*e,-1000*e,-fosse_t_h]) cube([1,1,1]);
    }
    
    hull(){
        translate([-000*e,-fosse_l,-fosse_h1]) cube([2000*e, fosse_lg-00*e,fosse_h1]);
        translate([2000*e,-500*e,-4000*e]) cube([1,1,1]);
        translate([000*e,-500*e,-fosse_t_h]) cube([1,1,1]);
    }
}

module moi(){
    cylinder(r=100*e, 1800*e);
    translate([0,0,1700*e]) sphere(r=150*e);
}

module camion(){
    benne(0);
}

module benne(angle){
    camion_l = 12000*e;
    camion_lg = 2500*e;
    camion_h = 4500*e;
    camion_h1 = 1000*e;
    
    translate([0,0,camion_h1]) rotate([angle,0,0])difference(){
        translate([-camion_lg/2,0,0])  cube([camion_lg, camion_l, camion_h-camion_h1]);
        translate([-camion_lg/2+1,1,1])  cube([camion_lg-2, camion_l-2, camion_h-camion_h1+1]);
    }
    translate([-camion_lg/2,0,camion_h1])  cube([camion_lg, camion_l, 1]);
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
        cylinder(r=cellule_pt_r, cellule_h);
        translate([0,0,-1]) cylinder(r=cellule_pt_r-1, cellule_h+2);
    }
}

module redler(l){
    translate([400*e,0,0]) cube([l,200*e,200*e]);
}

module tuyau_camion_redler(){
    translate([-batiment_travee,-000*e,redler_h-300*e]) rotate([-90-40, 0,0]) 
        cylinder(r=150*e, 2000*e);
}

module redler_bas(){
    translate([-batiment_travee*7,0*e,-2000*e])  redler(batiment_travee*5);
}

module galerie_bas(l){
    translate([-batiment_travee*7,-500*e,-2000*e]) cube([batiment_travee*5.5,1000*e,2000*e]);
}




batiment_l = batiment_travee*10;
    
module batiment(){
    for(i=[0:10]){
        translate([batiment_travee*2.5-i*batiment_travee,-batiment_lg/2,0])  cylinder(r=250*e/2, batiment_h);
        translate([batiment_travee*2.5-i*batiment_travee,batiment_lg/2,0])  cylinder(r=250*e/2, batiment_h);
        translate([batiment_travee*2.5-i*batiment_travee-250*e/2
            ,-batiment_lg/2-250*e,batiment_passerelle_h-300*e])
            cube([250*e, batiment_lg + 2200*e, 250*e]);
    }
    hull(){
        translate([-batiment_travee*7.5,-batiment_lg/2-500*e,batiment_h])cube([batiment_l,1,1]);
        translate([-batiment_travee*7.5,0,batiment_h2])cube([batiment_l,1,1]);
    }
    hull(){
        translate([-batiment_travee*7.5,0,batiment_h2])cube([batiment_l,1,1]);
        translate([-batiment_travee*7.5,batiment_lg/2+batiment_hanvent,batiment_hanvent_h])cube([batiment_l,1,1]);
        
    }
    
    translate([-batiment_travee*7.5,-1000*e,batiment_passerelle_h])cube([batiment_l,1500*e,1]);
        
}



/*
* old
*/


module elevateur1(){
    translate([-1200*e,-300*e,0])  elevateur();
}
module puit_elevateur1(){
    translate([-2000*e,-800*e,-elevateur_prof]) cube([1800*e,800*e,elevateur_prof]);
}
/**
* utile
**/

module elevateur_(lg_tete, tete, lg, ep, pied, l){
    lg_pied = lg_tete;
    translate([lg/2-ep,0,0]) cube([ep,ep,l]);
    translate([-lg/2,0,0]) cube([ep,ep,l]);
    translate([-lg_pied/2,0,0]) cube([lg_pied, ep, pied]);
    translate([-lg/2,0,l-tete]) cube([lg_tete, ep, tete]);
}

module elevateur_14n(l){
    elevateur_(1115*e, 910*e, 788*e, 266*e, 840*e, l);
}

module elevateur_20n(l){
    elevateur_(1420*e, 1117*e, 994*e, 332*e, 1110*e, l);
}


/**
* plan 1
**/

module fosse2bis(lg){
    difference(){
        hull(){
            translate([-lg/2,0,-fosse2_h1]) cube([lg,lg,fosse2_h1]);
            translate([0,0,-fosse2_h2]) cube([1,lg,1]);
        }
        translate([-lg/2,lg-1000*e,-fosse2_h2]) rotate([-45,0,0]) cube([100,100,100]);
    }
}

module plan1_fosse(){
    difference(){
        fosse2bis(fosse_l);
        translate([0,1,1]) fosse2bis(fosse_l-2);
    }
}

module elevateur_new2(){
    translate([-700*e,-500*e,-elevateur2_prof])elevateur_14n();
}

module tuyau_camion2(){
    translate([-100*e,-100*e,elevateur_h-1200*e]) rotate([0,-90-32, -35]) 
        cylinder(r=150*e, 5000*e);
}

module tuyau_camion(){
    if(elevateur100t){
        translate([-1500*e,-100*e,elevateur_h-1400*e]) rotate([0,-90-36, -50]) 
            cylinder(r=150*e, 4000*e);
    }else {
        translate([-100*e,-100*e,elevateur_h-1200*e]) rotate([0,-90-32, -35]) 
            cylinder(r=150*e, 5000*e);
    }
}


module plan1_redler(){
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
    translate([-fosse_l/2,fosse_l-p,-fosse2_h2+800*e-p]) cube([fosse_l,p,p]);
}



module plan1_mur(){
    difference(){
        translate([-2000*e,-0,-trou_h]) cube([4000*e,100*e,trou_h + fosse2_mur_h]);
        translate([-2000*e,-1,-trou_h]) cube([800*e,110*e+2,1500*e]);
    }
    //translate([-fosse_l/2,0,0]) cube([fosse_lg,1,fosse2_mur_h]);
    translate([fosse_l/2,0,0]) cube([1,fosse_lg,fosse2_mur_h]);
}


module plan1_trou(){
    union(){
        translate([-fosse_l/2,0,-trou_h]) cube([fosse_lg,fosse_l,trou_h]);
        translate([-fosse_l/2,-1000*e,-elevateur2_prof]) cube([fosse_lg,1000*e,elevateur2_prof]);
        
        hull(){
            translate([-fosse_l/2,-fosse_l,-1]) cube([fosse_lg,3000*e,1]);
            translate([-fosse_l/2,-2000*e,-trou_h]) cube([fosse_lg,1000*e,1]);
        }
    }
}

/*
* plan_2
*/

plan2_fosse_prof = 2500*e;

module plan2_trou(){
    union(){
        hull(){
            translate([-fosse_l/2,0,-1]) cube([fosse_lg,fosse_l,1]);
            translate([0,fosse_l,-plan2_fosse_prof]) cube([1,1,1]);
        }
    }
}

module plan2_mur(){
    for(i=[0,1]){
        mirror([i,0,0])translate([-fosse_lg/2,0,0]) cube([100*e,fosse_l,1000*e]);
    }
        translate([-fosse_lg/2,0,0]) cube([fosse_l,100*e,1000*e]);

}

module plan2_fosse(){
    difference(){
        hull(){
            translate([-fosse_l/2,0,-1]) cube([fosse_lg,fosse_l,1]);
            translate([0,fosse_l,-plan2_fosse_prof]) cube([1,1,1]);
        }
        hull(){
            translate([-fosse_l/2+50*e,50*e,1]) cube([fosse_lg-100*e,fosse_l-100*e,1]);
            translate([0,fosse_l-50*e,-plan2_fosse_prof+50*e]) cube([1,1,1]);
        }
    }
}

module plan2_redler(){
    translate([0,fosse_l-250*e,-plan2_fosse_prof+400*e]) rotate([45,0,0])cylinder(r=200*e, 6000*e);
}

module plan2_echo(){
    mur = 4*4*1*0.75;
    fosse = 4*4*plan2_fosse_prof/e/3000*0.75;
    echo("plan2_fosse     ", mur+fosse, "t");
    echo("plan2_elevateur ", elevateur_h/e/1000, "m");
}

/*
* new
*/

module new_fosse(){
    if(plan == 1){
        plan1_fosse();
    } else {
        plan2_fosse();
    }
}

module new_fosse_support(){
    if(plan == 1){
       support_fosse();
    }
}

module new_mur(){
    if(plan == 1){
        plan1_mur();
    } else {
        plan2_mur();
    }
}


module new_elevateur(){
    if(elevateur100t){
        if(plan == 1){
            translate([-700*e,-500*e,-elevateur2_prof])mirror([1,0,0])elevateur_20n(elevateur_h+elevateur2_prof);
        } else {
            translate([-700*e,-500*e,0])mirror([1,0,0])elevateur_20n(elevateur_h);
        }
    } else {
        if(plan == 1){
            translate([-700*e,-500*e,-elevateur2_prof])elevateur_14n(elevateur_h+elevateur2_prof);
        } else {
            translate([-700*e,-500*e,0])elevateur_14n(elevateur_h);
        }
    }
}

module vis_new(){
    translate([batiment_travee*1.5,0,-800*e]) rotate([0,-90+33, -5]) 
        cylinder(r=150*e, 6000*e);
}

module new_trou(){
    if(plan == 1){
        plan1_trou();
    } else {
        plan2_trou();
    }
}

module new_redler(){
    if(plan == 1){
        plan1_redler();
    } else {
        plan2_redler();
    }
}


//plan1 = true;
//plan2 = true;



translate([-2500*e, 2000*e,0]) moi();

translate([-batiment_travee, -4000*e, 0])camion();
//translate([0, 3000*e, 0])benne(30);


if(i == 0 || i == 10){
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
    %new_trou();
    
    %fosse();
    %fosse_t();
    %puit_elevateur1();
}

if(i == 4){
    %new_trou();
}

if(i == 5){
    %new_trou();
    color("black") new_fosse_support();
    color("grey") new_mur();
}

if(i == 6){
    %new_trou();
    color("black") new_fosse_support();
    color("grey") new_mur();
    color("green") new_elevateur();
    color("green") new_redler();
}

if(i > 6){
    %new_trou();
    color("black") new_fosse_support();
    color("grey") new_mur();
    color("green") new_elevateur();
    color("green") new_redler();
    color("green") new_fosse();
    color("green") vis_new();
    color("green") tuyau_camion();
}

if(i == 0 || i == 8 || i == 10){
    %batiment();
}

color("red") translate([-batiment_travee*4.5,-800*e,cellule_h+1000*e])
    redler(batiment_travee*6);
    
translate([batiment_travee*1.5, 0,0]) cellule_gd1();

translate([-batiment_travee*2, -cellule_pt_r,0]) cellule_pt();
translate([-batiment_travee*2, cellule_pt_r,0]) cellule_pt();
translate([-batiment_travee*3, -cellule_pt_r,0]) cellule_pt();
translate([-batiment_travee*3, cellule_pt_r,0]) cellule_pt();
translate([-batiment_travee*4.5, 0,0]) cellule_gd();
translate([-batiment_travee*6, -cellule_pt_r,0]) cellule_pt();
translate([-batiment_travee*6, cellule_pt_r,0]) cellule_pt();

color("blue") translate([-batiment_travee*7, 0,0])fosse();
color("blue") translate([-batiment_travee*7-1200*e,-500*e,0])  elevateur();
color("blue") translate([-batiment_travee*7,00*e,redler_h])  redler(batiment_travee*6);
color("blue") tuyau_camion_redler();

color("blue") redler_bas();
%galerie_bas();


cellule_gd_t = (cellule_gd_r/e)*3.14*(cellule_gd_r/e)*(cellule_h/e)/1000000000*0.75;
cellule_pt_t = (cellule_pt_r/e)*3.14*(cellule_pt_r/e)*(cellule_h/e)/1000000000*0.75;

echo("grand cellule", cellule_gd_t, "t");
echo("petite cellule", cellule_pt_t, "t");
echo("4 petite cellule", cellule_pt_t*4, "t");

echo("fosse1", (fosse_l/e)*(fosse_lg/e)*(fosse_h1/e)/1000000000*0.75+(fosse_l/e)*(fosse_lg/e)*(fosse_h2/e-fosse_h1/e)/3000000000*0.75, "t");

echo("fosse2", (fosse_l/e)*(fosse_lg/e)*(fosse2_h1/e)/1000000000*0.75+(fosse_l/e)*(fosse_lg/e)*(fosse2_h2/e-fosse_h1/e)/2000000000*0.75, "t");
echo("elevateur", (elevateur2_prof/e+elevateur_h/e)/1000, "m");
plan2_echo();