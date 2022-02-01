$fs=$fs/4;
$fa=$fa/4;


cube([200,6000,1], center = true);

voie = true;
bineuse12 = true;

rayon15 = 30;
rayon45 = 12;
rayon75 = 0;
rayon60 = 0;

ceuilleur50 = 0;
ceuilleur60 = 0;

if(rayon45){
    for(i=[1:rayon45]){
        translate([0,(i-(1+rayon45)/2)*450,1]) color("green") cube([400,10,1], center = true);
    }
}

if(rayon75){
    for(i=[1:rayon75]){
        translate([0,(i-(1+rayon45)/2)*750,1]) color("green") cube([400,10,1], center = true);
    }
}

if(rayon60){
    for(i=[1:rayon60]){
        translate([0,(i-(1+rayon60)/2)*600,1]) color("green") cube([400,10,1], center = true);
    }
}

if(rayon50){
    for(i=[0:rayon50]){
        translate([0,(i-rayon50/2)*500,1])hull(){
            cube([400,10,1], center = true);
            translate([300,0,0]) cube([10,500,1], center = true);
        } 
            
        //translate([0,(i-rayon50/2)*500,1]) color("green") cube([400,10,1], center = true);
    }
}

if(ceuilleur60){
    for(i=[0:ceuilleur60]){
        translate([0,(i-(ceuilleur60)/2)*600,1])hull(){
            cube([400,10,1], center = true);
            translate([300,0,0]) cube([10,600,1], center = true);
        } 
            
        //translate([0,(i-rayon50/2)*500,1]) color("green") cube([400,10,1], center = true);
    }
}

if(bineuse12){
    for(i=[0:12]){
        translate([0,(i-6)*450,1]) color("green") cube([140,100,1], center = true);
    }
}



if(voie){
    for(i=[-1,1]){
        translate([0,i*900,1]) color("green") cube([400,270,1], center = true);
    }
}

if(rayon15){
    for(i=[0:39]){
        translate([0,(i-19.5)*150,1]) color("blue") cube([100,10,1], center = true);
    }
}