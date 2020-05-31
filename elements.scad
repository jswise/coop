include <dimensions.scad>

module Post(height) {
    translate([0, 0, -PostDepth]) {
        PostLength = height + PostDepth;
        echo(PostLength=PostLength);
        cube([3.5, 3.5, PostLength]);
    }
}
