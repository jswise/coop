module barn() {
    translate([20, 20, 20]) {
        rotate([0, 0, 90]) {
            color("Blue") {
                cube([1,30,50]);
            }
            translate([1, 0, 0]) {
                color("Green") {
                    cube([1,30,50]);
                }
            }
        }
    }
}
