use <MCAD/shapes.scad>;
use <rounded_box.scad>;
use <nema17.scad>;
include <MCAD/materials.scad>

//https://github.com/mazerte/openscad-openbuilds
r_vis = 5.2/2;
color_black = [0.27, 0.27, 0.3];
color_white = [1.00, 1.00, 1.00, 0.8];
color_nylon = [1.00, 1.00, 1.00];
color_aluminum = Aluminum;

module vslot(length=50, sections=1, finish, center = false) {
  size=20;
  cutext=[[0.00, 5.43], [4.57, 10.00], [4.57, 10.10], [-4.57, 10.10], [-4.57, 10.00]];
  cutint=[[-2.84, 3.90], [-0.21, 3.90], [0.00, 3.70], [0.21, 3.90], [2.84, 3.90], [5.50, 6.56], [5.50, 8.20], [2.89, 8.20], [2.89, 9.20], [-2.89, 9.20], [-2.89, 8.20], [-5.50, 8.20], [-5.50, 6.56]];
  cutintin=[[-2.84, 3.90], [-0.21, 3.90], [0.00, 3.70], [0.21, 3.90], [2.84, 3.90], [6.20, 7.30], [8.20, 7.30], [8.20, 10.10], [-8.20, 10.10], [-8.20, 7.30], [-6.20, 7.30]];
  cutint2=[[8.20, 8.20], [6.57, 8.20], [6.57, 7.62], [7.62, 6.57], [8.20, 6.57]];

  module profile() {
    translate([0, 0, length/2]) difference() {
      translate([-size*sections/2, -10, -length/2])cube([size*sections, size, length]);
      for (section=[0:sections-1]) {
        offset = -(sections-1)*(size/2)+section*size;
        total_length = length+10;
        translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) circle(4.2/2);
        for (angle=[0:90:270]) {
          if (angle==0 || angle==180 || (angle==90 && section==0) || (angle==270 && section==sections-1)) {
            translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) rotate(angle) polygon(cutext);
            translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) rotate(angle) polygon(cutint);
          } else {
            translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) rotate(angle) polygon(cutintin);
          }
          if ((section==0 && (angle==90 || angle==180)) || (section==sections-1 && (angle==0 || angle==270))) {
            translate([offset, 0, -(total_length)/2]) linear_extrude(total_length) rotate(angle) polygon(cutint2);
          }
        }
      }
    }
  }

    if(center){
        translate([0,0,-length/2])color(finish) profile();
    } else {
        color(finish) profile();
    }
}

module vslot20x20(length, finish) { vslot(length, 1, finish); }
module vslot20x40(length, finish) { vslot(length, 2, finish); }
module vslot20x60(length, finish) { vslot(length, 3, finish); }
module vslot20x80(length, finish) { vslot(length, 4, finish); }

module vslot20x20(length, finish) { vslot(length, 1, finish); }
module vslot20x40(length, finish) { vslot(length, 2, finish); }


module barre2040(length, center){
    echo("barre 2040 ", length);
    vslot(length, 2, color_aluminum, center);
}

module barre2040p(length, center){
    //echo("barre 2040p ", length);
    union(){
        vslot(length, 2, color_aluminum, center);
        translate([-18.5, -10, 0])cube([37, 20, length]);
    }
}

module barre2040p_lg(length, center){
    //echo("barre 2040p ", length);
    scale([1.01,1.02,1]) barre2040p(length, center);
}



module barre2020(length, center){
    echo("barre 2020 ", length);
    vslot(length, 1, color_aluminum, center);
}

module vwheel(type="solid", material=color_black) {
  model = type == "mini" ? 105 : 625;
  //rotate([0, 0, 0])   translate([0, 0, 0.5]) bearing(model=model, material=color_aluminum, sideMaterial=color_aluminum);
  //rotate([180, 0, 0]) translate([0, 0, 0.5]) bearing(model=model, material=color_aluminum, sideMaterial=color_aluminum);

  body =
    type == "solid" ? [[7, 5], [8, 5], [8, 0], [9, 0], [12, 3], [12, 8], [9, 11], [8, 11], [8, 5], [7, 6]]:
    type == "delrin" ? [[7, 5], [8, 5], [8, 0], [9, 0], [12, 3], [9.5, 5.5], [12, 8], [9, 11], [8, 11], [8, 5], [7, 6]]:
    type == "mini" ? [[5, 1], [6, 1], [9, 3], [9, 8], [6, 10], [5, 10]]:
    [[7, 5], [8, 5], [8, 0], [9, 0], [12, 3], [12, 8], [9, 11], [8, 11], [8, 5], [7, 6]];

  color(material) translate([0, 0, -5.5]) rotate_extrude(convexity = 32) polygon(body);
}

module solid_vwheel() { vwheel(); }
module xtreme_solid_vwheel() { vwheel(material=color_white); }
module derlin_vwheel() { vwheel(type="delrin"); }
module xtreme_derlin_vwheel() { vwheel(type="delrin", material=color_white); }
module mini_vwheel() { vwheel(type="mini"); }
module xtrem_mini_vwheel() { vwheel(type="mini", material=color_white); }
module metal_vwheel() { vwheel(type="delrin", material=color_aluminum); }

module vslot2020(){
    solid_vwheel();
}

module charriot_s(vslot = true){
    h_l=60;
    h_lg = 60;
    h_l2=h_l+15;
    h_lg2=h_lg+15;
    e=2;
    difference(){
        union(){
            myRoundedBox(h_l2, h_lg2, e, e);
        }
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*h_lg/2, -1]) cylinder(r=5/2, e+2);
            }
        }
    }
    
    for(i=[-1,1]){
        for(j=[-1,1]){
            color("red")translate([i*h_l/2, j*h_lg/2, -10])     vslot2020();
        }
    }
}

module charriot_bis(){
    x = 13;
    lg = 25;
    h=16;
    l = 52;
    e3=6;
    difference(){
        cube([l,20,h]);
        
        translate([-1,-1,h/2-2])cube([13,22,10]);
        
        
        translate([x,4,-1])cube([lg,12,h+2]);
        translate([x+lg/2, 0, h/2]) rotate([90,0,0]) cylinder(r=r_vis, 100, center = true);
        translate([l-e3, 0, h/2]) rotate([90,0,0]) cylinder(r=r_vis, 100, center = true);
        translate([e3, 10, h/2]) cylinder(r=r_vis, 100, center = true);
        
    }
    
    color("red")translate([x+lg/2, 10, h/2]) rotate([90,0,0])    vslot2020();
}

module charriot(vslot = true){
    e=3;
    h_l=70;
    h_lg = 40;
    h_l2=h_l+15;
    h_lg2=h_lg+15;
    h2 = 21+e;
    
    support_lg = 16;
    support_l = 14;
    difference(){
        union(){
            myRoundedBox(h_l2, h_lg2, e, e);
            translate([h_l2/2-support_l/2, h_lg2/2-support_lg/2, 0]) myRoundedBox(support_l, support_lg, h2, e);
            
            translate([-h_l2/2+support_lg/2, h_lg2/2-support_lg/2, 0]) myRoundedBox(support_lg, support_lg, h2, e);
            
            translate([-h_l2/2+support_lg/2, h_lg2/2-support_lg, 0]) cube([21, 8, h2]);
            
            for(i=[-1,1]){
                translate([i*h_l/2, -h_lg/2, 0]) cylinder(r=7, 5+e);
            }
        }
        
        translate([-19,h_lg/2+5,21/2+e]) rotate([90,0,0]) cylinder(r=r_vis, 100);
        
        translate([0, h_lg/2+3, -1]) myRoundedBox(20, 20, h2, e);
        
        for(i=[-1,1]){
            for(j=[-1,1]){
                translate([i*h_l/2, j*h_lg/2, -1]) cylinder(r=r_vis, 30+2);
            }
        }
        translate([21, +h_lg/2, -1]) cylinder(r=r_vis, 30+2);
    }
    
    if(vslot){
        for(i=[-1,1]){
            color("red")translate([i*h_l/2, -h_lg/2, 11+e])     vslot2020();
        }
        translate([-25,h_lg/2+8,e+1]) rotate([90,0,0]) charriot_bis();
    }
}

module nema17_y(motor = false){
    e = 2;
    difference(){
        union(){
            translate([-30,  -20, 0]) cube([60,60,e]);
            translate([-30,  0, 0]) cube([60,e,20]);
            for(i=[1]){
                translate([i*12,  1, 0]) rotate([0,0,-90])myRenfort(20,30,e);
            }
    
        }
        for(i=[-1,1]){
            translate([i*20,  -10, -1]) cylinder(r=r_vis, 10);;
        }
        for(i=[-1,1]){
            translate([i*20,  3, 10+e]) rotate([90,0,0]) cylinder(r=r_vis, 10);
        }
        translate([0,  13, -22]) rotate([0,0,45])nema17();
        
    }
    if(motor){
        color("red") translate([0,  13, -22]) rotate([0,0,45])nema17();
    }
}

module roulement_y(motor = false){
    e = 3;
    l=40;
    lg = 21;
    difference(){
        union(){
            translate([-18,  -lg/2-e, 0]) cube([l,e,20]);
            translate([-18,  lg/2, 0]) cube([l,e,20]);
            translate([0,  -lg/2, 0]) cube([e,lg,20]);
        }
        translate([-10,  0, 10]) rotate([90,0,0]) cylinder(r=r_vis, 100, center = true);
        translate([13,  0, 10]) rotate([90,0,0]) cylinder(r=1.8, 100, center = true);
        
    }
    if(motor){
        color("red") translate([0,  13, -22]) rotate([0,0,45])nema17();
    }
}


module stop_y(motor = false){
    e = 3;
    l=42;
    lg = 21;
    difference(){
        union(){
            translate([-18,  -lg/2-e, 0]) cube([l,e,20]);
            translate([-18,  lg/2, 0]) cube([lg,e,20]);
            translate([0,  -lg/2, 0]) cube([e,lg,20]);
        }
        translate([-10,  0, 10]) rotate([90,0,0]) cylinder(r=r_vis, 100, center = true);
        translate([8,  0, 15]) rotate([90,0,0]) cylinder(r=1.8, 100, center = true);
        translate([18,  0, 15]) rotate([90,0,0]) cylinder(r=1.8, 100, center = true);
        translate([8,  0, 5]) rotate([90,0,0]) cylinder(r=1.8, 100, center = true);
        translate([18,  0, 5]) rotate([90,0,0]) cylinder(r=1.8, 100, center = true);
        
    }
    if(motor){
        color("red") translate([0,  13, -22]) rotate([0,0,45])nema17();
    }
}

mode =3;
if(mode==1){
    roulement_y();
} else if (mode ==2){
    stop_y(false);
}

//translate([-100,0,0])charriot_bis();