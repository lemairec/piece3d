$fs=$fs/2;
$fa=$fa/2;

echelle = 1/82;
zoom = 100*echelle;

essieu_r=3;

module cran_pneu(d, e, nb){
    difference(){
        union(){
            for(i= [0:18]){
                rotate([0,0,i*20]) translate([-(d/2+1),0,-1]) rotate([30,22,00])cube([2,0.8,e+1]);
            }
        }
        translate([0,0,-10]) cylinder(10, r=d);
        translate([0,0,e/2+0.5])  cylinder(10, r=d);
    }
}

module roue(d, e, cran=true){
    //%cylinder(r=d/2, e, center = true);
    
    rotate_extrude(){
        translate([d/2-e/2,0,0]) scale([1,1.2]) circle (e/2);
    }
    if(cran){
        cran_pneu(d, e);
        rotate([0,0,10])mirror([0,0,1]) cran_pneu(d, e);
    }
    difference(){
        translate([0,0,-0.5])cylinder(e, r=d/2-e/2, center = true);
        cylinder(e+1, r=essieu_r+0.3, center = true);
        translate([0,0,-e/2]) cylinder(1.1,essieu_r+1,essieu_r, center = true);
    }
}

module essieu(l, d_e){
    e_r=0.8;
    difference(){
        union(){
            translate([0,0,2])rotate([0,90,0]) cylinder(l+d_e,r=essieu_r, center =true);
            translate([0,0,2])rotate([0,90,0]) cylinder(l-d_e,r=essieu_r+1, center =true);
            for(i=[0,1]){
                mirror([i,0,0])translate([l/2+d_e/2,0,2])rotate([0,90,0]) cylinder(2,essieu_r+e_r, essieu_r);
            }
        }
        translate([-l,-10,-10]) cube([2*l, 20 ,10]);
        translate([-l,-10,5]) cube([2*l, 20 ,10]);
        for(i=[0,1]){
            mirror([i,0,0])translate([l/2,0,-1]) hull(){
                translate([e_r,0,-1]) cylinder(l,r=e_r, center =true);
                translate([d_e+2,0,-1]) cylinder(l,r=e_r, center =true);
            }
        }
    }  
}

crochet_r = 2.5;
module crochet_female(l){
    difference(){
        union(){
            hull(){
                translate([-l/2,0,0])cube([l,1,3]);
                translate([0,-8,0])cylinder(r=4,3);
            }
            translate([0,-8,0])cylinder(r=4,7);
        }
        translate([0,-8,0])cylinder(7,2.5,3.5);
    }
}

module crochet_male(lg, l=8, support=true){
    union(){
        hull(){
            translate([-lg/2,0,8])cube([lg,1,3]);
            translate([0,-l,8])cylinder(3, r=crochet_r);
        }
        translate([0,-l,crochet_r])cylinder(10-crochet_r,r=crochet_r);
        translate([0,-l,crochet_r])sphere(crochet_r);
        if(support){
            translate([0,-l,0])cylinder(0.25,r=3);
        }
    }
}

/**
 * TRACTOR
 **/

zoom_tractor = 0.82*zoom;

module masse(){
    cube([1,20,10]);
}

module capot(){
    translate([-5,0,0])cube([10,30,10]);
    minkowski(){
        hull(){
            translate([0,14.5,10])cube([10,31,1], center=true);
            
            translate([0,28,15])rotate([0,90,0]) cylinder(10,r=2, center=true);
            translate([0,0,16])rotate([0,90,0]) cylinder(10,r=2, center=true);
        }
        sphere(1);
    }
}

module cabine(){
    //translate([-12,0,0])cube([24,24,35]);
    translate([-11,0,0])cube([22,24,10]);
    hull(){
        translate([-11,0,10])cube([22,24,0.1]);
        translate([-12,0,20])cube([24,24,0.1]);
    }
    hull(){
        translate([-12,0,20])cube([24,24,0.1]);
        translate([-11,2,35])cube([22,20,0.1]);
    }
    hull(){
        translate([-10.5,2.5,35])cylinder(2,r=1);
        translate([10.5,2.5,35])cylinder(2,r=1);
        translate([-10.5,21.5,35])cylinder(1,r=1);
        translate([10.5,21.5,35])cylinder(1,r=1);
    }
}

module tractor_body(){
    translate([0,0,2*zoom_tractor])essieu(31*zoom_tractor, 7*zoom_tractor);
    translate([0,40*zoom_tractor,0])essieu(31*zoom_tractor, 6*zoom_tractor);
    translate([0,15*zoom_tractor,0]) scale(zoom_tractor) capot();
    translate([0,-5*zoom_tractor,0])crochet_female(22*zoom_tractor);
    difference(){
        translate([0,-5*zoom_tractor,0]) scale(zoom_tractor)cabine();
        for(i=[0,1]){
            mirror([i,0,0]) translate([-31/2*zoom_tractor,0,4*zoom_tractor])rotate([0,90,0])cylinder(r=(25+4)/2*zoom_tractor,4.5*zoom_tractor);
        }
    }
}

//160 voie
//2750 essieu

module tractor(mode){
    if(mode==0){
        x=13*zoom_tractor;
        translate([0,x,8*zoom_tractor])tractor_body();
        for(i=[0,1]){
            mirror([i,0,0])translate([31/2*zoom_tractor,x,12*zoom_tractor])rotate([0,90,0])roue(25*zoom_tractor,6*zoom_tractor);
            mirror([i,0,0])translate([31/2*zoom_tractor,40*zoom_tractor+x,10*zoom_tractor])rotate([0,90,0]) roue(20*zoom_tractor,5*zoom_tractor);
        }
    }
    if(mode==1){
        translate([0,0,0])tractor_body();
        for(i=[0,1]){
            mirror([i,0,0])translate([33,0,3])roue(20*zoom_tractor,5*zoom_tractor);
            mirror([i,0,0])translate([33,30,3.6])roue(25*zoom_tractor,6*zoom_tractor);
        }
    }
    if(mode==2){
        translate([0,0,0])tractor_body();
    }
    if(mode==3){
        for(i=[0,1]){
            mirror([i,0,0])translate([14,0,3])roue(20*zoom_tractor,5*zoom_tractor);
            mirror([i,0,0])translate([14,30,3.6])roue(25*zoom_tractor,6*zoom_tractor);
        }
    }
}

/**
 * BENNE
 **/

//benne_l = 70;
//benne_caisse_h = 28;
//benne_lg = 33;
//benne_lg_chassi = 22;

benne_l = 60;
benne_caisse_h = 20;
benne_lg = 33;
benne_lg_chassi = 22;

module chassi(l, lg, h){
    difference(){
        translate([-lg/2,0,0])cube([lg,benne_l,11]);
        translate([0,l,8])rotate([40,0,0]) translate([-15,-30,-30]) cube([30,30,30]);
    }
    translate([0,benne_l,0]) mirror([0,1,0])crochet_male(lg);
    translate([0,10,0])essieu(31, 7);
    translate([0,32,0])essieu(31, 7);
}

module caisse(l, lg,h){
    difference(){
        translate([-lg/2,0,0])cube([lg,l,h]);
        for(i=[0,1]){
            mirror([i,0,0])translate([11,-1,0]) rotate([0,40,0]) cube([30, l+2,30]);
        }
    }
}



module benne_body(){
    chassi(benne_l, benne_lg_chassi, 11);
    translate([0,0,10])difference(){
        caisse(benne_l, benne_lg, benne_caisse_h);
        translate([0,2,2]) caisse(benne_l-4, benne_lg-4, benne_caisse_h);
    }
    //translate([0,86,0]) crochet(22);
}

module benne(mode){
    if(mode==0){
        x=-68;
        translate([0,x,8])benne_body();
        for(i=[0,1]){
            mirror([i,0,0]) translate([31/2,x+10,10])rotate([0,90,0])roue(20,6,false);
            mirror([i,0,0]) translate([31/2,x+32,10])rotate([0,90,0]) roue(20,6,false);
        
        }
    }
    if(mode==1) {
        translate([0,0,0])benne_body();
        for(i=[0,1]){
            mirror([i,0,0])translate([33,0,3.6])roue(20,6,false);
            mirror([i,0,0])translate([33,30,3.6])roue(20,6,false);
        }
    }
    if(mode==2) {
        translate([0,0,0])benne_body();
    }
    if(mode==3) {
        for(i=[0,1]){
            mirror([i,0,0])translate([13,13,3.6])roue(20,6,false);
            mirror([i,0,0])translate([13,-13,3.6])roue(20,6,false);
        }
    }
}

/**
 * BONHOMME
 **/

module bonhomme(){
    h = 1950*echelle;
    r1 = 150*echelle;
    r2 = 200*echelle;
    
    r_jambe = 100*echelle;
    
    hull(){
        translate([0,0,(h-r2)/2]) cube([r_jambe*2, r_jambe*4*0.9, 1], center=true);
        translate([0,0,(h-r2)]) cylinder(1, r = 100*echelle);
    }//cylinder((h-r2)/2, r2, 100*echelle);
    translate([0,0,h-r2])sphere(r= r2);
    
    translate([0,r_jambe*0.8,0])cylinder(h/2, r= r_jambe);
    translate([0,-r_jambe*0.8,0])cylinder(h/2, r= r_jambe);
    
}


/**
 * DECHAUMEUR
 **/

e = 4000/3*echelle;
dechaumeur_lg = 4000*echelle;
dechaumeur_y1 = 1200*echelle;
dechaumeur_y2 = 2400*echelle;
dechaumeur_y3 = 3900*echelle;

module dent(){
    h=19;
    hull(){
        difference(){
            translate([-5,-5,0]) cube([10,10,1]);
            for(i=[0,1]){
                 translate([0,-6,-1])  mirror([i,0,0]) rotate([0,0,-30])cube([20,20,5]);
            }
        }
        translate([-1,0,0]) cube([2,4,8]);
        
    }
    translate([-1,0,0]) cube([2,4,h]);
}

module dent2(h, i=0){
    r=4;
    hull(){
        if(i==0){
            translate([2,r-2-3,r]) rotate([20,90,0])cylinder(1, r=r, center = true);
            translate([-2,r-2+3,r]) rotate([-20,90,0])cylinder(1, r=r, center = true);
        }
        if(i>0){
            translate([1,r-2,r]) rotate([20,90,0])cylinder(1, r=r, center = true);
        }
        
        
        translate([-1,0,5]) cube([2,4,8]);
        
    }
    translate([-1,0,5]) cube([2,4,h-5]);
}


module dechaumeur_body(){
    translate([0,0,8])crochet_male(30, 10, false);
     
    for(i=[-1,0,1]){
        translate([i*1.5*e-2,0,17])cube([4, dechaumeur_y3-6,2]);
    }
    
    translate([-1.5*e,0,17])cube([3*e,4,2]);
    translate([-1.5*e,dechaumeur_y1,17])cube([3*e,4,2]);
    translate([-1.9*e,dechaumeur_y2,17])cube([3.8*e,4,2]);
    
    
    translate([0,0,0]) dent();
    translate([-1*e,0,0]) dent();
    translate([1*e,0,0]) dent();
    translate([0.5*e,dechaumeur_y1,0])dent();
    translate([1.5*e,dechaumeur_y1,0])dent();
    translate([-0.5*e,dechaumeur_y1,0])dent();
    translate([-1.5*e,dechaumeur_y1,0])dent();
    translate([-1*e,dechaumeur_y2,0])dent2(19);
    translate([-1.9*e,dechaumeur_y2,0])dent2(19,1);
    translate([1*e,dechaumeur_y2,0])dent2(19);
    translate([1.9*e,dechaumeur_y2,0])mirror([1,0,0])dent2(19, 1);
    translate([-0*e,dechaumeur_y2,0])dent2(19);
    
    hull(){
        translate([0, dechaumeur_y3, 5]) rotate([0,90,0])cylinder(3*e+4,r=5, center=true);
        translate([0, dechaumeur_y3-6, 17]) rotate([0,90,0])cylinder(3*e+4,r=2, center=true);
    }
    
    //translate([-1*e,0,0])cube([2*e,4,1]);
    //translate([-1.5*e,dechaumeur_y1,0])cube([3*e,4,1]);
    //translate([-1.9*e,dechaumeur_y2,0])cube([3.8*e,4,1]);
}

module dechaumeur(mode){
    if(mode){
        translate([0,0,19]) rotate([0,180,0]) dechaumeur_body();
    } else {
        translate([0,-10,0])rotate([0,0,180]) dechaumeur_body();
    }
}

/**
 * COVER CROP
 **/

cover_crop_lg = 1000*echelle;
y1 = 600*echelle;
cover_crop_essieu = 2500*echelle;
y3 = 4300*echelle;

cover_crop_lg1 = 4000*echelle;
cover_crop_r = 520*echelle;

module cover_crop_disque(z){
    l = cover_crop_lg1;
    nbr = 16;
    hull(){
        translate([-l/2,-2,z])cube([l,4,2]);
    
        translate([0,0,cover_crop_r]) rotate([0,90,0]) cylinder(r=2, l, center=true);
    }
    for(i=[0:nbr-1]){
        translate([l/2-i*l/(nbr-1),0,cover_crop_r]) rotate([0,90,0]) cylinder(r= cover_crop_r, 1, center=true);
    }
}

module cover_crop_body(){
    translate([0,0,8])crochet_male(cover_crop_lg, 10, false);
    
    translate([-cover_crop_lg/2,0,16])cube([cover_crop_lg,59,3]);
    
    translate([0,y1,2]) rotate([0,0,20]) cover_crop_disque(15);
    //translate([0,cover_crop_essieu,6.5]) essieu(28,7);
    translate([0,cover_crop_essieu,11]) rotate([0,180,0]) essieu(28,7);
    
    translate([-cover_crop_lg/2,cover_crop_essieu-3,6.5]) cube([cover_crop_lg,6,12]);
    translate([0,y3,2]) rotate([0,0,-20]) cover_crop_disque(15);

    
    
    
}

module cover_crop(mode){
    if(mode==0){
        translate([0,-10,0])rotate([0,0,180]) cover_crop_body();
        for(i=[0,1]){
            translate([0,-10,0]) mirror([i,0,0]) translate([31/2,-cover_crop_essieu,9])rotate([0,90,0])roue(18,6,false);
        }
    } else {
        translate([0,0,19])rotate([0,180,0])cover_crop_body();
        for(i=[0,1]){
            translate([0,-10,0]) mirror([i,0,0]) translate([35,cover_crop_essieu+10,3.6])roue(18,6,false);
        }
    }
}

/**
 * SEMOIR dimension 100
 **/

echelle_semoir = 1/64;

semoir_l = 3000*echelle_semoir;

roue_semoir = 600*echelle_semoir;
h=10;

module semoir_body(){
    translate([0,0,8])crochet_male(10, 10, false);
    hull(){
        translate([-5,0,17]) cube([10,2,2]);
        translate([-5,10,h]) cube([10,2,2]);
    }
    
    #translate([-20,0,0]) cube([40,2,0.5]);
    hull(){
        translate([-semoir_l/2,10,h])cube([semoir_l, 2 ,2]);
        translate([0,15,h+10]) rotate([0,90,0]) cylinder(r=2, semoir_l, center = true);
        translate([0,5,h+10]) rotate([0,90,0]) cylinder(r=2, semoir_l, center = true);
    }
    
    hull(){
        translate([-semoir_l/2+10,10,h])cube([semoir_l-20, 2 ,2]);
        translate([-semoir_l/2,10,roue_semoir/2])cube([semoir_l, 2 ,2]);
    }
        
    essieu(28,7);
    translate([-semoir_l/2,12,roue_semoir/2]) rotate([0,90,0]) roue(roue_semoir,3, false);
    
}

module semoir(mode){
    if(mode){
        translate([0,0,19]) rotate([0,180,0]) semoir_body();
    } else {
        translate([0,-10,0])rotate([0,0,180]) semoir_body();
    }
}

/**
 * Vader dimension 100
 **/

vader_echelle = 1/64;

vader_l = 4000*vader_echelle;

vader_roue_d = 800*vader_echelle;
vader_roue_lg = 180*vader_echelle;

vader_roue_x = 3000*vader_echelle;

vader_disque_d = 300*vader_echelle;
vader_disque_x2 = 2300*vader_echelle;
vader_disque_x1 = 2000*vader_echelle;


vader_h=5;

module vader_roue(){
    roue(vader_roue_d,vader_roue_lg, false);
}

module vader_disque(){
    cylinder(1, r=vader_disque_d/2);
}

module semoir_body(){
    translate([0,0,8])crochet_male(10, 10, false);
    hull(){
        translate([-5,0,17]) cube([10,2,2]);
        translate([-5,10,h]) cube([10,2,2]);
    }
    hull(){
        translate([-semoir_l/2+10,10,h])cube([semoir_l-20, 2 ,2]);
        translate([-semoir_l/2,10,vader_h])cube([semoir_l, 2 ,2]);
    }
    
    translate([-semoir_l/2,10,vader_h]) cube([2,22,2]);
    translate([+semoir_l/2-2,10,vader_h]) cube([2,22,2]);
    translate([-1,10,vader_h]) cube([2,22,2]);
    
    #translate([-20,0,0]) cube([40,2,0.5]);
    
    //tremie
    hull(){
        translate([-semoir_l/2,vader_disque_x1,vader_h])cube([semoir_l, 6 ,2]);
        translate([0,vader_disque_x1-10,vader_h+20]) rotate([0,90,0]) cylinder(r=2, semoir_l, center = true);
        translate([0,vader_disque_x1+15,vader_h+20]) rotate([0,90,0]) cylinder(r=2, semoir_l, center = true);
    }
    
   
        
    for(i = [-6:5]){
         translate([semoir_l/12*(i+0.5),vader_roue_x,roue_semoir/2]) rotate([0,90,0]) vader_roue();
    }
    
    for(i = [-6:5]){
        hull(){
            translate([semoir_l/12*(i+0.5),vader_disque_x1,vader_disque_d/2]) 
                rotate([0,90,0]) vader_disque();
            translate([semoir_l/12*(i+0.5),vader_disque_x1,vader_disque_d])
                cube([1,vader_disque_d,2]);
        }
    }
    
    for(i = [-5:5]){
        hull(){
            translate([semoir_l/12*(i),vader_disque_x2,vader_disque_d/2]) rotate([0,90,0]) vader_disque();
            translate([semoir_l/12*(i),vader_disque_x1,vader_disque_d])
                cube([1,vader_disque_d,2]);
        }
    }
   
    
}

module vader(mode){
    if(mode){
        translate([0,0,19]) rotate([0,180,0]) semoir_body();
    } else {
        translate([0,-10,0])rotate([0,0,180]) semoir_body();
    }
}

/**
 * MOISSONEUSE
 **/


moissoneuse_lg = 40;
moissoneuse_l = 73;
moissoneuse_h = 38;

moissoneuse_cabine_l=19;
moissoneuse_cabine_lg = 20;

goulotte_angle = -10;

tremie_lg = 20;

goulotte_l=50;
goulotte_r=2.5;
goulotte_h = 32;

//coupe
coupe_l = 6000*echelle;
coupe_rabatteur_l = coupe_l - 200*echelle;

nb_coueilleur = 6;
coupe_mais_l = nb_coueilleur*750*echelle;
convoyeur_lg= 16;




module coupe_core(y){
   hull(){
       translate([-convoyeur_lg/2,y-0,2]) cube([convoyeur_lg, 5, 8]);
       translate([0,8,20]) rotate([0,90,0])cylinder(r=3, convoyeur_lg, center =true);
   }
   translate([0,8,20]) rotate([0,90,0])cylinder(r=1, 20.2, center =true);
}

module coupe(l){
   y=-9;
   coupe_core(y);
   hull(){
      translate([0,y,6]) rotate([0,90,0])cylinder(r=6, coupe_l, center =true);
      translate([0,y-20,1]) rotate([0,90,0])cylinder(r=1, coupe_l, center =true);
     
   } 
   translate([0,y-10,10]) rotate([0,90,0])cylinder(r=8, coupe_rabatteur_l, center =true);
}

module coupe_mais(l){
    y=-9;
   coupe_core(y);
   hull(){
      translate([0,y,5]) rotate([0,90,0])cylinder(r=5, coupe_mais_l, center =true);
      translate([0,y-20,1]) rotate([0,90,0])cylinder(r=1, coupe_mais_l, center =true);    
   }
   for(i = [1:nb_coueilleur-1]){
       hull(){
           translate([-coupe_mais_l/2 + i*coupe_mais_l/nb_coueilleur,y-5,0]) cylinder(6, r= 4);
           translate([-coupe_mais_l/2 + i*coupe_mais_l/nb_coueilleur,y-28,0])  cylinder(2, r=1);
       }
   }
   for(i=[0,1]){
       mirror([i,0,0])hull(){
           translate([coupe_mais_l/2,y-5,0]) difference(){
               cylinder(6, r= 4);
               translate([0,-10,0])cube([20,20,20]);
           }
           translate([coupe_mais_l/2 -1,y-28,0])  cylinder(2, r=1);
       }
   }
   
}

module moissoneuse_goulotte(){
    difference(){
        union(){
            rotate([0,90,0])cylinder(r=goulotte_r, goulotte_l);
            sphere(goulotte_r);
        }
        translate([0.5,0,-goulotte_r])cylinder(r=1.5, 30);
    }
    translate([goulotte_l-2,0,-goulotte_r-2])cylinder(r=2, goulotte_r+2); 
}



module moissoneuse_cabine(){
    l=moissoneuse_cabine_l;
    hull(){
        translate([-moissoneuse_cabine_lg/2,0,0])
            cube([moissoneuse_cabine_lg, moissoneuse_cabine_l, 1]);
        translate([-moissoneuse_cabine_lg/2-1,-2,20]) 
            cube([moissoneuse_cabine_lg+2, moissoneuse_cabine_l+2, 1]);
    }
    minkowski(){
        translate([-11,-2,20]) cube([moissoneuse_cabine_lg+2, moissoneuse_cabine_l+2, 0.1]);
        sphere(1);
    }
    hull(){
        translate([-15,5,0])cylinder(2, r=5);
        translate([15,5,0])cylinder(2, r=5);
        translate([-20,moissoneuse_cabine_l-1,0])cube([40, 1, 2]);
    }
}

module moissoneuse_tremie_out(){
    hull(){
        translate([moissoneuse_lg/2-5,0,0]) rotate([-90,0,0])cylinder(r=5, tremie_lg);
        translate([-moissoneuse_lg/2+5,0,0]) rotate([-90,0,0])cylinder(r=5, tremie_lg);
      
    }
}

module moissoneuse_tremie_in(){
    hull(){
        translate([moissoneuse_lg/2-5-3,2,0]) rotate([-90,0,0])cylinder(r=3, tremie_lg-4);
        translate([-moissoneuse_lg/2+5,2,0]) rotate([-90,0,0])cylinder(r=3, tremie_lg-4);
        translate([-2.5,tremie_lg/2,-8]) rotate([0,-90,0])cylinder(r=3, moissoneuse_lg-4-5, center = true);
    }
    translate([-moissoneuse_lg/2+2,2,0]) cube([moissoneuse_lg-4, tremie_lg-4,50]);
}

moissoneuse_y1 = 10;
moissoneuse_y2 = 60;
essieu_d = 31;
module moissoneuse_body(){
    l=moissoneuse_l;
    difference(){
        union(){
            translate([0,moissoneuse_y1,2])essieu(essieu_d, 7);
            translate([0,moissoneuse_y2,0])essieu(essieu_d, 6);
            hull(){
                translate([-10,5,0]) cube([20, 55, 30]);
                translate([-10,5,10]) cube([20, 65, 20]);
            }
            hull(){
                translate([-10,5,28]) cube([20, l-3, 2]);
                translate([-10,5,10]) cube([20, l, 1]);
            }
            translate([0,0,18]) moissoneuse_cabine();//cabine
            translate([0,moissoneuse_cabine_l,moissoneuse_h]) moissoneuse_tremie_out();//cabine
            hull(){
                translate([-20,moissoneuse_cabine_l,18]) cube([40, 35, 20]);
                translate([-20,30,0]) cube([40, 15, 10]);
            }
            //translate([0,64,0])rotate([0,0,180])crochet_female(22);
    
        }
        hull(){
            translate([0,8,12]) rotate([0,90,0])cylinder(r=3.2, convoyeur_lg+0.4, center =true);
            translate([0,0,9]) rotate([0,90,0])cylinder(r=7, convoyeur_lg+0.4, center =true);
        }
        translate([0,moissoneuse_cabine_l,38]) moissoneuse_tremie_in();//cabine
        hull(){
            translate([0,8,12]) rotate([0,90,0])cylinder(r=1.1, 22, center =true);
            translate([0,5,13]) rotate([0,90,0])cylinder(r=1.1, 22, center =true);
        }
        translate([17,moissoneuse_cabine_l+5,goulotte_h]) hull(){
            r=3;
            rotate([-90,0,0]) cylinder(100, r=r, $fn=8);
            sphere(r);
            translate([5,0,0.4]) rotate([-90,0,0]) cylinder(100, r=r+0.2, $fn=8);
            translate([5,0,0]) sphere(r);
        }
        translate([17,moissoneuse_cabine_l+5.5,30]) rotate([0,goulotte_angle,0])        translate([0,0,-5])cylinder(r=1.5,30);
        
        
   
    }
    //translate([0,15,0])capot();
    //translate([0,-5,0])crochet(22);
    //translate([0,-5,0])cabine();
    
}

module moissoneuse(mode){
    if(mode==0){
        y=0;
        translate([0,y,8])moissoneuse_body();
        coupe();
        translate([17,moissoneuse_cabine_l+5+y,goulotte_h+8])rotate([0,goulotte_angle,0])  rotate([0,0,90]) moissoneuse_goulotte();
        for(i=[0,1]){
            mirror([i,0,0])translate([-essieu_d/2,y+moissoneuse_y1,12])rotate([0,-90,0])roue(25,6);
            mirror([i,0,0])translate([-essieu_d/2,y+moissoneuse_y2,10])rotate([0,-90,0]) roue(20,5);
        }
    }
    if(mode==1){
        translate([0,0,0])moissoneuse_body();
        for(i=[0,1]){
            mirror([i,0,0])translate([35,20,3])roue(20,5);
            mirror([i,0,0])translate([35,50,3.6])roue(25,6);
        }
        translate([0,-30,0]) rotate([0,0,180]) coupe_mais();
        translate([-53,0,goulotte_r])rotate([90,0,90])moissoneuse_goulotte();
        
    }
    if(mode==2){
        translate([0,0,0])moissoneuse_body();
    }
    if(mode==3){
        for(i=[0,1]){
            mirror([i,0,0])translate([17,0,3])roue(20,5);
            mirror([i,0,0])translate([17,30,3.6])roue(25,6);
        }
        translate([0,0,goulotte_r])rotate([90,0,90])moissoneuse_goulotte();
    }
    if(mode==4){
        coupe();
    }
    if(mode==5){
        coupe_mais();
    }
}

//translate([-20,0,0])bonhomme();
//tractor(0);
//dechaumeur(0);
//cover_crop(0);
vader(0);
//moissoneuse(1);
//benne(0);
//essieu(33);
