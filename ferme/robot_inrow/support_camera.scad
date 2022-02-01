e = 5;
h = 45;
a = 50;

l = 60;

module coin(){
    difference(){

        union(){
            
            translate([-10,-30,0]) cube([20,60,e]);
            hull(){
                translate([-10,-10,0]) cube([20,20,h]);
                translate([0,0,h]) rotate([0,90-a,0]) translate([0,0,-15])cube([20,20,40], center = true);
            }
        }
        
        translate([0,0,h]) rotate([0,90-a,0]) cylinder(r=4.5,100, center=true);
        
        for(i = [-1,1]){
            translate([0, i*20, -1]) cylinder(r=4.5,e+2);
        }
        translate([20, 30,-1]) cylinder(r=5,e+2);
        
        translate([-15, -20,-1]) cylinder(r=4.5,e+2);
        translate([ 15, -20,-1]) cylinder(r=4.5,e+2);
    }
    %translate([ -20, -40,-40]) cube([40,80,40]);
}

module coin_h(){
    h2 = 14;
    l_coin = l+20;
    x = 20;
    difference(){

        union(){
            translate([-l_coin/2,-30,0]) cube([l_coin,50,h2]);
        }
        for(i = [-1,1]){
            translate([i*l/2, 10, -1]) cylinder(r=4.5,h2+2);
        }
        
        for(i = [0,1]){
            mirror([i,0,0])translate([x,-5, h2/2]) rotate([90,0,90-a]) cylinder(r=4.5,100);
            mirror([i,0,0])translate([x,-5, h2/2]) rotate([00,0,-a]) cube([13, 13, h2+20],center=true);
            mirror([i,0,0])translate([x,-5, h2/2]) rotate([00,0,-a]) translate([30,0,0]) cube([12,20,h2+20],center=true);
        }
    }
}

module camera(){
    h2 = 14;
    l_camera = 60;
    r = 6;
    difference(){

        union(){
            translate([-l/2,-l_camera/2,0]) cube([l,l_camera,2]);
            for(i = [0,1]){
                mirror([i,0,0])hull(){
                    translate([l/2,l_camera/2,r]) rotate([90,0,0]) cylinder(r=r, l_camera);
                    translate([l/2-r,-l_camera/2]) cube([r*2, l_camera, 1]);
                }
            }
            
            for(i = [-1,1]){
                for(j = [-1,1]){
                    translate([i*14, j*14, 0]) cylinder(r=4, 2+3);
                }
            }
        }
        for(i = [-1,1]){
            translate([i*l/2, l_camera/2+1, r]) rotate([90,0,0]) cylinder(r=4.2, l_camera+2);
        }
        
        for(i = [-1,1]){
            for(j = [-1,1]){
                translate([i*14, j*14, -1]) cylinder(r=2, l_camera+2);
                translate([i*14, j*25, -1]) cylinder(r=2, l_camera+2);
            }
        }
        
        cube([20,20, 10], center = true);
        cube([5,25, 10], center = true);
    }
}

module all(){
    lg = 450;
    l = 600;
    for(j=[0,1]){
        for(i=[0,1]){
            mirror([0,j,0])mirror([i,0,0]) translate([-lg/2,l/2,0])coin();
            mirror([0,j,0]) mirror([i,0,0]) translate([-lg/2,l/2,0])translate([0,0,h]) rotate([0,90-a,0])%cylinder(r=4,500);
        }
         mirror([0,j,0])translate([0,l/2,450]) rotate([90,0,0])coin_h();
    }
    
}

mode = 1;
if(mode == 0){
    all();
} else if(mode == 1){
    coin();
} else if(mode == 2){
    coin_h();
} else if(mode == 3){
    camera();
}