
load timeZones.mat
%x = timeZones
for i = 1:length(timeZones);
    hold on
    plot(timeZones(i).X, timeZones(i).Y)
end
% hold on
% plot(timeZones(84).X, timeZones(84).Y)
% plot(timeZones(85).X, timeZones(85).Y)
% plot(timeZones(86).X, timeZones(86).Y)