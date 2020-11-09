use <config.scad>

$fs=$fs/2;
$fa=$fa/2;

h=27;
l=75;
lg=75;
lg2=50;
r2 = 4;
r_vis = 2.2;

l2=40;


difference(){
    union (){
        hull(){
            translate([-lg/2,-l/2, 0]) cylinder(r=r2, h=h);
            translate([lg/2,-l/2, 0]) cylinder(r=r2, h=h);
        }

        hull(){
            translate([-lg/2,l/2, 0]) cylinder(r=r2, h=h);
            translate([lg/2,l/2, 0]) cylinder(r=r2, h=h);
        }
        
        translate([-lg2/2-5,-l/2, 0]) cube([lg2+10, 15, 5]);
        translate([15,-l/2, 0]) cube([5, 15, h]);
        
        
        hull(){
            translate([-15,-l/2, 0]) cylinder(r=r2, h=h);
            translate([-15,l/2, 0]) cylinder(r=r2, h=h);
        }
        
        hull(){
            translate([-lg/2,-l/2, 0]) cylinder(r=r2, h=h);
            translate([-lg/2,-l/2-l2+r2, 0]) cylinder(r=r2, h=h);
        }
        hull(){
            translate([ lg/2,-l/2, 0]) cylinder(r=r2, h=h);
            translate([ lg/2,-l/2-l2+r2, 0]) cylinder(r=r2, h=h);
        }
    }
    translate([-lg/2,-l/2, -1]) cylinder(r=r_vis, h=h+2);
    translate([ lg/2,-l/2, -1]) cylinder(r=r_vis, h=h+2);
    translate([-lg2/2,-l/2+10, -1]) cylinder(r=r_vis, h=h+2);
    translate([ lg2/2,-l/2+10, -1]) cylinder(r=r_vis, h=h+2);
    
    translate([-lg/2, l/2, -1]) cylinder(r=r_vis, h=h+2);
    translate([ lg/2, l/2, -1]) cylinder(r=r_vis, h=h+2);
    
    translate([ 0, l/4, h-12]) cube([18,50,13]);
    
    translate([ 0, -l, h-18]) cube([5,55,20]);
    
    translate([ -30, -50, h-5]) cube([5,100,6]);
    
    translate([ -30, 0, h-5]) cube([100,5,6]);
}