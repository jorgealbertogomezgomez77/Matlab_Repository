clear, clc;

%Variavles declaration
num_of_points = 1000;
z_max = 15;
z_min = 4;
x_min = 0;
x_max = 100;
y_min = 0;
y_max = 100;

x = (x_max - x_min) * rand(num_of_points, 1);
y = (y_max - y_min) * rand(num_of_points, 1);
z = (z_max - z_min) * rand(num_of_points, 1);

d = [x; y; z];

% Save txt file
text_file = fopen('x_y_z_to_surfer.txt', 'w');

fprintf(text_file, '%.3f\t %.3f\t %.3f\n', d);

fclose(text_file);

% plot3(x, y, z)
surface(x, y, z)

