$fs=$fs/4;
$fa=$fa/4;

module roue(){
    rotate([0,90,0]) cylinder(h=130, r=200, center=true);
}

module main(){
    hull(){
        translate([-20,0,0]) cube([40, 10, 150]);
        translate([0,120,80]) rotate([0,90,0]) cylinder(h=40, r=80, center=true);
    }
}

translate([-900,0,200]) roue();
translate([900,0,200]) roue();

translate([0,0,500]) cube([2000,100,100], center=true);
translate([500,0,750]) cube([100,100,450], center=true);
translate([-500,0,750]) cube([100,100,450], center=true);
translate([0,0,950]) cube([1000,100,100], center=true);

translate([500,0,750]) cube([100,100,450], center=true);
translate([-500,0,750]) cube([100,100,450], center=true);
translate([0,0,1250]) cube([500,100,100], center=true);


translate([500,50,300])rotate([0,0,180])main();
translate([-500,50,300])rotate([0,0,180])main();
translate([400,50,300])rotate([0,0,180])main();
translate([-400,50,300])rotate([0,0,180])main();

translate([0,0,1100]) rotate([0,90,0]) cylinder(h=500, r=40, center=true);
translate([0,0,700]) rotate([0,90,0]) cylinder(h=2*500, r=40, center=true);



translate([-200,0,0])union(){
    
    translate([250,110,630])rotate([0,0,180])main();
    translate([-250,110,630])rotate([0,0,180])main();
    translate([0,110,1030])rotate([0,0,180])main();





    translate([450,100,300])main();
    translate([-450,100,300])main();
    hull(){
        translate([0,100,500]) cube([1000,40,300], center=true);
        translate([0,100,1100]) cube([150,40,150], center=true);
    }
}