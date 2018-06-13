include <config_cnc.scad>;

$fn = 50;

carre = 25;
carre_d = carre/0.70;


roulement_r_int = 8/2;
roulement_r_ext = 22/2;
roulement_h = 7;
module roulement(){
    difference(){
        cylinder(roulement_h, r=roulement_r_ext);
        translate([0,0,-1])cylinder(roulement_h+2, r=roulement_r_int);
    }
}

e = 5;

//l = 120;
l = 70;
lg = 70;


lg_x = 0;

module cube_triangle(l,lg,h){
    hull(){
        cube([1,lg,h]);
        cube([l,lg,1]);
    }
}

module base(){
    l_r = 32;
    union(){
        for(i=[0,1]){
            mirror([i,0,0]) difference(){
                hull(){
                    translate([l/2, lg/2, 0]) cylinder(e, r = 4+4);
                    translate([l/2, -lg/2, 0]) cylinder(e, r = 4+4);
                }
                translate([l/2, lg/2, -1]) cylinder(e+2, r = 4.2);
                translate([l/2, -lg/2, -1]) cylinder(e+2, r = 4.2);
            }
        }
        difference(){
            translate([-l/2+5, -lg/2-5, 0]) cube([l-10,lg+10,e]);
            
            for(i=[0,1]){
                 mirror([0,i])translate([0, l_r + 22, -1]) cylinder(30, r= l_r);
            }
        }
    }
}

module base_roulement(l, lg){
    x_roulement = l/2 - 9;
    y_roulement = 10;
    difference(){
        union(){
            rotate([45, 0, 0]) translate([0, -l/2, -l/2]) cube([lg,l, l]);
            rotate([45, 0, 0]) translate([y_roulement, x_roulement, l/2]) cylinder(1, r= 6);
        }
        translate([-1, -l, -2*l]) cube([lg+2,l*2, l*2]); 
        translate([lg, -l, 0]) rotate([0, -55, 0])cube([lg+2,l*2, l*2]); 
    }
    %rotate([45, 0, 0]) translate([y_roulement, x_roulement, l/2+1]) roulement();
}

module base_maintiens(h, l){
    h2 = h/0.7;
    difference(){
        translate([0, 0, 0]) rotate([0, 45, 0]) cube([h2, l, h2], center = true);
        translate([0, 0, carre*0.72]) rotate([0, 45, 0]) cube([carre, l+2, carre], center = true);
        translate([-50, -50, -100-1]) cube([100,100, 100]); 
    }
}



module base_roulement_diff(l, lg){
    x_roulement = l/2 - 9;
    y_roulement = 10;
    rotate([45, 0, 0]) translate([y_roulement, x_roulement, l/2-40]) cylinder(50, r= 8.2/2);
    rotate([45, 0, 0]) translate([y_roulement, x_roulement, l/2-25]) rotate([0, 0, 66]) cylinder(20, r= 15.2/2, $fn= 6);
}

module glissiere(){
    difference(){
        union(){
            base();
            for(j=[0,1]){
                for(i=[0,1]){
                     mirror([j,0]) mirror([0,i,0])translate([-l/2 - 8, -8, e-1])difference(){
                         base_roulement(22, 35);
                     }
                }
            }
        }
        for(j=[0,1]){
            for(i=[0,1]){
                 mirror([j,0]) mirror([0,i,0])translate([-l/2 - 8, -8, e-1])difference(){
                     base_roulement_diff(22, 30);
                 }
            }
        }
        hull(){
            for(i=[0,1]){
                 mirror([i,0]) translate([ l/2-25, 0, -1]) cylinder(30, r= 10);
            }
        }
    }
}


module top_x(){
    difference(){
        union(){
            rotate([0,0,90])base();
            for(j=[0,1]){
                for(i=[0,1]){
                     mirror([0,j]) translate([0, l/2-2, e])difference(){
                         base_maintiens(17,20);
                     }
                }
            }
        }
       
        hull(){
            for(i=[0,1]){
                 mirror([0, i]) translate([ 0, l/2-25, -1]) cylinder(30, r= 10);
            }
        }
    }
}

l_coin = 60;
lg_coin = 60;

x_coin_vis = 20;
y_coin_vis = 22;
module coin_motor(){
    difference(){
        union(){
            translate([-l_coin/2, -l_coin/2, 0]) cube([l_coin,100,12]);
            translate([0, 0, 5])rotate([45, 0, 0]) cube([l_coin, 12,12], center=true);
        }
        translate([0, 0, 22]) rotate([45, 0, 0]) cube([l, 25, 25], center=true);
        translate([0, 50, -10]) nema17();
        cube([25, 25, 8], center=true);
        for(j=[-1,1]){
            for(i=[-1,1]){
                 translate([i*x_coin_vis, j*y_coin_vis, -1]) cylinder(r=4, 100);
            }
        } 
    }
}

module coin_roulement(){
    e = 10;
    e2 = 2;
    difference(){
        union(){
            hull(){
                for(j=[-1,1]){
                    for(i=[-1,1]){
                         translate([i*x_coin_vis, j*y_coin_vis, -1]) cylinder(r=4+5, e);
                    }
                }
                translate([0, 50, e-e2]) cylinder(r=4+5, e2);
            }
            //translate([-20, -15, 00]) cube([40,30,20]);
        }
        translate([0, 0, 22]) rotate([45, 0, 0]) cube([l, 25, 25], center=true);
        %cube([25, 25, 8], center=true);
        for(j=[-1,1]){
            for(i=[-1,1]){
                 translate([i*x_coin_vis, j*y_coin_vis, -1]) cylinder(r=4, 100, center=true);
            }
        }
        translate([0, 50, 00]) cylinder(r=4, 100, center=true);
    }
}

module support_motor(){
    difference(){
        union(){
            hull(){
                for(i=[-1,1]){
                    translate([i*l/2, 0, 0]) cylinder(r=4+3, 10);
                }
            }
            translate([-25, 0, 00]) cube([50,50,2]);
            for(i=[0,1]){
                mirror([i,0,0]) translate([-25+2, 0, 00]) rotate([0, 0, 90]) cube_triangle(50,2,10);
            }
        }
        translate([0, 30, 23]) rotate([0, 180, 0])nema17();
        for(i=[-1,1]){
            translate([i*l/2, 0, 0]) cylinder(r=4, 22, center=true);
        }
        %translate([0, 30, 23]) rotate([0, 180, 0])nema17();
   
    }
}

module coin_up(e = 5){
    difference(){
        union(){
            for(i= [0,1]){
                 mirror([0,i])hull(){
                   translate([x_coin_vis, -y_coin_vis, 0]) cylinder(r=8, e);
                   translate([-x_coin_vis, y_coin_vis, 0]) cylinder(r=8, e);  
                }
            }
            rotate([45, 0, 0]) cube([20, 12,12], center=true);
        }
        translate([0, 0, 17]) rotate([45, 0, 0]) cube([l, 25, 25], center=true);
        for(j=[-1,1]){
            for(i=[-1,1]){
                 translate([i*20, j*22, -1]) cylinder(r=4, 100);
            }
        } 
    }
}

lg2 =400;

if(true){
    for(i=[0,1]){
        mirror([0,i,0]) translate([0, -lg2/2, 0])for(j=[0,1]){
            mirror([0,0,j]) translate([0, 0, -32]) glissiere();
            mirror([0,0,j]) translate([0, 0, -32])  mirror([0,0,1])top_x();
           
            mirror([0,0,j]) translate([0, 0, -32-10-carre_d]) top_x();
        }
        %mirror([0,i,0]) translate([0, -lg2/2, 0]) rotate([45, 0, 0]) cube([400,25, 25], center = true); 
        
        
        mirror([0,i,0]) translate([0, -lg2/2, 0]) for(j=[0,1]){
            %mirror([j,0,0]) translate([l/2, lg/2, 0]) cylinder(180, r= 15.2/2, $fn= 6, center = true);
            %mirror([j,0,0]) translate([l/2, -lg/2, 0]) cylinder(150, r = 4, center = true);
        }
        
        mirror([0,i,0]) translate([0,lg2/2-l/2,8]) rotate([180, 0, 0]) support_motor();
        
        mirror([0,i,0]) translate([-200+30,lg2/2,-22])coin_motor();
        mirror([0,i,0]) translate([-200+30,lg2/2,17])mirror([0,0,1])coin_up();
        
        mirror([0,i,0]) translate([200-30,lg2/2,-22])coin_roulement();
        mirror([0,i,0]) translate([200-30,lg2/2,22])mirror([0,0,1])coin_roulement();
    }
    
     for(j=[0,1]){
          %mirror([0,0,j]) translate([0, 0, -32-5-carre_d/2]) rotate([0, 45, 0]) cube([carre, lg2+100, carre], center = true);
         }
    
} else {
    coin_roulement();
}
