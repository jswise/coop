use <barn.scad>
// module asdf() {
//     sphere(d=10);
// }
// asdf();
color("Green") {
    polygon(points = [[-100, -100], [-100, 100], [100, 100], [100, -100]]);
}
rotate([90]) {
    BarnWall();
}
