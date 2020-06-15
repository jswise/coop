StoopLength = 51;
StoopWidth = 48;
RailingHeight = 36;
StoopPostLength = 100;

module Joists() {
    translate([0, 1.5, -3.5]) {
        cube([1.5, 48, 3.5]);
    }
    translate([16, 1.5, -3.5]) {
        cube([1.5, 48, 3.5]);
    }
    translate([32, 1.5, -3.5]) {
        cube([1.5, 48, 3.5]);
    }
    translate([StoopWidth - 1.5, 1.5, -3.5]) {
        cube([1.5, 48, 3.5]);
    }
    translate([0, 0, -5.5]) {
        cube([StoopWidth, 1.5, 5.5]);
    }
}

module Railing(PostDepth) {
    translate([0, 0, 0]) {
        translate([0, 0, -PostDepth]) {
            translate([0, 0, StoopPostLength - 3.5]) {
                cube([1.5, StoopLength - 1.5, 3.5]);
            }
        }
    }

}

module Railings(StoopTop) {
    PostDepth = 24;
    translate([1.5, -StoopLength + 1.5]) {
        translate([0, 0, -PostDepth]) {
            cube([3.5, 3.5, StoopPostLength]);
        }
        translate([-1.5, 0]) {
            Railing(PostDepth);
        }
    }
    translate([StoopWidth - 5, -StoopLength + 1.5]) {
        translate([0, 0, -PostDepth]) {
            cube([3.5, 3.5, StoopPostLength]);
        }
        translate([3.5, 0]) {
            Railing(PostDepth);
        }
    }
}

module Steps(StepCount, StoopWidth) {
    translate([0, -8, -8]) {
        square([StoopWidth, 8]);
        StepCount = StepCount - 1;
        if (StepCount > 0) Steps(StepCount, StoopWidth);
    }
}

module Stoop(StoopTop) {
    translate([0, 0, StoopTop]) {
        translate([0, -1.5, -7]) {
            cube([StoopWidth, 1.5, 5.5]);
        }
        translate([0, -StoopLength, -1.5]) {
            Joists();
            // square([StoopWidth, StoopLength]);
            Steps(4, StoopWidth);
        }
    }
    Railings(StoopTop);
}

module StoopFrame() {

}