use <barn.scad>
use <frame.scad>
use <shell.scad>
use <nestingbox.scad>
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
translate([CoopLeft, -CoopDepth, 0]) {
    CoopFrame();
}
translate([CoopLeft + CoopWidth, -4, NestingBoxHeight]) {
    rotate([0, 0, -90]) {
        NestingBox();
    }
}
translate([CoopLeft, -CoopDepth, CoopElevation]) {
    // CoopShell();
}
