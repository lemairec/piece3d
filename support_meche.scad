use <config.scad>

h = 100;
e2 = 10;
e=2;

angle = 20;
l = tan(angle)*h;

re = 10;

nb = 4;



/*n=10;
pas = 10;
r_pas = 5.5;
lg=pas*n+2*e;

module toto2(){
    difference(){
       hull(){
           translate([0,0,0])cube([lg, l+e2+e, 2]);
           translate([0,0,h]) cube([ lg, e2+e,1]);
       }
       //translate([-lg/2+e,l+e,e]) rotate([angle,0,0])cube([lg-2*e,10,2*h]);
       
       translate([e,l+e+e2/2,e]) rotate([angle,0,0])cube([lg-2*e,10,2*h]);
       for(i= [0 : n-1] ){
            translate([(i+0.5)*pas+e,l+e+e2/2,e]) rotate([angle,0,0]) cylinder(r=r_pas,2*h);
       }
           
   }
}*/


n = 4;

pas0=4;
pas1=6;
pas2=8;
pas3=10;
pas4=12;
               
lg=n*(4+6+8+10+12)+2*e;
e_h = 3;

module toto3(){
    difference(){
       hull(){
           translate([0,0,0])cube([lg, l+e2+e, 2]);
           translate([0,0,h]) cube([ lg, e2+e,1]);
       }
       //translate([-lg/2+e,l+e,e]) rotate([angle,0,0])cube([lg-2*e,10,2*h]);
       
        
       translate([e,l+e+e2/2,e_h]) rotate([angle,0,0])
       union(){
           cube([lg-2*e,10,2*h]);
           for(i= [0 : n-1] ){
               translate([(i+0.5)*pas0,pas0/2-3,0])            cylinder(r=pas0/2+0.5,2*h);
               
               translate([(pas0)*n+(i+0.5)*pas1,pas1/2-4,0]) cylinder(r=pas1/2+0.5,2*h);
           
               translate([(pas0+pas1)*n+(i+0.5)*pas2,pas2/2-4,0]) cylinder(r=pas2/2+0.5,2*h);
           
               translate([(pas0+pas1+pas2)*n+(i+0.5)*pas3,pas3/2-4,0]) cylinder(r=pas3/2+0.5,2*h);
           
               translate([(pas0+pas1+pas2+pas3)*n+(i+0.5)*pas4,pas4/2-4,0]) cylinder(r=pas4/2+0.5,2*h);
       }
   }
       
       
           
   }
}


mirror([0,1,0])toto3();