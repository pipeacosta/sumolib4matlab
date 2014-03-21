classdef FlowProfile
%FlowProfile Construct a FlowProfile representing a time-dependent vehicle demand.
%   myFlowProfile = FlowProfile(FROMEDGE,PROFILE,TURNINGRATIO) Constructs a 
%   FlowProfile object. FROMEDGE is the id of the edge from which vehicles
%   are generated. PROFILE is a vector containing the samples of the
%   time-dependent demand. Finally, TURNINGRATIO is a containers.Map object
%   that maps the name of the edges connected to FROMEDGE, to the
%   corresponding turning probability.

%   Copyright 2014 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id$

	properties
		fromEdge
		profile
		turningRatio
% 		beginTime = 0
% 		endTime = 24*3600
	end
	methods
		function this = FlowProfile(fromEdge, profile,...
				turningRatio)
			
			
			
% 			p = inputParser;
% 			p.FunctionName = 'FlowProfile';
% 			p.addRequired('fromEdge',@ischar);
% 			p.addRequired('profile',@isnumeric);
% 			p.addRequired('turningRatio',@(x) isa(x, 'containers.Map'));
% 			p.addOptional('beginTime', 0, @(x) isnumeric(x) && length(x) == 1 && x >= 0);
% 			p.addOptional('endTime', 24*3600, @(x) isnumeric(x) && length(x) == 1 && x >= this.beginTime);
% 			p.parse(fromEdge, profile, turningRatio, varargin{:});
% 			this.fromEdge = p.Results.fromEdge;
% 			this.profile = p.Results.profile;
% 			this.turningRatio = p.Results.turningRatio;
% 			this.beginTime = p.Results.beginTime;
% 			this.endTime = p.Results.endTime;

			this.fromEdge = fromEdge;
			this.profile = profile;
			this.turningRatio = turningRatio;
		end
	end
end