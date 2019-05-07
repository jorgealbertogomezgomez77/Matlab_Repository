function add_model_mfcc(modelName, className, classPath,listOfStatistics, stWin, stStep, mtWin, mtStep)
if ~exist(classPath,'dir')
    error('path not present')
else
    classPath=[classPath filesep];
end

fp=fopen(modelName,'r');
if fp>0
    load(modelName);
end
%feature extraction
D=dir([classPath '*.wav']);
F=[];

for(i=1:length(D))
    curFileName=[classPath D(i).name];
    FileNamesTemp{i}=curFileName;
    [midFeatures]=fetureExtract(curFileName,stWin,stStep,mtWin,mtStep,listOfStatistics);
    %F=[F midFeatures]
    longFeatures = mean(midFeatures,2); 
    F=[F longFeatures];
    %long = mean(longFeat,2);
%     F1 = [F1 longFeat];
%     F2 = [F2 stFeature];
end

Statistics = listOfStatistics;
fp = fopen(modelName, 'r');
 if fp<0 % model does not exist --> generate     
    ClassNames{1} = className;
    Features{1} = F;  
    
    FileNames{1} = FileNamesTemp;
    save(modelName, 'ClassNames', 'Features', ...
        'Statistics', 'stWin', 'stStep', 'mtWin', 'mtStep', 'FileNames');
else
    load(modelName);
    ClassNames{end+1} = className;
    Features{end+1} = F;
    
    FileNames{end+1} = FileNamesTemp;
    save(modelName, 'ClassNames', 'Features',  ...
        'Statistics', 'stWin', 'stStep', 'mtWin', 'mtStep', 'FileNames');
 end
end