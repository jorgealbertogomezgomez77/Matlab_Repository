%Movimiento browniano de 500 partículas inicialmente
%situadas en el origen de coordenadas
clear; clc; shg; clf;
Npart=500; %Designa el número de partículas
P=800;     %Numero de pasos
% % Definicion del tamaño de la caja
% alto =10;
% ancho=20;
x=zeros(Npart,P+1);  % Coordenada x de cada paso (partiendo de x=0)
y=zeros(Npart,P+1);  % Coordenada y de cada paso (partiendo de y=0)
vx=zeros(Npart,P+1); % Coordenada vx de cada paso (partiendo de x=0)
vy=zeros(Npart,P+1); % Coordenada vy de cada paso (partiendo de y=0)
% % Distribucion uniforme (aleatoria) en la caja
% x(:,1)=ancho*rand(Npart,1)-ancho/2; % Coordenada x de cada paso (uniforme)
% y(:,1)=alto*rand(Npart,1)-alto/2;  % Coordenada y de cada paso (uniforme)
%Parámetros
mt=1;
mB=10;
vt=1;
%Desarrollo del movimiento
dt = 1; % s. Tiempo entre dos frames sucesivos del vídeo
tframes = 0:dt:(dt*P);
F(P+1) = struct('cdata',[],'colormap',[]);
for i=1:Npart
    for j=1:length(tframes)
        w=2*pi*rand;
        vx(i,j+1)=vx(i,j)+(mt./(mt+mB)).*((vt.*cos(w)-vx(i,j)).*(1-cos(w))+ (vt.*sin(w)-vy(i,j)).*sin(w));
        vy(i,j+1)=vy(i,j)+(mt./(mt+mB)).*((vt.*sin(w)-vy(i,j)).*(1-cos(w))- (vt.*cos(w)-vx(i,j)).*sin(w));
        x(i,j+1)=x(i,j)+vx(i,j+1).*dt;
        y(i,j+1)=y(i,j)+vy(i,j+1).*dt;
%         %condicion de rebote en las paredes        
%         if abs(x(i,j+1))>ancho/2
%             vx(i,j+1)=-vx(i,j+1);
%             x(i,j+1)=x(i,j)+vx(i,j+1).*dt;
%         end
%         if abs(y(i,j+1))>alto/2
%             vy(i,j+1)=-vy(i,j+1);
%             y(i,j+1)=y(i,j)+vy(i,j+1).*dt;
%         end
    end
end
% muestra los datos calculados y obtiene los fotogramas
for j=1:length(tframes)
    plot(x(:,j),y(:,j),'.r','MarkerSize',8)
    title(['tiempo ' num2str(j) ' de ' num2str(length(tframes))])
    xlim([-15 15])
    ylim([-15 15])
    drawnow
    F(j)=getframe(gca);
end
% Reproducir pelicula
% movie(F)