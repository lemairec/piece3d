$fs=$fs/4;
$fa=$fa/4;


cube([20,6000,1], center = true);

cube([40,4000,1], center = true);

voie = true;
bineuse12 = true;

rayon15 = 40;
rayon45 = 12;
rayon75 = 0;
rayon80 = 0;
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

if(rayon80){
    for(i=[1:rayon80]){
        translate([0,(i-(1+rayon80)/2)*800,1]) color("red") cube([400,10,1], center = true);
    }
}

if(rayon60){
    for(i=[1:rayon60]){
        translate([0,(i-(1+rayon60)/2)*600,1]) color("green") cube([400,10,1], center = true);
    }
}

if(rayon50){
    for(i=[1:rayon50]){
        translate([0,(i-rayon50/2)*500,1])hull(){
            cube([400,10,1], center = true);
            translate([300,0,0]) cube([10,500,1], center = true);
        } 
            
        //translate([0,(i-rayon50/2)*500,1]) color("green") cube([400,10,1], center = true);
    }
}

if(ceuilleur60){
    for(i=[1:ceuilleur60]){
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
        translate([-1200,i*900,1]) color("green") cube([400,230,1], center = true);
    }
}

if(false){
    for(i=[1:rayon15]){
        translate([0,(i-(rayon15+1)/2)*150,1]) color("blue") cube([100,10,1], center = true);
    }
}

if(rayon15){
    l=100000;
    for(i=[0,1]){
        mirror([0,i,0]) {
            translate([0,19.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,18.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,17.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,16.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,15.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,14.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,13.5*150,1]) color("blue") cube([l,10,1], center = true);
            
            translate([0,12.5*150+50,1]) color("blue") cube([l,10,1], center = true);
            translate([0,11.5*150-50,1]) color("blue") cube([l,10,1], center = true);
            
            translate([0,10.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,9.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,8.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,7.5*150,1]) color("blue") cube([l,10,1], center = true);
            
            translate([0,6.5*150+50,1]) color("blue") cube([l,10,1], center = true);
            translate([0,5.5*150-50,1]) color("blue") cube([l,10,1], center = true);
            
            translate([0,4.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,3.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,2.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,1.5*150,1]) color("blue") cube([l,10,1], center = true);
            translate([0,0.5*150,1]) color("blue") cube([l,10,1], center = true);
        }
    }
    
}