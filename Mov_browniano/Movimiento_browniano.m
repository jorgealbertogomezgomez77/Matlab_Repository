%Movimiento browniano de 500 partículas inicialmente 
%situadas en el origen de coordenadas

clear; clc; shg; clf;

Npart=8; %Designa el número de partículas
P=500    %Numero de pasos

x=zeros(1,P+1); % Coordenada x de cada paso (partiendo de x=0)
y=zeros(1,P+1); % Coordenada y de cada paso (partiendo de y=0)
%Parámetros
mt=1;
mB=10;
vt=1;
dt=1;
vx=0;
vy=0;
w=2*pi*rand;
%Desarrollo del movimiento

t0=0;

tf=30;

dt = 0.1; % s. Tiempo entre dos frames sucesivos del vídeo

tframes = t0:dt:tf;
for i=1:Npart
    for j=1:length(tframes)
       vx(i,j+1)=vx(i,j)+(mt./(mt+mB)).*(vt.*cos(w)-vx(i,j).*(1-cos(w))+...
           (vt.*sin(w)-vy(i,j)).*sin(w));
       vy(i,j+1)=vy(i,j)+(mt./(mt+mB)).*(vt.*sin(w)-vy(i,j).*(1-cos(w))-...
           (vt.*cos(w)-vx(i,j)).*sin(w));
       x(i,j+1)=x(i,j)+vx(i,j+1).*dt;
       y(i,j+1)=y(i,j)+vy(i,j+1).*dt;
plot(x(i,j),y(i,j),'.','MarkerSize',8)
hold on;
F(j) = getframe(gcf);


axis square

    end
end

