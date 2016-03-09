class Game
	attr_reader :tribes

	def initialize(*tribes)
		@tribes = tribes
	end

	def add_tribe(tribe)
		@tribes << tribe
	end

	def immunity_challenge
		@tribes.sample
	end
		
	def clear_tribes
		@tribes = []
	end

	def merge(merged_tribe)
		all_members = [] 
		@tribes.each {|tribe| all_members += tribe.members}
		clear_tribes
		new_tribe = (Tribe.new({name: merged_tribe, members: all_members}))
		add_tribe(new_tribe)
		return new_tribe
	end

	def individual_immunity_challenge
		@tribes.sample.members.sample
	end
end