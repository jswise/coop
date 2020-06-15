use <elements.scad>
use <palette.scad>
include <dimensions.scad>

module Plates() {
    RafterWidthH = 3.5 / cos(RoofAngle);
    RoofPlateOffset = RafterWidthH + 3.5 + (1.5 * tan(RoofAngle));
    TopPlateHeight = CoopBackHeight + CoopElevation - RoofPlateOffset;
    echo(TopPlateHeight=TopPlateHeight);
    translate([0, CoopDepth-1.5, TopPlateHeight]) {
        cube([CoopWidth, 1.5, 3.5]);
    }
    BottomPlateHeight = FloorHeight - 10.5;
    translate([0, CoopDepth-1.5, BottomPlateHeight]) {
        cube([CoopWidth, 1.5, 3.5]);
    }
    TopOuterPlateHeight = CoopElevation + CoopFrontHeight - RoofPlateOffset;
    translate([0, -1.5, TopOuterPlateHeight]) {
        cube([CoopWidth, 1.5, 3.5]);
    }
    TopInnerPlateHeight = TopOuterPlateHeight + (5 * tan(RoofAngle));
    translate([0, 3.5, TopInnerPlateHeight]) {
        cube([CoopWidth, 1.5, 3.5]);
    }
}

module FrontToBack(x) {
    translate([x, 0, FloorHeight - 10.5]) {
        cube([1.5, CoopDepth-1.5, 5.5]);
    }
    translate([x, 0, CoopFrontHeight + CoopElevation]) {
        rotate([RoofAngle, 0, 0]) {
            translate([0, -Overhang, -3.5]) {
                cube([1.5, RoofH, 3.5]);
            }
        }
    }
}

module FrameSegment(side) {
    PostHeight = CoopElevation + CoopFrontHeight;
    Post(PostHeight);

    if ((side=="right") || (side=="both")) {
        FrontToBack(3.5);
    }
    if ((side=="left") || (side=="both")) {
        FrontToBack(-1.5);
    }
}

module FrameFloor() {
    translate([0, 3.5, FloorHeight - 5]) {
        palette();
        translate([48, 0]) {
            palette();
        }
        translate([0, 40]) {
            palette();
            translate([48, 0]) {
                palette();
            }
        }
    }
    // translate([0, -1.5, FloorHeight - 3.5]) {
    //     cube([CoopWidth, 1.5, 3.5]);
    // }
    // translate([0, 3.5, FloorHeight - 3.5]) {
    //     for (i = [0:CoopDepth / 16]) {
    //         translate([0, i * 16]) {
    //             cube([CoopWidth, 1.5, 3.5]);
    //         }
    //     }
    // }
    // translate([0, CoopDepth-1.5, FloorHeight - 3.5]) {
    //     cube([CoopWidth, 1.5, 3.5]);
    // }
}

module CoopFrame() {
    Plates();

    // Front left
    translate([1.5, 0]) {
        FrameSegment("left");
    }
    translate([(CoopWidth / 2) - 1.75, 0]) {
        FrameSegment("both");
    }
    translate([CoopWidth - 5, 0]) {
        FrameSegment("right");
    }
    FrameFloor();
}