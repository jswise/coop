module beam() {
    cube([48, 1.5, 3.5]);
}

module board(position) {
    translate([position * 8.5, 0]) {
        cube([5.5, 40, 0.75]);
    }
}

module palette() {
    board(0);
    board(2);
    board(3);
    board(5);
    translate([0, 0, 4.25]) {
        for (i = [0:5]) {
            board(i);
        }
    }
    translate([0, 0, .75]) {
        beam();
    }
    translate([0, 19.25, .75]) {
        beam();
    }
    translate([0, 38.5, .75]) {
        beam();
    }
}


palette();