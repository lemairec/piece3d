$fs=$fs/4;
$fa=$fa/4;

e  = 6;

support_e = 50;
support_lg = 209;
support_h = 50;

l_trie = 500;
lg_trie = 100;
lg_trie2 = 100;
angle = 45;
angle2 = 3;

support_lg_bout = l_trie*sin(angle2)*2;


support_h1 = support_h + lg_trie*cos(angle);

module pan(){
    hull(){
        translate([0,0]) square([support_e, lg_trie]);
        translate([l_trie,0]) square([1, lg_trie2]);
    }
}

module toto(){
    union(){
        for(i=[0,1]){
            mirror([i,0,0])rotate([0,angle,-angle2]) rotate([90,0,90])  pan();
        }
    }
}

module support(){
    difference(){
       translate([-support_lg/2,0]) square([support_lg, l_trie]);
    }
}

module support2(){
    difference(){
        translate([-support_lg/2,0]) square([support_lg, support_h1]);
        
         hull(){
            for(i=[0,1]){
                mirror([i,0,0]) translate([0,support_h]) rotate([0,0,90-angle])square([300, e]);
            }
        }
    }
}

module support3(){
    difference(){
        translate([-support_lg/2,0]) square([support_lg, support_h1]);
        
         hull(){
            for(i=[0,1]){
                mirror([i,0,0]) translate([support_lg_bout/2,support_h]) rotate([0,0,90-angle])square([300, e]);
            }
        }
    }
}


support();

if(true){
    translate([0,support_e]) rotate([90,0,0]) support2();
    translate([0, l_trie-support_e]) rotate([90,0,0]) support3();
    translate([0,0,support_h])toto();
} else {
    translate([support_lg+1,0]) support2();
    translate([support_lg+1,200]) support3();
    
     translate([2*support_lg+2,0])  pan();
}

echo("boulon max ", support_lg_bout);
echo(support_lg_bout);