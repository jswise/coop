use <helpers.scad>
// module BarnPoly() {
//     polygon(points = [[0, 0], [0, 10], [10, 10], [10, 0]]);
// }

PerimeterRight = 240;
PerimeterTop = 96;
PerimeterBottom = 24;

WindowLeft = 76.5;
WindowRight = WindowLeft + 20.5;
WindowBottom = 43.5;
WindowTop = WindowBottom + 37.5;

DoorLeft = 114;
DoorRight = DoorLeft + 29;
DoorWidth = DoorRight - DoorLeft;
DoorBottom = 16;
DoorTop = DoorBottom + 76;

module BarnFront() {
    Perimeter = [
        [0, 0],
        [0, PerimeterTop],
        [PerimeterRight, PerimeterTop],
        [PerimeterRight, 0]
    ];
    
    Window = [
        [WindowLeft, WindowBottom],
        [WindowLeft, WindowTop],
        [WindowRight, WindowTop],
        [WindowRight, WindowBottom]
    ];

    Door = [
        [DoorLeft, DoorBottom],
        [DoorLeft, DoorTop],
        [DoorRight, DoorTop],
        [DoorRight, DoorBottom]
    ];

    Points = concat(Perimeter, Window, Door);
    Paths = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]];
    DoublePoly() {
        polygon(Points, Paths);
    }
}

module BarnLeft() {
    rotate([0, -90, 0]) {
        DoublePoly() {
            polygon([
                [0, 10],
                [-20, 10],
                [-20, 96],
                [0, 96]
            ]);
        }
    }
}

module BarnWall() {
    translate([0, PerimeterBottom]) {
        BarnFront();
        BarnLeft();
    }
}

module Steps(StepCount) {
    translate([0, -8, -8]) {
        square([DoorWidth, 8]);
        StepCount = StepCount - 1;
        if (StepCount > 0) Steps(StepCount);
    }
}

module Stoop() {
    StoopLength = 48;
    StoopTop = PerimeterBottom + DoorBottom;
    
    translate([DoorLeft, StoopTop, StoopLength]) {
        rotate([-90]) {
            square([DoorWidth, StoopLength]);
            Steps(4);
        }
    }
}

module BarnAll() {
    BarnWall();
    Stoop();
}

BarnAll();
