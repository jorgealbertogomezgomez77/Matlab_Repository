    function [u,t,h,totalt]=euler(F,t0,T,u0,N)
    %funcion que aproxima con un metodo de Euler explicito la solucion de la edo
    %u’=F(u,t) hasta tiempo T con N nodos temporales. u0 es el dato inicial.
    %%Rafael Granero Belinchon
    tic
    h=(T-t0)/N;
    t=[t0:h:T];
    u=zeros(N+1,1);
    u(1)=u0;
    for i=2:N+1
    u(i)=u(i-1)+feval(F,u(i-1),t(i-1))*h;
    end
    plot(t,u);
    totalt=toc;

    function [u,t,h,totalt]=rungekutta4(F,t0,T,u0,N)
    %Funcion que aproxima con una RK4 la solucion de
    %y’=F(y) y(t0)=u0 y tiempo final T. N da el numero
    %de nodos temporales.
    %%Rafael Granero Belinchon
    tic
    h=(T-t0)/N;
    t=[t0:h:T];
    u=zeros(N+1,1);
    u(1)=u0;
    for i=2:N+1
    s1=feval(F,u(i-1),t(i-1));
    s2=feval(F,u(i-1)+h*0.5*s1,t(i-1)+h*0.5);
    s3=feval(F,u(i-1)+h*0.5*s2,t(i-1)+h*0.5);
    s4=feval(F,u(i-1)+h*s3,t(i-1)+h);
    u(i)=u(i-1)+(s1+2*s2+2*s3+s4)*h/6;
    end
    plot(t,u);
    totalt=toc;

    function [u,t,totalt]=rungepasovariable(F,t0,T,u0,N,tol)
    %funcion que aproxima con un metodo de paso variable
    %la solucion de la ecuacion diferencial y’=F(y) en [t0,T]
    %con u0 como dato inicial una cantidad N de pasos temporales y una tolerancia tol.
    %%Rafael Granero Belinchon
    tic
    t=[t0];
    dt=(T-t0)/N;
    u=[u0];
    u1=u;
    u2=u;
    while t(end)<=T
    fev=feval(F,u(end),t(end));
    s=u(end)+0.5*dt*fev;
    u2(end+1)=u(end)+feval(F,s,t(end)+0.5*dt)*dt;
    u1(end+1)=u(end)+fev*dt;
    err=abs(u2(end)-u1(end));
    h=0.9*dt*sqrt(tol/err);
    u(end+1)=u(end)+feval(F,s,t(end)+0.5*h)*h;
    t(end+1)=t(end)+h;
    dt=h;
    end
    totalt=toc;