use <elements.scad>
include <dimensions.scad>

module FrontToBack(x) {
    translate([x, 0, FloorHeight - 9]) {
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

module FrameSegment(right=false) {
    PostHeight = CoopElevation + CoopFrontHeight;
    Post(PostHeight);

    if (right) {
        FrontToBack(3.5);
    } else {
        FrontToBack(-1.5);
    }
}

module FrameFloor() {
    translate([0, 3.5, FloorHeight - 3.5]) {
        cube([CoopWidth, 1.5, 3.5]);
    }
}

module CoopFrame() {
    // Front left
    translate([1.5, 0]) {
        FrameSegment();
    }
    translate([(CoopWidth / 2) - 1.75, 0]) {
        FrameSegment();
    }
    translate([CoopWidth - 5, 0]) {
        FrameSegment(true);
    }
    FrameFloor();
}