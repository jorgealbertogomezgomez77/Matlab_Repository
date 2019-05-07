function [raiz, iteraciones] = biseccion()
x_min = 0;
x_max = 3;
tol = 0.0001;

i = 0;
if (x_min < x_max)
    if (fun(x_min) * fun(x_max) < 0)
        x_med = x_min;
        while abs(fun(x_med)) > tol
            x_med = (x_min + x_max) / 2;
            if (fun(x_min) * fun(x_med) > 0)
                x_min = x_med;
            else
                x_max = x_med;
            end
            i = i + 1;
            display(i)
        end
    end
end

raiz = num2str(x_med,16);
iteraciones = round((log2(abs(x_max + x_min)))-log2(tol));
end