class Jury
	attr_accessor :members

	def initialize
		@members = []
    end

	def add_member(member)
		@member = member
		@members << member

	end

	def members
		@members
	end

	def cast_votes(finalists)
		finalists_votes = {}
		finalists.each {|finalist| finalists_votes[finalist] = 0}
		@members.each do |member|
			votes = finalists.sample
			puts "#{member}"
			finalists_votes[votes] += 1
		end
		return finalists_votes
	end

	def report_votes(final_votes)
		final_votes.each {|key,votes| puts "#{key.to_s.capitalize} got #{votes} votes"}
	end

	def announce_winner(final_votes)
		final_votes.each do |key, votes|
			if votes >= 4
				puts "The winner is #{key}"
				return key
			end
	 	end
	end
	

end
