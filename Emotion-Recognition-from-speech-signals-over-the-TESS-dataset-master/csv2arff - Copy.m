function csv2arff(csv_file, arff_name)
%
% Convert .csv to .arff 
% By: Wei Jiang
% Date: 02/19/2013
%                  
%  __________________________________________
% |Example:                                  |
% |cd('/Users/Wei/Desktop/Temporarys');      |
% |csv_file = 'train.csv';                   |
% |arff_name = 'train';                      |
% |csv2arff(csv_file,arff_name)              |

% csv file input
csv = load(csv_file);
% row - instances
% column - features
% column(end) - label

[nrow,ncol] = size(csv);
class = unique(csv(:,end));
n_class = length(class);

arf = '.arff';
filename = [arff_name,arf];
FID = fopen(filename,'w');


csv_id = strread(csv_file,'%s', 'delimiter','/ .');
arff_head = char(csv_id(end-1));


fprintf(FID,'@relation %s \n\n',arff_head);

for i = 1:ncol-1
    fprintf(FID,'@attribute feature_%d numeric\n',i);
end

% class line
class_id = [];
for k = 1:n_class-1
    class_id = [class_id sprintf('%d,',class(k))];
end  
class_id = [class_id num2str(class(end))];
    
fprintf(FID,'@attribute class {%s} \n@data \n',class_id);

% data block
for nr = 1:nrow
    for nc = 1:ncol-1
        data_block{nr,nc} = [sprintf('%d,',csv(nr,nc))];
        data_block{nr,nc+1} = [sprintf('%d',csv(nr,ncol))];
    end
end

% wirte data block
for nr = 1:nrow
    for nc = 1:ncol
        fprintf(FID,'%s',data_block{nr,nc});
    end
    fprintf(FID,'\n');
end

fclose(FID);
end

