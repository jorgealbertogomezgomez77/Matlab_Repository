function proof(x1, x2, header)

x = linspace(x1, x2);
y = f(x);

figure ( 1 )
% clf
hold on

plot ( [x1, x2 ], [ 0.0, 0.0 ], 'k-', 'LineWidth', 3 );
plot ( x, y, 'r-', 'LineWidth', 3 );
grid on
if ( nargin < 3 )
    header = 'Area under the curve Y = F(X)'
end
title ( header, 'Fontsize', 24 );
xlabel ( '<--- X --->' );
ylabel ( '<--- Y = F(X) --->' );
hold off
filename = 'area_under_curve.png';
print ( '-dpng', filename );
fprintf ( 1, '\n' );
fprintf ( 1, '  Plot saved in file "%s"\n', filename );
return
end