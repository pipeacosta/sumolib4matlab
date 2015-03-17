clear all
close all
clc

flowProfile1_0 = sumolib.demand.FlowProfile('O1a',0,round(120*rand(1,30)),...
	containers.Map({'aO2'},{1}));
flowProfile1_1 = sumolib.demand.FlowProfile('O1a',1,round(120*rand(1,30)),...
	containers.Map({'aO4'},{1}));
flowProfile1_2 = sumolib.demand.FlowProfile('O1a',2,round(120*rand(1,30)),...
	containers.Map({'aO3'},{1}));

flowProfiles = {flowProfile1_0,flowProfile1_1,flowProfile1_2};

[scenarioPath,~,~] = fileparts(which(mfilename));
scenarioPath = [scenarioPath '\interseccion_aislada'];
cd(scenarioPath);
sumolib.demand.generateDemand('interseccion_aislada.net.xml',...
	flowProfiles, 0, 12*3600, 'generateDemandDemo');

