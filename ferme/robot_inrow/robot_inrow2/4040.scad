
module barre4040(length, center=false){
    echo("barre 2040 ", length);
    if(center){
        translate([-20,-20,-length/2])cube([40,40,length]);
    } else {
        translate([-20,-20, 0])cube([40,40,length]);
    }
}
