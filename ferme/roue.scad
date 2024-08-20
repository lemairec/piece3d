$fs=$fs/4;
$fa=$fa/4;



//roue fent

/*%difference(){
    circle(r=300/2);
    circle(r=160/2);
    for(i=[1:6]){
        rotate([0,0,i*60])translate([0,205/2]) circle(r=21/2);
    }
}


%translate([0,0,5])difference(){
    circle(r=300/2);
    circle(r=220/2);
    for(i=[1:6]){
        rotate([0,0,i*60])translate([0,275/2]) circle(r=21/2);
    }
}


translate([0,0,5])difference(){
    circle(r=500/2);
    circle(r=161/2);
    for(i=[1:6]){
        rotate([0,0,i*60])translate([0,205/2]) circle(r=21/2);
    }
    for(i=[1:12]){
        rotate([0,0,i*30])translate([0,450/2]) circle(r=19/2);
    }
}*/

translate([0,0,5])difference(){
    circle(r=680/2);
    circle(r=161/2);
    for(i=[1:6]){
        rotate([0,0,i*60])translate([0,205/2]) circle(r=21/2);
    }
    for(i=[1:6]){
        rotate([0,0,i*60+30])translate([0,620/2]) circle(r=17/2);
    }
    for(i=[1:6]){
        rotate([0,0,i*60])translate([0,950/2]) circle(r=400/2);
    }
}
