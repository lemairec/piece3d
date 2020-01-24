$fs=$fs/4;
$fa=$fa/4;

e = 2;
h = 5;

l = 8;


module bougie(d){
    r= d/2;
    difference(){
        cylinder(r=r+e, h);
        translate([0,0,-1])cylinder(r=r, h+2);
    }
    translate([r+e/2,-l/2,0]) cube([e,l,h]);
    translate([r+e+e/2,0,0.5]) rotate([90,0,90])linear_extrude(height = 0.5) {
       text(text = str(d), size = 4.5, font="Liberation Mono:style=Bold", halign = "center");
     }
    
}

module bougie2(d){
    bougie(d);
    translate([0,d+3*e,0])bougie(d);
}

//55
bougie2(61);
