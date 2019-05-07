function area_under_curve(x1, x2, header)

x = linspace(x1, x2, 501);
y = f1(x);

figure(1)
clf
hold on

h = fill([x, x(end), x(1)], [y, 0.0, 0.0], [0.0, 1.0, 0.0]);

set(h, 'EdgeColor', 'none', 'Facealpha', 0.3);

plot([x1, x2], [0.0, 0.0], 'k-', 'LineWidth', 3);

plot(x, y, 'r-', 'LineWidth', 3);

grid on
if(nargin < 3)
    header = 'Area under the curve Y = F(X)'
end
title(header, 'FontSize', 24);
xlabel( '<--- X --->');
ylabel( '<--- Y = F(X) --->');

hold off

filename = 'area_under_curvef1.png';
print( '-dpng', filename);
fprintf(1, '\n');
fprintf(1, 'Plot saved in file "%s"\n', filename);
return
end