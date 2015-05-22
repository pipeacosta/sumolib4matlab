classdef TurnProbability
	properties %(GetAccess = private)
%         beginTime
%         endTime
        fromEdge
        toEdges
        probabilities
    end
	methods
		function this = TurnProbability(varargin)
			p = inputParser;
			p.FunctionName = 'sumolib.demand.TurnProbability';
% 			p.addRequired('beginTime', @isnumeric);
% 			p.addRequired('endTime', @isnumeric);
            p.addRequired('fromEdge', @ischar);
            p.addRequired('toEdges', @iscell);
            p.addRequired('probabilities', @iscell);
            
			p.parse(varargin{:})
			
% 			this.beginTime = p.Results.beginTime;
%             this.endTime = p.Results.endTime;
			this.fromEdge = p.Results.fromEdge;
            this.toEdges = p.Results.toEdges;
			this.probabilities = p.Results.probabilities;
			
		end
	end
end