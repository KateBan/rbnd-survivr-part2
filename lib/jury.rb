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
			vote = finalists.sample
			puts "#{member}"
			finalists_votes[vote] += 1
		end
		return finalists_votes

	def report_votes(final_votes)
	end
	end


end
