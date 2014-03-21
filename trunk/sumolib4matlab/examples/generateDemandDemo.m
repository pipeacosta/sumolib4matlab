clear all
close all
clc

flowProfile1 = sumolib.demand.FlowProfile('O1a',round(120*rand(1,30)),...
	containers.Map({'aO2','aO3','aO4'},{0.1,0.3,0.6}));
flowProfile2 = sumolib.demand.FlowProfile('O4a',round(120*sin(rand(1,30))),...
	containers.Map({'aO2','aO3','aO1'},{0.1,0.3,0.6}));

flowProfiles = {flowProfile1, flowProfile2};

sumolib.demand.generateDemand('D:\MATLAB\interseccion_aislada\interseccion_aislada.net.xml',...
	flowProfiles, 0, 12*3600, 'D:\MATLAB\interseccion_aislada\generateDemandDemo')

