x=zeros(1,10); %Generamos matrices de ceros para escribir sobre las mismas
y=zeros(1,10);
z=zeros(1,10);
for i=1:10 %bucle para introducir las variables en las matrices
x(i)=(i-1)/5;
y(i)=sin(pi*(i-1)/4);
z(i)=pi*(i-1)/30;
end
plot3(x,y,z,"-o")
%plot dibujamos el archivo guion indica trazado y "o" que marque los puntos
axis([-2,2,-2,2,-2,2])