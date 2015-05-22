clear all
close all
clc

% Define the vehicle types
type_taxi = sumolib.demand.VehicleType('taxi');
type_carro = sumolib.demand.VehicleType('carro', 'color', [1 0 0],...
    'guiShape', 'passenger');
type_bus = sumolib.demand.VehicleType('bus', 'color', [0 1 0],...
    'guiShape', 'bus');


% Generate demands for some edges
flow1 = sumolib.demand.Flow('30659375', 'type', type_taxi, 'demandType',...
    'vehsPerHour', 'demand', 200);
flow2 = sumolib.demand.Flow('30659170', 'type', type_carro, 'demandType',...
    'vehsPerHour', 'demand', 200);
flow3 = sumolib.demand.Flow('33463249#0', 'type', type_bus, 'demandType',...
    'vehsPerHour', 'demand', 500);
flow4 = sumolib.demand.Flow('-609#0', 'type', type_taxi, 'demandType',...
    'vehsPerHour', 'demand', 500);


% Define turning probabilities
turns_flow1 = sumolib.demand.TurnProbability('30659375', {'-609#2'}, {1});
turns_flow2 = sumolib.demand.TurnProbability('30659170', {'33463249#3'}, {1});
turns_flow3 = sumolib.demand.TurnProbability('33463249#0', {'30659403' '33463249#1'},...
    {0.2 0.8});
turns_flow4 = sumolib.demand.TurnProbability('-609#0', {'-609#1'}, {1});

% flow1_1 = sumolib.demand.Flow('O1a',0,...
%     round(120*rand(1,30)),containers.Map({'aO4'},{1}));
% 
% flow1_2 = sumolib.demand.Flow('O1a',0,...
%     round(120*rand(1,30)),containers.Map({'aO3'},{1}));

% Create an array of demands
flows = {flow1 flow2 flow3 flow4};
turns = {turns_flow1 turns_flow2 turns_flow3 turns_flow4};

% Get the filename of the example scenario
[scenarioPath,~,~] = fileparts(which(mfilename));
scenarioPath = [scenarioPath '\inter_palmas'];
cd(scenarioPath);

% Generate demand
sumolib.demand.generateDemandByTurns('inter_palmas.net.xml',...
	flows, 50400, 54000, turns, 'inter_palmas_demand');

