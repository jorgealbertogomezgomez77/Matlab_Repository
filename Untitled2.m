
clear, clc;

model = createpde;
geometryFromEdges(model,@lshapeg);
mesh = generateMesh(model);
pdeplot(model)