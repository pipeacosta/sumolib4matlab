classdef Flow
	properties (GetAccess = private)
		id
		from
		to
		type
		beginTime
		endTime
		number
		color
		departLane
		departPos
		departSpeed
		arrivalLane
		arrivalPos
		arrivalSpeed
	end
	methods
		function this = Flow(varargin)
			p = inputParser;
			p.FunctionName = 'sumolib.Flow';
			p.addRequired('id', @ischar);
			p.addRequired('from', @ischar);
			p.addRequired('to', @ischar)
			p.addOptional('type', [], @ischar)
			p.addOptional('beginTime', [], @isinteger)
			p.addOptional('endTime', [], @isinteger)
			p.addOptional('number', [], @isinteger)
			p.addOptional('color', [], @(x) length(x)<=4 && all(x)>=0 && all(x)<=255)
			p.addOptional('departLane', [], @(x) isinteger(x) || ischar(x))
			p.addOptional('departPos', [], @(x) isnumeric(x) && x>=0 || ischar(x))
			p.addOptional('departSpeed', [], @(x) isnumeric(x) && x>=0 || ischar(x))
			p.addOptional('arrivalLane', [], @(x) isinteger(x) || ischar(x))
			p.addOptional('arrivalPos', [], @(x) isnumeric(x) && x>=0 || ischar(x))
			p.addOptional('arrivalSpeed', [], @(x) isnumeric(x) && x>=0 || ischar(x))
			p.parse(varargin{:})
			
			this.id = p.Results.id;
			this.from = p.Results.from;
			this.to = p.Results.to;
			this.type = p.Results.type;
			this.beginTime = p.Results.beginTime;
			this.endTime = p.Results.endTime;
			this.number = p.Results.number;
			this.color = p.Results.color;
			this.departLane = p.Results.departLane;
			this.departPos = p.Results.departPos;
			this.departSpeed = p.Results.departSpeed;
			this.arrivalLane = p.Results.arrivalLane;
			this.arrivalPos = p.Results.arrivalPos;
			this.arrivalSpeed = p.Results.arrivalSpeed;
			
		end
	end
end