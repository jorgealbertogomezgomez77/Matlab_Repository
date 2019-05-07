    function [img,img2,u,t,cnt]=imagessor(tol,itmax,image)
    %this program use the sor method for solve the poisson equation in a silhouette
    %tol is the tolerance
    %itmax is the maximum number of iterations
    %image is an png image.
    %Rafael Granero Belinchon

    tic
    img=imread(image);
    figure;imagesc(img);
    input(‘Press any key’)
    img=double(img);
    [H,W]=size(img);
    w= 2 / ( 1 + sin(pi/(H+1)) );%our overrelaxation parameter
    for i=1:H
    for j=1:W
    img2(i,j)=abs(img(i,j)-255); %change white for black and viceversa
    end
    end
    img2;
    figure; imagesc(img2);
    input(‘Press any key’)
    clear i,j;
    %now we start with the algorithm. Like maybe it will be difficult put the geometry of the silhouette
    %we use the easy bounday conditions to treat all the image, but we only solve the poisson inside the silhouette.
    %This maybe is not efficiently, but is easier.
    u=img2;
    v=u;
    err=1;
    cnt=0;
    while((err>tol)&(cnt<=itmax))
    for i=2:H-1
    for j=2:W-1
    if (img2(i,j)==0)

    else
    v(i,j)=u(i,j)+w*(v(i-1,j) + u(i+1,j) + v(i,j-1) + u(i,j+1) +1 – 4*u(i,j))/4;
    E(i,j)=v(i,j)-u(i,j);
    end
    end
    end
    err=norm(E,inf);
    cnt=cnt+1;
    u=v;
    end
    u=flipud(u);
    figure;imagesc(u);
    mesh(u)
    t=toc;

    function [Phi,t]=phi(u,NGu)
    %This program calculate the function phi=u+NGu^2
    %NGu is the norm of the gradient of u
    %Rafael Granero Belinchon

    tic
    [H,W]=size(NGu);
    for i=1:H
    for j=1:W
    Phi(i,j)=u(i,j)+NGu(i,j)^2;
    end
    end
    t=toc;

    function [Psi,t]=psiimages(u,Gux,Guy,NGu)
    %This program calculate the function psi=-div(gradient(u)/norm(gradient(u))
    %NGu is the norm of the gradient of u
    %Gux is the first component of the gradient,
    %Guy is the second one
    %Rafael Granero Belinchon

    tic
    [H,W]=size(NGu);
    for i=2:H
    for j=2:W
    Psix(i,j)=((Gux(i,j)-Gux(i-1,j))*NGu(i,j)-Gux(i,j)*(NGu(i,j)-NGu(i-1,j)))/NGu(i,j)^2;
    Psiy(i,j)=((Guy(i,j)-Guy(i,j-1))*NGu(i,j)-Guy(i,j)*(NGu(i,j)-NGu(i,j-1)))/NGu(i,j)^2;
    Psi(i,j)=-Psix(i,j)-Psiy(i,j);
    end
    end
    t=toc;

    function [Gux,Guy,NGu,t]=gradient(u)
    %This program calculate the gradient and its norm
    %Gux is the first component of the gradient,
    %Guy is the second one
    %NGu is the norm of the gradient
    %Rafael Granero Belinchon

    tic
    [H,W]=size(u);
    for i=2:H
    for j=2:W
    Gux(i,j)=u(i,j)-u(i-1,j);
    Guy(i,j)=u(i,j)-u(i,j-1);
    NGu(i,j)=(Gux(i,j)^2+Guy(i,j)^2)^0.5;
    end
    end
    t=toc;