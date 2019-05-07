clc;
T = input('Introduce el tiempo (en segundos): ');    % Tiempo (en segundos)
N = 100 .* T;                                        % Número de impulsos/golpes en la trayectoria
h = sqrt(T / N);

x = 0;
y = 0;
z = 0;

for i = 1: N
x(i + 1) = x(i) + h * randn(); 
y(i + 1) = y(i) + h * randn();
z(i + 1) = z(i) + h * randn();
end

xmin = min(x);
ymin = min(y);
zmin = min(z);
xmax = max(x);
ymax = max(y);
zmax = max(z);
ventana = (1.1) * [xmin xmax ymin ymax, zmin, zmax];

% Dibujamos la primera posicion  
plot3(x(1), y(1), z(1), 'r.-')
hold on; 
axis(ventana); 
grid on;            % fijamos la ventana y pintamos la malla de referencia

for i = 2:N
plot3([x(i - 1) x(i)], [y(i - 1) y(i)], [z(i - 1) z(i)], 'r.-');
pause(0.01) % una pausa para de 0,01 segundos poder ver como se forma la trayectoria
end