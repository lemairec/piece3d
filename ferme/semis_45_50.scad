$fs=$fs/4;
$fa=$fa/4;


cube([20,6000,1], center = true);

cube([40,4000,1], center = true);

voie = true;
bineuse12 = true;

rayon15 = 40;
rayon45 = 12;
rayon50 = 13;
rayon75 = 0;
rayon80 = 0;
rayon60 = 0;


ceuilleur50 = 0;
ceuilleur60 = 0;

inter = 450;

if(rayon45){
    for(i=[0:12]){
        translate([0,i*450+inter/2,1]) color("green") cube([600,10,1], center = true);
    }
    for(i=[0:5]){
        translate([0,-i*450-inter/2,1]) color("green") cube([600,10,1], center = true);
    }
}

if(rayon50){
    for(i=[1:rayon50]){
        translate([0,(i-(rayon45)/2-1)*500,1]) color("green") 
        hull(){
            cube([400,10,1], center = true);
            cube([10,200,1], center = true);
        }
    }
}