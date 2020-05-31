use <barn.scad>
// module asdf() {
//     sphere(d=10);
// }
// asdf();

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
rotate([90]) {
    BarnAll();
}
