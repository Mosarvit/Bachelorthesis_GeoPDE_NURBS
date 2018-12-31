%% REVOLUTION

crv = nrbline ([1 0], [2 0]);
srf = nrbrevolve (crv, [0 0 0], [0 0 1], 2*pi);
nrbctrlplot (srf);
view (2)
% print -dpng revolve_circle.png

vol = nrbrevolve (srf, [3 0 0], [0 -1 0], pi/2);
nrbctrlplot(vol);
view([1 1 1])
% print -dpng revolve_tube.png

vol = nrbextrude (srf, [0 0 4]);
nrbctrlplot(vol);
% print -dpng extrude_tube.png