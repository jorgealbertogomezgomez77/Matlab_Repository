% Points inside a polygon.
% Use of the function inpolygon.

clc, clear;

xv = [1 4 4 1 1 NaN 2 2 3 3 2];
yv = [1 1 4 4 1 NaN 2 3 3 2 2];

rng default
xq = rand(500, 1) * 5;
yq = rand(500, 1) * 5;

in = inpolygon(xq, yq, xv, yv);

figure
plot(xv, yv, 'LineWidth', 2)        % Polygon.
axis equal

hold on
plot(xq(in), yq(in), 'r+')          % Points inside.
plot(xq(~in), yq(~in), 'bo')        % Point outside.
hold off