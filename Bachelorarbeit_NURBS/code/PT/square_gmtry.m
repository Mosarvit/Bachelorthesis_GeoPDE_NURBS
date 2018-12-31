%Creates a square as a NURBS surface

pkg load geopdes;
pkg load nurbs;

clear all;
close all;
clc;
graphics_toolkit("gnuplot");

geo = nrb4surf ([0.0 0.0 0.0], [1.0 0.0 0.0], [0.0 1.0 0.0], [1.0 1.0 0.0]);
save('square_gmtry.mat','geo');
nrbplot(geo, [10, 10]);
axis equal
xlabel ('x', 'FontSize', 20)
ylabel ('y', 'FontSize', 20)
zlabel ('z', 'FontSize', 20)