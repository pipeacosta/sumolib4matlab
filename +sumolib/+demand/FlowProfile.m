classdef FlowProfile
%FlowProfile Construct a FlowProfile representing a time-dependent vehicle demand.
%   myFlowProfile = FlowProfile(FROMEDGE,FROMLANE,PROFILE,TURNINGRATIO) Constructs a 
%   FlowProfile object. FROMEDGE is the id of the edge from which vehicles
%   are generated. FROMLANE specifies the edge's lane number, according to 
%   the convention used by SUMO. PROFILE is a vector containing the samples of the
%   time-dependent demand. Finally, TURNINGRATIO is a containers.Map object
%   that maps the name of the edges connected to FROMEDGE, to the
%   corresponding turning probability.

%   Copyright 2014 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id$

	properties
		fromEdge
        fromLane
		profile
		turningRatio
% 		beginTime = 0
% 		endTime = 24*3600
	end
	methods
		function this = FlowProfile(fromEdge, fromLane, profile, turningRatio)
			
			p = inputParser;
			p.FunctionName = 'FlowProfile';
			p.addRequired('fromEdge',@ischar);
            p.addRequired('fromLane',@isnumeric);
			p.addRequired('profile',@isnumeric);
			p.addRequired('turningRatio',@(x) isa(x, 'containers.Map'));
			p.parse(fromEdge, fromLane, profile, turningRatio);
			this.fromEdge = p.Results.fromEdge;
            this.fromLane = p.Results.fromLane;
			this.profile = p.Results.profile;
			this.turningRatio = p.Results.turningRatio;

		end
	end
end