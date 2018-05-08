%% TRANSFORMATIONS

crv = nrbline ([1 0], [2 0]);
srf = nrbrevolve (crv, [0 0 0], [0 0 1], 2*pi);

srf = nrbtform (srf, vecscale ([1 2 1]));
srf = nrbtform (srf, vecrot (pi/4, [0 0 1]));

nrbctrlplot (srf);
view (2)
print -dpng rotated_ellipse.png