% Rutina para simular la trayectoria de una partícula browniana.
% Por Jorge Alberto Gomez Gomez.
clear                                           % Limpiamos memoria.
close all
clc
par = 5;                                        % Número de particulas.
% Soporta hasta 21 particulas para diferenciar el color de cada una (lista
% de colores "C").
% Espacio para los valores finales de posicion de las partículas.
X = zeros(par, 1000);
Y = zeros(par, 1000);
Z = zeros(par, 1000);
for n = 1: par                                   % Número de particulas en cada interación.
x = zeros(1, 1000);                             % Vector de posicion de la particula.
y = zeros(1, 1000);
z = zeros(1, 1000);
% Se define una dirección en 3D aleatoria.
phi = 2 * pi * rand(1, 1000);                   % Crea un ángulo aleatorio para la particula.
theta = 2 * pi * rand(1, 1000) - pi;            % Se crea el otro ángulo.
% Bastan con dos angulos para cubrir el espacio.

    for i = 1: 999                               % Se define la interacción de la partícula.
    x(i + 1) = x(i) + cos(phi(i)) .* sin(theta(i));
    y(i + 1) = y(i) + sin(phi(i)) .* sin(theta(i));
    z(i + 1) = z(i) + cos(theta(i));
    end
% Se guarda la trayectoria instantanea de cada partícul.
X(n, :) = x;
Y(n, :) = y;
Z(n, :) = z;
end

% Vector para cambiar de color en cada trayectoria.
C = ['r' 'g' 'b' 'w' 'y' 'm' 'c' 'r' 'g' 'b' 'w' 'y' 'm' 'c' 'r' 'g' 'b' 'w' 'y' 'm' 'c'];

% Gráfica de la trayectoria de las partículas.
hold on
for n = 1: par
plot3(X(n, :), Y(n, :), Z(n, :), C(n));
end
view(3);
axis tight                                         % Ajustes en la visualización de la ventana
box on
hold off