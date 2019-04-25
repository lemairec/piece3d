use <libs/threads.scad>
$fs=$fs/4;
$fa=$fa/4;

d=103;//100 //102
h=32;//40 //35
e_h = 1;
e_r = 1.3;
// Examples.
//
// Standard M8 x 1.
//metric_thread (diameter=8, pitch=1, length=20, thread_size=2);
//metric_thread_turns(d,1,32,false, 1,5,false);
// Completely non-standard: long pitch, same thread size.
// English: 1/4 x 20.
//english_thread (diameter=1/4, threads_per_inch=20, length=1);

// Thread for mounting on Rohloff hub.
//difference () {
//   cylinder (r=20, h=10, $fn=100);
//
//   metric_thread (diameter=34, pitch=1, length=10, internal=true, n_starts=6);
//}

module bouchon(){
    difference(){
        cylinder(r=d/2+e_r,h+e_h);
        translate([0,0,e_h+0.1])metric_thread (diameter=d, pitch=8, length=h, thread_size=7, groove=true);
    }
}

bouchon();