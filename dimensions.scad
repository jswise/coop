CoopElevation = 34.5;
FloorHeight = CoopElevation + 12;
Overhang = 6;
CoopLeft = Overhang;

CoopWidth = 96;
CoopDepth = 86;
CoopFrontHeight = 61.5;
CoopBackHeight = 80;
DeltaHeight = CoopBackHeight - CoopFrontHeight;
RoofAngle = atan(DeltaHeight / CoopDepth);
echo(RoofAngle=RoofAngle);
RoofH = sqrt(pow(DeltaHeight, 2) + pow(CoopDepth, 2)) + Overhang;
echo(RoofH=RoofH);

PostDepth = 24;

NestingBoxCount = 3;
NestingBoxHeight = FloorHeight + 30;
NestingBoxWidth = 14;
NestingBoxDepth = 12;
NestingBoxBackHeight = 12;
NestingBoxFrontHeight = 16;
DeltaNestingBoxHeight = NestingBoxFrontHeight - NestingBoxBackHeight;
NestingBoxRoofAngle = atan(DeltaNestingBoxHeight / NestingBoxDepth);
NestingBoxRoofH = sqrt(pow(DeltaNestingBoxHeight, 2) + pow(NestingBoxDepth, 2));
echo(NestingBoxRoofH=NestingBoxRoofH);
NestingBoxFloorAngle = 5;
