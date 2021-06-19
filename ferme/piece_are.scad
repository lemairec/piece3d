$fs=$fs/2;
$fa=$fa/2;

h=8;

difference(){
    union(){
        hull(){
            translate([ 0,62/2-7, 0]) cylinder(r=17, h);
            translate([ 0,-62/2+7, 0]) cylinder(r=17, h);
        }
        
        for(i=[-1,1]){
            hull(){
                translate([ i*7, -55, 0]) cylinder(r=0.1, h);
                translate([ i*(7+10),-55, 0]) cylinder(r=0.1, h);
                translate([ i*14, 65, 0]) cylinder(r=0.1, h);
                translate([ i*(14+14), 65, 0]) cylinder(r=0.1, h);
            }
        }
    }
    
    hull(){
        translate([ 0,62/2-7, -1]) cylinder(r=7, h+2);
        translate([ 0,-62/2+7, -1]) cylinder(r=7, h+2);
    }
    
    for(i=[-1,1]){
        hull(){
            translate([ i*12,0, -1]) cylinder(r=1.5, h+2);
            translate([ i*15, 30, -1]) cylinder(r=1.5, h+2);
        }
    }
}


//

//moteur2();

//support_moteur();





