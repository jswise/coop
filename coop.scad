use <barn.scad>
use <frame.scad>
use <shell.scad>
include <dimensions.scad>

module Ground() {
    GroundLeft = -100;
    GroundFront = -200;
    GroundRight = 200;
    GroundBack = 100;
    GroundPoints = [
        [GroundLeft, GroundFront],
        [GroundLeft, GroundBack],
        [GroundRight, GroundBack],
        [GroundRight, GroundFront]
    ];
    translate([-100, -200]) {
        color("PaleGreen") {
            square([340, 300]);
        }
    }
}
Ground();
// color("Green") {
//     polygon(GroundPoints);
// }
BarnAll();
translate([CoopLeft, 0, 0]) {
    CoopFrame();
}
translate([CoopLeft, 0, CoopElevation]) {
    CoopShell();
}