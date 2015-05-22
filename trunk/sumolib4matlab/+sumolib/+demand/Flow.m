classdef Flow
	properties %(GetAccess = private)
%         beginTime
%         endTime
        type
		from
		to
        via
		demandType
        demand
        number
		color
		departLane
		departPos
		departSpeed
		arrivalLane
		arrivalPos
		arrivalSpeed
        line
        personNumber
        containerNumber
    end
	methods
		function this = Flow(varargin)
            
            demandTypes = {'vehsPerHour', 'period', 'probability'};
            departLaneTypes = {'random','free','departLane'};
            departPosTypes = {'random','free','random_free','base'};
            departSpeedTypes = {'random','max'};
            arrivalLaneTypes = {'current'};
            arrivalPosTypes = {'random','max'};
            arrivalSpeedTypes = {'current'};
            
			p = inputParser;
			p.FunctionName = 'sumolib.demand.Flow';
			p.addRequired('from', @ischar);
% 			p.addRequired('beginTime', @isnumeric);
% 			p.addOptional('endTime', [], @isnumeric)
			p.addOptional('type', [], @(x) isa(x,'sumolib.demand.VehicleType'))
            p.addOptional('to', [], @ischar)
            p.addOptional('via', [], @ischar)
            p.addOptional('demandType', [], @(x) any(validatestring(x,demandTypes)))
            p.addOptional('demand', [], @isnumeric)
			p.addOptional('number', [], @isnumeric)
			p.addOptional('color', [], @(x) length(x)<=4 && all(x)>=0 && all(x)<=255)
			p.addOptional('departLane', [], @(x) isinteger(x) || any(validatestring(x,departLaneTypes)))
			p.addOptional('departPos', [], @(x) isnumeric(x) && x>=0 || any(validatestring(x,departPosTypes)))
			p.addOptional('departSpeed', [], @(x) isnumeric(x) && x>=0 || any(validatestring(x,departSpeedTypes)))
			p.addOptional('arrivalLane', [], @(x) isnumeric(x) || any(validatestring(x,arrivalLaneTypes)))
			p.addOptional('arrivalPos', [], @(x) isnumeric(x) && x>=0 || any(validatestring(x,arrivalPosTypes)))
			p.addOptional('arrivalSpeed', [], @(x) isnumeric(x) && x>=0 || any(validatestring(x,arrivalSpeedTypes)))
			p.parse(varargin{:})
            
            if xor(isempty(p.Results.demandType),isempty(p.Results.demand))
                throw(MException('Flow:demandError',...
                    'Demand type or demand is not specified'));
            end
            
            if isempty(p.Results.demand) && isempty(p.Results.number)
                throw(MException('Flow:demandError',...
                    'You have to provide demand type or vehicle number'));
            end
            
            this.from = p.Results.from;
%             this.beginTime = p.Results.beginTime;
% 			this.endTime = p.Results.endTime;
            this.type = p.Results.type;
			this.from = p.Results.from;
			this.to = p.Results.to;
            this.via = p.Results.via;
            this.demandType = p.Results.demandType;
			this.demand = p.Results.demand;
			this.number = p.Results.number;
			this.color = num2str(p.Results.color);
            this.color = strrep(this.color, '  ', ',');
			this.departLane = p.Results.departLane;
			this.departPos = p.Results.departPos;
			this.departSpeed = p.Results.departSpeed;
			this.arrivalLane = p.Results.arrivalLane;
			this.arrivalPos = p.Results.arrivalPos;
			this.arrivalSpeed = p.Results.arrivalSpeed;
			
		end
	end
end