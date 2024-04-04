
module mk3(){
    difference(){
        union(){
            polygon([[-90,-60],[0,-60], 
            [40,-25], [40,5],
            [10,40],[-5,40],
            [-25,30], [-50,5], [-90,-15]]);
            
            translate([0,-20])circle(r=40);
            translate([5,5])circle(r=35);
            
            
            translate([-5,5])circle(r=35);
        }
        //circle(r=15);
    }
}

module antirotation_mk3(){
    difference(){
        translate([-85,-45])cube([85+65, 110, 30]);
        translate([0,0,0.5]) mirror([0,1])linear_extrude(height = 40) mk3();
        translate([0,0,-1])cylinder(r=20, h=30);
        translate([-60,-30,-1])cylinder(r=4.5, h=50);
        translate([50,-30,-1])cylinder(r=4.5, h=50);
        translate([50,50,-1])cylinder(r=4.5, h=50);
        
        %cylinder(r=65,h=10);
    }
}

module d_7215(){
    difference(){
        union(){
            polygon([[-95,-63],[-80,-66], [-50,-72],
            [-5,-68], [7,-62],[22,-51], [34,-40], [42,-30], [46,-21], [49,-10],
            [50,0],[49,10], [46,20], [40, 30], [30, 40], [23, 45], [10,50],
            [0,52] ,[-28,50] ,[-44, 45], [-53,41], [-84,23], [-91,18]]);
         
        }
        circle(r=15);
    }
}

module test_7215(){
    difference(){
    linear_extrude(height = 40) scale(1.1) d_7215();
    linear_extrude(height = 42) d_7215();
    //translate([-190,-80])cube([100,100,100]);
}
}

module antirotation_7215(){
    difference(){
        hull(){
            translate([-75,-65])cube([75+65, 130, 30]);
            translate([-79,-65]) rotate([0,0,22])cube([70, 105, 30]);
        }
        translate([0,0,1]) mirror([0,1]) rotate([0,0,-20])linear_extrude(height = 40) d_7215();
        translate([0,0,-1])cylinder(r=20, h=40);
        translate([-100,-18,26]) mirror([0,1]) rotate([0,-90,-20])cylinder(r=25, h=100, center = true);
        %cylinder(r=65,h=10);
    }
}
//antirotation_7215();

antirotation_7215();

            