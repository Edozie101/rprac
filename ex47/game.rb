class Room
	def initialize(name,description)
		@name = name
		@description = description
		@paths = {}

	end


	#these attr_readeer and attr_accessors help you to access the variables
	#they take symbols

	attr_reader :name,:paths,:description
	#make sure that the attr_reader attributes spell up correctly and everything matches

	def go(direction)
		return @paths[direction]
	end

	def add_paths (paths)
		@paths.update(paths)
	end





end
