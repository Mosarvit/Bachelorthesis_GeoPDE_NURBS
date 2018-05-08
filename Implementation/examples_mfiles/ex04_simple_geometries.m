%% SIMPLE GEOMETRIC ENTITIES
close all

% Line
figure;
nrb1 = nrbline ([0 0 0], [1 1 1]);
nrbctrlplot (nrb1);
axis ([0 1 0 1 0 1])
xlabel ('x', 'FontSize', 20)
ylabel ('y', 'FontSize', 20)
zlabel ('z', 'FontSize', 20)
print -dpng line.png

% Bilinear Surface
figure;
nrb2 = nrb4surf ([0.0 0.0 0.5], [1.0 0.0 -0.5], [0.0 1.0 -0.5], [1.0 1.0 0.5]);
clf()
nrbplot(nrb2, [10, 10]);
axis equal
xlabel ('x', 'FontSize', 20)
ylabel ('y', 'FontSize', 20)
zlabel ('z', 'FontSize', 20)
print -dpng bilinear.png

% Circular Arc
figure;
crv = nrbcirc (1, [0 0], pi/6, 3/4*pi);
nrbctrlplot (crv);
xlabel ('x', 'FontSize', 20)
ylabel ('y', 'FontSize', 20)
axis ([-1 1 -1 1.5])
grid on
print -dpng circ_arc.png

% Cylinder
figure;
cyl = nrbcylind (2, 1, [0 0], 0, pi);
nrbctrlplot (cyl)
xlabel ('x', 'FontSize', 20)
ylabel ('y', 'FontSize', 20)
zlabel ('z', 'FontSize', 20)
print -dpng cylinder.png