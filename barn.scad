use <helpers.scad>
// module BarnPoly() {
//     polygon(points = [[0, 0], [0, 10], [10, 10], [10, 0]]);
// }

module BarnWall() {
    PerimeterRight = 240;
    PerimeterTop = 96;
    Perimeter = [
        [0, 0],
        [0, PerimeterTop],
        [PerimeterRight, PerimeterTop],
        [PerimeterRight, 0]
    ];
    
    WindowLeft = 76.5;
    WindowRight = WindowLeft + 20.5;
    WindowBottom = 43.5;
    WindowTop = WindowBottom + 37.5;
    Window = [
        [WindowLeft, WindowBottom],
        [WindowLeft, WindowTop],
        [WindowRight, WindowTop],
        [WindowRight, WindowBottom]
    ];

    DoorLeft = 114;
    DoorRight = DoorLeft + 29;
    DoorBottom = 16;
    DoorTop = DoorBottom + 76;
    Door = [
        [DoorLeft, DoorBottom],
        [DoorLeft, DoorTop],
        [DoorRight, DoorTop],
        [DoorRight, DoorBottom]
    ];

    Points = concat(Perimeter, Window, Door);
    Paths = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]];
    // Perimeter = [[0, 0], [0, WallTop], [WallRight, WallTop], [WallRight, 0]];
    translate([0, 24]) {
        DoublePoly() {
            polygon(Points, Paths);
        }
    }
}
BarnWall();
