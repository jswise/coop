use <helpers.scad>
// module BarnPoly() {
//     polygon(points = [[0, 0], [0, 10], [10, 10], [10, 0]]);
// }

module BarnWall() {
    PerimeterRight = 120;
    PerimeterTop = 96;
    Perimeter = [
        [0, 0],
        [0, PerimeterTop],
        [PerimeterRight, PerimeterTop],
        [PerimeterRight, 0]
    ];
    
    WindowLeft = 76;
    WindowRight = 86;
    WindowBottom = 16;
    WindowTop = 92;
    Window = [
        [WindowLeft, WindowBottom],
        [WindowLeft, WindowTop],
        [WindowRight, WindowTop],
        [WindowRight, WindowBottom]
    ];

    DoorLeft = 96;
    DoorRight = 110;
    DoorBottom = 16;
    DoorTop = 92;
    Door = [
        [DoorLeft, DoorBottom],
        [DoorLeft, DoorTop],
        [DoorRight, DoorTop],
        [DoorRight, DoorBottom]
    ];

    Points = concat(Perimeter, Window, Door);
    Paths = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]];
    // Perimeter = [[0, 0], [0, WallTop], [WallRight, WallTop], [WallRight, 0]];
    DoublePoly() {

        polygon(Points, Paths);
    }
}
BarnWall();