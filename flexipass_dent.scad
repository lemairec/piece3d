use <libs/threads.scad>
$fs=$fs/4;
$fa=$fa/4;

pointe_l = 264;

module flexi_pointe(){
    hull(){
        rotate([0,44,0])cylinder(r=1, 264);
        translate([100,-15,20]) rotate([0,44,0])cube([5, 30, 200]);
        
        
    }
}


module flexi_pointe_sup(){
    translate([230,0,450])hull(){
        rotate([0,44+146,0])cylinder(r=1, 264);
        translate([65,-15,20]) rotate([0,44+146,0])cube([5, 30, 310]);
        
        
    }
}

module flexi_ailette(){
   translate([255,20,63]) rotate([2,-16,0]) hull(){
        cube([100,1,10]);
        translate([130, 130]) cube([100,1,10]);
        
        
        
    }
}

module dent2d(){
    polygon([[0,0.3], [10,-07], [20,-15], [30,-24], [40,-32]
                , [50,-40], [60,-49], [70,-55], [80,-62], [90,-69]
                , [100,-76], [120,-89], [140,-99], [160,-108], [180,-116]
                , [200,-125], [240,-139], [280,-150], [320,-158], [360,-164]
                , [400,-166], [440,-166], [480,-165], [520,-164],
                , [520,-220], [480,-221], [440,-222], [400,-223],
                , [360,-222], [320,-217], [280,-212], [240,-201],
                , [200,-187], [180,-180], [160,-173], [140,-165], [120,-156]
                , [100,-146], [90,-141],[80,-135], [70,-130], [60,-123]
                , [50,-117], [40,-110], [30,-104], [20,-96], [10,-89]
                , [00,-80]]);
}

module dent2d2(){
    rotate([0,0,-90])difference(){
        translate([-467, 0]) intersection(){
            square([800,401.4]);
            translate([0,401])circle(615.5+60);
        }
        translate([-467, 0]) translate([0,401])circle(615.5);
        rotate([0,0,2.79]) translate([0,-200,0])square(200);
    }
}

module dent3d(){
    e = 25;
    rotate([0,-90, 90]) rotate([0,0,2.8])difference(){
        translate([0,0,-e/2])
            linear_extrude(25){
                dent2d();

        }
    }
}

module dent_trio(){
    e = 25;
    rotate([0,-90, 90]) rotate([0,0,2.8])difference(){
        translate([0,0,-e/2])
            linear_extrude(25){
                dent2d();

        }
        translate([60,-88, -1-e/2]) cylinder(r=13/2, 30);
        hull(){
            translate([10,-90])sphere(13/2);
            translate([52,-40])sphere(13/2);
        }
        hull(){
            translate([145,-100])sphere(13/2);
            translate([112,-160])sphere(13/2);
        }
    }
}

a1 = 44;
a2 = 146;

module pointe2d(){
    difference(){
        union(){
            hull(){
                translate([-70,160,0]) rotate([0,0,180+a1])square([1, 260]);       
                translate([-20,-50,0]) rotate([0,0,180+90-20]) square([1, 100]);
            }
            translate([90,-20]) rotate([00,0,90-(a1+a2)])square([90,300]);
            
        }
        
        translate([96,-4]) rotate([0,0,180-40])square([23,23]);
        translate([192,-34]) rotate([0,0,180-24.4])square([23,25]);
        
        dent2d2();
    }
}

module pointe3d(){
    e = 25;
    difference(){
        translate([0,0,-e/2])
            linear_extrude(25){
                pointe2d();
            }
        translate([96,-4]) rotate([90,0,180-40]) translate([11.5,0,0]) cylinder(r=6,200, center = true);
        translate([192,-34]) rotate([90,0,180-24.4])translate([11.5,0,0]) cylinder(r=6,200, center = true);
    }
}



mode = 2;


e2 = 35; //largeur
e3 = 40;

module pointe3(){
    hull(){
        translate([0,0,-70]) cube([1, 10, 330]);
        translate([e3,0,0])cube([1, 10, 260]);
    }
}



if(mode==0){
    flexi_pointe();

    flexi_pointe_sup();
    flexi_ailette();
    mirror([0,1])flexi_ailette();
    
    
} else if(mode==1){
    translate([-210,0,-60]) union(){
        flexi_pointe();
        flexi_pointe_sup();
        flexi_ailette();
        mirror([0,1])flexi_ailette();
        
    }
    color("blue")dent_trio();
} else if(mode==2){
    %color("gray")dent_trio();
    
    rotate([0,-90, 90]) pointe3d();
    e = 24;
    color("green") translate([-160,-e2/2,-70]) rotate([0,90-a1]) translate([-10,0,-10]) cube([10, e2, 260]);
    
    color("blue")translate([-160,-5,-70]) rotate([0,90-a1]) translate([-e3-10,0,-10])pointe3();
    
    translate([-210,0,-60])translate([230,0,450])translate([65,0,20]) rotate([0,44+146,0])
         color("green") translate([10, -e2/2, -5])cube([10,e2, 310]);
    
    translate([-210,0,-60])translate([230,0,450])translate([65,0,20]) rotate([0,44+146,0])
         color("blue") translate([e3-10, -5, -10])cube([e3, 10, 310]);
    
} else {
    pointe2d();
}