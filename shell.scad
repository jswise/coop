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
    translate([0, -CoopDepth]) {
        CoopShellSurface() {
            polygon([
                [0, 0],
                [0, CoopDepth],
                [CoopWidth, CoopDepth],
                [CoopWidth, 0]
            ]);
        }
    }

    // Left
    rotate([90, 0, -90]) {
        CoopShellSurface() {
            polygon([
                [0, 0],
                [0, CoopBackHeight],
                [CoopDepth, CoopFrontHeight],
                [CoopDepth, 0]
            ]);
        }
    }

    // Front
    translate([0, -CoopDepth]) {
        rotate([90]) {
            CoopShellSurface() {
                polygon([
                    [0, 0],
                    [0, CoopFrontHeight],
                    [CoopWidth, CoopFrontHeight],
                    [CoopWidth, 0]
                ]);
            }
        }
    }

    // Right
    translate([CoopWidth, -CoopDepth, 0]) {
        rotate([90, 0, 90]) {
            CoopShellSurface() {
                polygon([
                    [0, 0],
                    [0, CoopFrontHeight],
                    [CoopDepth, CoopBackHeight],
                    [CoopDepth, 0]
                ]);
            }
        }
    }

    // Roof
    translate([0, -CoopDepth, CoopFrontHeight]) {
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
