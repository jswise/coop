use <helpers.scad>
use <stoop.scad>

PerimeterRight = 240;
PerimeterTop = 96;
PerimeterBottom = 24;

WindowLeft = 76.5;
WindowRight = WindowLeft + 20.5;
WindowBottom = 43.5;
WindowTop = WindowBottom + 37.5;

DoorLeft = 114;
DoorWidth = 29;
DoorRight = DoorLeft + DoorWidth;
DoorCenter = (DoorRight + DoorLeft) / 2;
DoorBottom = 16;
DoorTop = DoorBottom + 76;
StoopTop = PerimeterBottom + DoorBottom;

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
    translate([0, PerimeterBottom, -1.5]) {
        BarnFront();
        BarnLeft();
    }
}

module BarnAll() {
    rotate([90]) {
        BarnWall();
    }
    translate([DoorLeft - 4.5, 0]) {
        Stoop(StoopTop);
    }
}

BarnAll();
