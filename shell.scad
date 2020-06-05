use <helpers.scad>
include <dimensions.scad>

module CoopShellSurface() {
    // DoublePoly() {
    color("PaleGoldenrod", 0.5) {
        children();
    }
}

module CoopShell() {
    // Floor
    translate([0, 0, 12]) {
        CoopShellSurface() {
            polygon([
                [0, 3.5],
                [0, CoopDepth],
                [CoopWidth, CoopDepth],
                [CoopWidth, 3.5]
            ]);
        }
    }

    // Left
    translate([0, CoopDepth]) {
        rotate([90, 0, -90]) {
            CoopShellSurface() {
                polygon([
                    [-1.5, 0],
                    [-1.5, CoopBackHeight],
                    [CoopDepth, CoopFrontHeight],
                    [CoopDepth, 0]
                ]);
            }
        }
    }

    // // Front
    // translate([0, -1.5]) {
    //     rotate([90]) {
    //         CoopShellSurface() {
    //             polygon([
    //                 [0, 0],
    //                 [0, CoopFrontHeight],
    //                 [CoopWidth, CoopFrontHeight],
    //                 [CoopWidth, 0]
    //             ]);
    //         }
    //     }
    // }

    // Right
    translate([CoopWidth, 0, 0]) {
        rotate([90, 0, 90]) {
            CoopShellSurface() {
                polygon([
                    [-1.5, 0],
                    [-1.5, CoopFrontHeight],
                    [CoopDepth, CoopBackHeight],
                    [CoopDepth, 0]
                ]);
            }
        }
    }

    // Roof
    translate([0, 0, CoopFrontHeight]) {
        rotate([RoofAngle, 0, 0]) {
            RoofWidth = CoopWidth + (2 * Overhang);
            echo(RoofWidth=RoofWidth);
            RoofDepth = RoofH + Overhang;
            echo(RoofDepth=RoofDepth);
            translate([-Overhang, -Overhang]) {
                CoopShellSurface() {
                    polygon([
                        [0, 0],
                        [0, RoofDepth],
                        [RoofWidth, RoofDepth],
                        [RoofWidth, 0]
                    ]);
                }
            }
        }
    }
}
