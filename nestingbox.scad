use <helpers.scad>
include <dimensions.scad>

module NestingBoxUnit() {
    // Floor
    square([NestingBoxWidth, NestingBoxDepth]);

    // Left
    translate([0, NestingBoxDepth, 0]) {
        rotate([90, 0, -90]) {
            polygon([
                [0, 0],
                [0, NestingBoxBackHeight],
                [NestingBoxDepth, NestingBoxFrontHeight],
                [NestingBoxDepth, 0]
            ]);
        }
    }

    // Front
    rotate([90]) {
        square([NestingBoxWidth, 2]);
    }

    // Right
    translate([NestingBoxWidth, 0, 0]) {
        rotate([90, 0, 90]) {
            polygon([
                [0, 0],
                [0, NestingBoxFrontHeight],
                [NestingBoxDepth, NestingBoxBackHeight],
                [NestingBoxDepth, 0]
            ]);
        }
    }

    // Back
    translate([NestingBoxWidth, NestingBoxDepth, 0]) {
        rotate([90, 0, 180]) {
            square([NestingBoxWidth, NestingBoxBackHeight]);
        }
    }

    // Roof
    translate([0, 0, NestingBoxFrontHeight]) {
        rotate([-NestingBoxRoofAngle, 0, 0]) {
            polygon([
                [0, 0],
                [0, NestingBoxRoofH],
                [NestingBoxWidth, NestingBoxRoofH],
                [NestingBoxWidth, 0]
            ]);
        }
    }
}

module NestingBox() {
    for (i = [1:NestingBoxCount]) {
        translate([NestingBoxWidth * i, 0, 0]) {
            NestingBoxUnit();
        }
    }
}

NestingBox();
