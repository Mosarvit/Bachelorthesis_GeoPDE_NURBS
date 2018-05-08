%% PLOT CUBIC NURBS CURVE

% Define Knot Vector
knts = [0 0 0 0 1/3 2/3 1 1 1 1];

% Define Control Points
coefs = [0 1 1 2 2 3;
         0 0 1 1 1 0;
         0 0 0 0 0 0];

% Define NURBS Curve
crv = nrbmak (coefs, knts);
nrbctrlplot (crv)