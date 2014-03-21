classdef Type
	properties %(GetAccess = private)
		id
		accel
		decel
		sigma
		tau
		length
		minGap
		maxSpeed
		speedFactor
		speedDev
		color
		vClass
		emissionClass
		guiShape
		width
		imgFile
		impatience
		laneChangeModel
	end
	methods
		function this = Type(varargin)
			p = inputParser;
			p.FunctionName = 'sumolib.Type';
			p.addRequired('id', @ischar);
			p.addOptional('accel', 2.6, @isnumeric)
			p.addOptional('decel', 4.5, @isnumeric)
			p.addOptional('sigma', 0.5, @isnumeric)
			p.addOptional('tau', 1, @isnumeric)
			p.addOptional('length', 5, @isnumeric)
			p.addOptional('minGap', 2.5, @isnumeric)
			p.addOptional('maxSpeed', 70, @isnumeric)
			p.addOptional('speedFactor', 1, @isnumeric)
			p.addOptional('speedDev', 0, @isnumeric)
			p.addOptional('color', [1,1,0], @(x) length(x)<=4 && all(x)>=0 && all(x)<=255)
			p.addOptional('vClass', 'unknown', @ischar)
			p.addOptional('emissionClass', 'P_7_7', @ischar)
			p.addOptional('guiShape', 'unknown', @ischar)
			p.addOptional('width', 2, @isnumeric)
			p.addOptional('imgFile', '', @ischar)
			p.addOptional('impatience', 0, @isnumeric)
			p.addOptional('laneChangeModel', 'DK2008', @ischar)
			p.parse(varargin{:})
			
			this.id = p.Results.id;
			this.accel = p.Results.accel;
			this.decel = p.Results.decel;
			this.sigma = p.Results.sigma;
			this.tau = p.Results.tau;
			this.length = p.Results.length;
			this.minGap = p.Results.minGap;
			this.maxSpeed = p.Results.maxSpeed;
			this.speedFactor = p.Results.speedFactor;
			this.speedDev = p.Results.speedDev;
			this.color = p.Results.color;
			this.vClass = p.Results.vClass;
			this.emissionClass = p.Results.emissionClass;
			this.guiShape = p.Results.guiShape;
			this.width = p.Results.width;
			this.imgFile = p.Results.imgFile;
			this.impatience = p.Results.impatience;
			this.laneChangeModel = p.Results.laneChangeModel;
			
		end
	end
end