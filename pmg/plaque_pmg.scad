$fs=$fs/2;
$fa=$fa/2;

l = 100;
lg = 100;
h = 3;
e = 2;

module ovale(r1, r2){
    diff = (r2-r1)/2;
    hull(){
    translate([-diff, 0])cylinder(r=r1/2, 10);
    translate([+diff, 0])cylinder(r=r1/2, 10);
    }
}



module plaque_pmg(l, lg, h, r1, r2, h2){
    difference(){
        translate([-l/2, -lg/2, 0]) cube([l,lg,h]);


        for(i = [1:10]){
            for(j = [1:10]){
                translate([-l/2+i*l/11, -l/2+j*l/11, h])hull(){
                    translate([0, 0, -h2]) rotate([0,0,45]) ovale(r1,r2);
                }
            }
        }
    }
}

module plaque_pmg_2(r1, r2, h2, e=2, e2=2){
    nb_l = 10;
    nb_lg = 10;
    
    l = (r2+e)*(nb_l+1);
    lg = (r1+e)*(nb_lg+1);
    h = h2+e2;
    difference(){
        translate([-l/2, -lg/2, 0]) cube([l,lg,h]);


        for(i = [1:nb_l]){
            for(j = [1:nb_lg]){
                translate([-(i-(nb_l+1)/2)*(r2+e), (j-(nb_lg+1)/2)*(r1+e), h])hull(){
                    translate([0, 0, -h2]) ovale(r1,r2);
                }
            }
        }
    }
}



module plaque_pmg_4_9_2(){
    //4_9-2
    plaque_pmg_2(4, 9, 2);
}

module plaque_pmg(){
    //5_10_4
    plaque_pmg_2(5, 9, 3);
}

plaque_pmg();


