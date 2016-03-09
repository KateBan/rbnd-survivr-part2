class Tribe
	attr_reader :name, :members
	
	def initialize(options = {})
		@name = options[:name]
		@members = options[:members]
		puts "Tribe #{name} created."
	end

	def name
		@name
	end

	def members
		@members
	end

	def to_s
		@name
	end

	 def tribal_council(options = {})
	 	immune = options[:immune]
  		member = @members.reject { |member| member == immune }.sample
  		@members.delete(member)
  		return member
  	end

end