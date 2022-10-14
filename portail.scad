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

l2 = 3840;
l=3840/2-70-10;
echo(l);
h = 1700;
dh = 200;

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

        
    } else if (mode==7){
        h2 = h/2;
        translate([0,-40,h2-20]) rotate([90,0,0]) tube(l-40);
        
        l3 = l-120;
        h3 = h2-100;
        
        translate([0,60,60]) cube([1,l3,h3]);
        translate([0,60,h2+40]) cube([1,l3,h3]);
    } else if (mode==8){
        h2 = h/2;
        l2 = l/2;
        translate([0,-40,h2-20]) rotate([90,0,0]) tube(l-40);
        translate([0,l2-20,0]) tube(h-40);
        
        l3 = l2-100;
        h3 = h2-100;
        echo(l3+" "+h3);
        
        translate([0,60,60]) cube([1,l3,h3]);
        translate([0,60,h2+40]) cube([1,l3,h3]);
        translate([0,l2+40,60]) cube([1,l3,h3]);
        translate([0,l2+40,h2+40]) cube([1,l3,h3]);
    } else if (mode==9){
        h2 = h/2;
        l2 = l/2;
        translate([0,-40,h2-20]) rotate([90,0,0]) tube(l-40);
        translate([0,l2-20,0]) tube(h/2-20);
        
        l3 = l2-100;
        h3 = h2-100;
        echo(l3);
        echo(h3);
        echo("");
        translate([0,l2+40,60]) cube([1,l3,h3]);
        translate([0,60,60]) cube([1,l3,h3]);
        
        l4 = l/3-100;
        z2 = h2+20;
        echo(l4);
        echo(h3);
        echo("");
        
        translate([0,60,z2+20]) cube([1,l4,h3]);
        translate([0,l/3+40,z2+20]) cube([1,l4,h3]);
        translate([0,l/3-20,z2]) tube(h/2-20);
        translate([0,l*2/3+40,z2+20]) cube([1,l4,h3]);
        translate([0,l*2/3-20,z2]) tube(h/2-20);
        
        
        
    }
}

module portail2(l){
    
    a = atan((dh+30)/l);
    translate([0,e_l,+e_l]) rotate([-90,0,0])tube(l-2*e_l);
    translate([0,e_l,h]) rotate([-90+a,0,0])tube(l-2*e_l+40);

    tube(h);
    translate([0,l-e_l]) tube(h+dh+40);;
    
    h2 = h/2;
        translate([0,-40,h2-20]) rotate([90,0,0]) tube(l-40);
        
        l3 = l-120;
        h3 = h2-100;
        
        translate([0,60,60]) cube([1,l3,h3]);
        translate([0,60,h2+40]) hull(){
            cube([1,1,h3]);
            translate([0,l3,0]) cube([1,1,h3+dh]);
        }
        
}

module portail3(l){
    
    a = atan((dh+30)/l);
    translate([0,e_l,+e_l]) rotate([-90,0,0])tube(l-2*e_l);
    translate([0,e_l,h+dh+10]) rotate([-90-a,0,0])tube(l-2*e_l+40);

    tube(h+dh+0);
    translate([0,l-e_l]) tube(h);;
    
    h2 = h/2;
        translate([0,-40,h2-20]) rotate([90,0,0]) tube(l-40);
        
        l3 = l-120;
        h3 = h2-100;
        
        translate([0,60,60]) cube([1,l3,h3]);
        translate([0,60,h2+40]) hull(){
            cube([1,1,h3+dh]);
            translate([0,l3,0]) cube([1,1,h3]);
        }
        
}

module portail4(l){
    
    color("black") translate([0,e_l,e_l]) rotate([-90,0,0])tube(l-2*e_l);
    color("black") translate([0,e_l,h]) rotate([-90,0,0])tube(l-2*e_l+40);
    color("black") translate([0,0])tube(h);
    color("black") translate([0,l-e_l]) tube(h);;
    
    h2 = h/2;
    color("black") translate([0,-40,h2-20]) rotate([90,0,0]) tube(l-40);
        
    intersection(){
        translate([0,20, 40]) cube([20,l-60,h/2-40]);;
        for(i = [-5:5]){
            translate([10,i*200+115+l/2]) cube([20,170,h+10+i*20]);;
        }
    }
    
    intersection(){
        translate([0,20, 40]) cube([50,l-60,h/2-40]);;
        for(i = [-10:10]){
            translate([20,i*100+50+l/2, 55]) rotate([0,90,0])cylinder(r=10,30, center = true);
        }
    }
    
    intersection(){
        translate([0,20, 20+h/2]) cube([50,l-60,h/2-40]);;
        for(i = [0:10]){
            translate([10,i*280-10, h/2-200]) rotate([45,0,0])cube([20,170,h+10+i*20]);;
        for(i = [-10:10]){
            translate([20,i*140+l/2, h/2+35]) rotate([0,90,0])cylinder(r=10,30, center = true);
        }
        for(i = [-10:10]){
            translate([20,i*140+80+l/2, h-55]) rotate([0,90,0])cylinder(r=10,30, center = true);
        }
        }
    }
}

ecart = 175;
diff = ecart - 150;

module portail5(l){
    
    color("black") translate([0,e_l,e_l]) rotate([-90,0,0])tube(l-2*e_l);
    color("black") translate([0,e_l,h]) rotate([-90,0,0])tube(l-2*e_l+40);
    color("black") translate([0,0])tube(h);
    color("black") translate([0,l-e_l]) tube(h);;
    
    h2 = h/2;
    color("black") translate([0,-40,h2-20]) rotate([90,0,0]) tube(l-40);
        
    intersection(){
        translate([0,20, 40]) cube([20,l-60,h/2-40]);;
        for(i = [-5:5]){
            translate([10,i*ecart+ecart/2+l/2+diff/2]) cube([20,150,h+10]);;
        }
    }
    
    for(i = [-9:8]){
        translate([20,i*100+50+l/2, 55]) rotate([0,90,0])cylinder(r=10,30, center = true);
    }
    
    
    
    intersection(){
        translate([0,20, 20+h/2]) cube([50,l-60,h/2-40]);;
        for(i = [-5:5]){
            translate([10,i*200+100+25+l/2]) cube([20,150,h]);;
        }
    }
}

mode = 12;//4 10

for(i=[0,1]){
 mirror([0,i,0]) translate([-200,l2/2]) cube([400,400,2000]);
}

module portial_(l){
    if(mode == 10){
        portail2(l);
    } else if(mode == 11){
        portail4(l);
    } else if(mode == 12){
        portail5(l);
    } else {
        portail(l);
    }
}

a = 0;
 mirror([0,0,0]) translate([0,10,0]) rotate([0,0,a])portial_(l);
 mirror([0,0,0])mirror([0,1,0]) translate([0,10,0]) rotate([0,0,a])portial_(l);

    
//rotate([0,90,0]) scale(0.05)portail();
