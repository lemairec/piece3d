use <../robot_inrow/inrow_einbock/einbock_twin.scad>

lg = 2700;
rang=450;

l = 1500;
l_ = 1000;

l1 = 1100;
l2 = 1400;
l3 = 500;

h1 = 300;
h2 = 700;
d_h = h2-h1;

e = 50;

sum = 0;
module barre(l,i=0){
    sum = sum+l;
    echo("barre 50 ", l);
    if(i==0){
        cube([e, e, l]);
    } else if(i==1){
        cube([l, e, e]);
    } else {
        cube([e, l, e]);
    }
}

module plant(){
    for(i=[-3:2]){
        for(j=[-30:30]){
            color("green") translate([(i+0.5)*rang,(j+i*0.5)*150+90,0]) cylinder(r=30,1);
        }
    }
}


module chassit(){
    for(i=[0,1]){
        mirror([i,0]) translate([-400,-e]) rotate([0,30,0]) cube([e, e, 700]);
    }
    
    translate([-lg/2,0])  barre(lg, 1);
    for(i=[-1:1]){
        translate([i*(lg/2)-e/2,0])  barre(l,2);
    }
    
    translate([-lg/2,0,d_h])  barre(lg,1);
    for(i=[-1:1]){
        translate([i*(lg/2)-e/2,0,d_h])  barre(l_,2);
    }
    
    for(i=[-1:1]){
        translate([i*(lg/2)-e/2,0,0])  barre(d_h,0);
    }
    for(i=[-1:1]){
        translate([i*(lg/2)-e/2,l_-e,0])  barre(d_h,0);
    }
    
    
    translate([-lg/2,l3,d_h+e])   barre(lg, 1);
    
    
    translate([-lg/2,l1-90,e])   barre(lg, 1);
    translate([-lg/2,l2+40,e])   barre(lg, 1);
    
    
    
}

plant();
color("blue")translate([0,0,h1])chassit();

        
for(i=[-3:2]){
    translate([(i+0.5)*rang,0]) union(){
        translate([0, l1,200]) rotate([0,0,180])rotate([0,90,-90]) union(){
            linear_extrude(5) support_moteur2d();
            color("gray") moteur3d();
            translate([0, 0,30])rotate([0,0,i*60+60])dents();
        }
        translate([50, l1-20,100]) color("gray") barre4040(500);
        

        for(i=[0,1]){
          color("black") translate([0,l2, 0]) mirror([i,0]) translate([-60,-60,250/2]) rotate([0,90,10])cylinder(r=250/2, 2);;
        }
        
        
    }
}
