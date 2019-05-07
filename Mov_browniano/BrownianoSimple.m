%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      ACTIVIDAD EN GRUPO LABORATORIO INFORMATICO
%            Matemáticas II --  Grado en Química
%                        2016-2017
%
%              Coordinación: Miguel Ángel Mirás Calvo
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Grupo: 
%           _____________________________________
%           _____________________________________
%           _____________________________________
%           _____________________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Modelo:  Simulación del  movimiento  Browniano de una partícula
%         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comienza el documento
%
%%%%%%
clc;

T = input('Introduce el tiempo (en segundos): ');    % Tiempo (en segundos)
N = 100 .* T;                                        % Número de impulsos/golpes en la trayectoria
h = sqrt(T / N);

% Posición inicial
x = 0;
y = 0;

% Bombardeo
% Las coordenadas en un instante se obtienen a partir de las del instante.
% anterior mas el bombardeo aleatorio.

for i = 1:N
x(i + 1) = x(i) + h * randn(); 
y(i + 1) = y(i) + h * randn();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gráfica de la trayectoria
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Valores maximos y minimos para fijar la ventana grafica de modo que se
%vean toda la trayectoria
xmin = min(x);
ymin = min(y);
xmax = max(x);
ymax = max(y);
ventana = (1.1) * [xmin xmax ymin ymax];

% Dibujamos la primera posicion  
plot(x(1), y(1), 'r.-');
hold on; 
axis(ventana); 
grid on;            % fijamos la ventana y pintamos la malla de referencia

% Dibujamos la posición en cada instante de tiempo, uniendo cada punto con
% el anterior por una linea roja.
for i = 2:N
plot([x(i - 1) x(i)], [y(i - 1) y(i)], 'r.-');
pause(0.01) % una pausa para de 0,01 segundos poder ver como se forma la trayectoria
end

