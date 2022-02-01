//use <MCAD/shapes.scad>;


module myRoundedBox(l, lg, h, r) {
    linear_extrude(height = h)
            polygon(points=[[l/2-r,lg/2],[l/2,lg/2-r]
                ,[l/2,-lg/2+r],[l/2-r,-lg/2]
                ,[-l/2+r,-lg/2],[-l/2,-lg/2+r]
                ,[-l/2,lg/2-r],[-l/2+r,lg/2]]);
}

module myRoundedBox2(l, lg, h, r) {
    translate([-l/2,-lg/2,0]) cube([l, lg, h]);
}

module myRoundedBox3(l, lg, h, r) {
    //translate([0,0,h/2])roundedBox(l, lg, h, r);
}

module myRenfort(l, lg, e){
    translate([0,e/2,0]) rotate(a=[90,-90,0])
    linear_extrude(height = e)
            polygon(points=[[0,0],[l,0],[0,lg]]);
}

//myRoundedBox2(100,200, 10, 5);