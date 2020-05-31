CoopElevation = 24;
FloorHeight = CoopElevation + 12;
Overhang = 6;
CoopLeft = Overhang;

CoopWidth = 96;
CoopDepth = 72;
CoopFrontHeight = 60;
CoopBackHeight = 84;
DeltaHeight = CoopBackHeight - CoopFrontHeight;
RoofAngle = atan(DeltaHeight / CoopDepth);
RoofH = sqrt(pow(DeltaHeight, 2) + pow(CoopDepth, 2));

PostDepth = 24;

