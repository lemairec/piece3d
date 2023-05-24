$fs=$fs/4;
$fa=$fa/4;


cube([200,4000,1], center = true);


voie = true;
bineuse12 = true;

rayon125 = 32;
rayon25 = 16;
rayon75 = 0;
rayon80 = 0;
rayon60 = 0;

//cube([100,2440,30], center=true);

ceuilleur50 = 0;
ceuilleur60 = 0;




if(voie){
    for(i=[-1,1]){
        translate([0,i*900,1]) color("green") cube([400,230,1], center = true);
    }
}

if(rayon25){
    for(i=[1:rayon25]){
        translate([0,(i-(rayon25+1+0.5)/2)*250,1]) color("blue") cube([100,10,1], center = true);
    }
}

if(rayon125){
    for(i=[1:rayon125]){
        translate([0,(i-(rayon125+1)/2)*125,1]) color("blue") cube([50,10,1], center = true);
    }
}