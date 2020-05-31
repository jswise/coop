use <elements.scad>
include <dimensions.scad>

module FrontToBack(x) {
    translate([x, 0, FloorHeight]) {
        cube([1.5, CoopDepth, 5.5]);
    }
    translate([x, 0, CoopFrontHeight + CoopElevation]) {
        rotate([RoofAngle, 0, 0]) {
            translate([0, 0, -3.5]) {
                cube([1.5, RoofH, 3.5]);
            }
        }
    }
}

module CoopFrameSegment(right=false) {
    PostHeight = CoopElevation + CoopFrontHeight;
    Post(PostHeight);

    if (right) {
        FrontToBack(3.5);
    } else {
        FrontToBack(-1.5);
    }
}

module CoopFrame() {
    // Front left
    translate([1.5, -CoopDepth]) {
        CoopFrameSegment();
    }
    translate([(CoopWidth / 2) - 1.75, -CoopDepth]) {
        CoopFrameSegment();
    }
    translate([CoopWidth - 5, -CoopDepth]) {
        CoopFrameSegment(true);
    }
}