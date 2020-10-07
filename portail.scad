l1 = 30;

x=3;//6.5//11

ferme = true;
angle = asin((l1-3)/113);

inter = 126;
inter2 = 180;
l = 2585+80;


    

/*module portail(){
    l2 = 113*cos(angle)+x;
    translate([-1,0,0])cube([2,350/2,10]);
    translate([-1,l2-5,0])cube([3,1,3]);
}

if(ferme){
    translate([0,5,0]) portail();
    translate([l1,x,0]) rotate([0,0,angle]) cube([2,113,2]);
} else {
    translate([0,5,0]) rotate([0,0,-90])portail();
    translate([l1,x,0]) rotate([0,0,-90]) cube([1,77,2]);
}*/

e_l = 40;
e_lg = 40;

module tube(l2){
    difference(){
        cube([e_lg,e_l,l2]);
        //translate([3,3,-1]) cube([30-6,50-6,l+2]);
    }
}

module tube_2(l2){
    difference(){
        cube([20,20,l2]);
        //translate([3,3,-1]) cube([30-6,50-6,l+2]);
    }
}

l=2700;
h = 1500;

n=9;
module portail(l){
    translate([0,e_l,+e_l]) rotate([-90,0,0])tube(l-2*e_l);
    translate([0,e_l,h]) rotate([-90,0,0])tube(l-2*e_l);

    tube(h);
    translate([0,l-e_l]) tube(h);;

    if(mode==0){
        h2 = h/2;
        
        for(i=[-n:n]){
            translate([0, l/2-15-i*(inter)]) cube([30,30,h/2]);
        }
        translate([0,e_l,h2]) rotate([-90,0,0])tube(l-2*e_l);



        intersection() {
            translate([0,0, h2]) cube([30,l,h-h2]);
            union(){
                translate([0,320, h/2-20]) rotate([45,0,0]) cube([30,30,400]);
                for(a=[6,15,28, 45, 70]){
                    translate([0,30, h/2+10]) rotate([-90+a,0,0]) translate([0,0,200]) cube([30,30,2750]);
                }
            }
        }

    } else if (mode==1){
        h2 = 900;
        translate([0,50,h2]) rotate([-90,0,0])tube(l-100);

        for(i=[-n:n]){
            translate([0, l/2-15-i*(110+30)]) cube([30,30,h2]);
        }

        for(i=[0:3]){
            translate([0, 0, h2+i*(110+30)]) cube([30,l,30]);
        }
    } else if (mode==2){
        h2 = 800;
        translate([0,50,h2]) rotate([-90,0,0])tube(l-100);

        for(i=[-n:n]){
            translate([0, l/2-15-i*(110+30)]) cube([30,30,h2]);
        }

        for(i=[-n/2:n/2]){
            translate([0, l/2-15-i*2*(110+30), h2]) cube([30,30,h-h2]);
        }
    } else if (mode==3){
        h2 = h/2;
        a = 30;
        translate([0,50,h2]) rotate([-90,0,0])tube(l-100);

        intersection() {
            translate([0,0, 0]) cube([30,l,h-h2]);
            union(){
                for(i=[0:20]){
                    translate([0,-l/4+i*200, 0]) rotate([a,0,0]) cube([30,30,1200]);
                }
                
            }
        }

        intersection() {
            translate([0,0, h2]) cube([30,l,h-h2]);
            union(){
                for(i=[0:16]){
                    translate([0,-l/4+100+i*200, h/2]) rotate([-a,0,0]) cube([30,30,1200]);
                }
                
            }
        }
    } else if (mode==4){
        h2 = h/2;
        a = 45;
        l2 = 1500;
        translate([0,e_l,h2]) rotate([-90,0,0])tube(l-2*e_l);

        n = l/inter;
        echo(n*0.7);
        echo(n/8*4);
        
        for(i=[0:n]){
             translate([0, e_l-20+i*(inter)]) tube_2(h2);
        }

        intersection() {
             
            translate([0,0, h2]) cube([30,l,h-h2]);
            
            
            
            union(){
                
            
                for(i=[-12:0]){
                    rotate([a,0,0]) translate([0,l2+i*inter2, -1500]) cube([20,20,3000]);
                }
                
                for(i=[-12:12]){
                    rotate([-(90-a),0,0]) translate([0,-80-i*inter2, l2]) cube([20, 20,3000]);
                    //echo(l2);
                }
                
            }
        }

        
    } else if (mode==5){
        h2 = h/2;
        a = 43;
        l2 = 2*l/3+100;
        
        intersection() {
            cube([30,l,h]);
            union(){
                for(i=[-12:0]){
                    translate([0,l2+i*inter, i*150]) rotate([a,0,0]) cube([30,30,3000]);
                }
                
                for(i=[-12:12]){
                    translate([0,l2+i*inter, -i*150]) rotate([-a,0,0]) cube([30,30,3000]);
                }
                
            }
        }

        
    } else if (mode==6){
        h2 = h/2;
        a = 45;
        l2 = l/3;
        translate([0,l/3,0]) tube(h);

        for(i=[1:n]){
            translate([0, l2-15-i*(inter)]) cube([30,30,h]);
        }
        
        for(i=[1:10]){
            translate([0, l2, i*(inter)]) cube([30,l-l2,30]);
        }

        
    }
}

mode = 4;

a = 0;
 mirror([0,0,0]) translate([0,10,0]) rotate([0,0,a])portail(l);
 mirror([0,0,0])mirror([0,1,0]) translate([0,10,0]) rotate([0,0,a])portail(l);

    
//rotate([0,90,0]) scale(0.05)portail();
