require 'colorizr'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
# =========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
# =========================================================


#This is where you will write your code for the three phases
def phase_one
	puts "Phase 1"
	8.times do
		tribe_lost = @borneo.immunity_challenge
		puts "#{tribe_lost.name} lost the game for immunity.".green
		member_voted_out = tribe_lost.tribal_council
		puts "The tribe has spoken! #{member_voted_out.name.capitalize} it is time to go!".green
		puts
	end
end

def phase_two
	puts "Phase 2"
	3.times do
		immune = @borneo.individual_immunity_challenge
		puts "#{immune.name.capitalize} won the game for individual immunity!".pink
		member_voted_out = @merge_tribe.tribal_council(immune: immune)
		puts "The tribe has spoken! #{member_voted_out.name.capitalize} it is time to go!".pink
		puts
	end
end

def phase_three
	puts "Phase 3"
	7.times do
		immune = @borneo.individual_immunity_challenge
		puts "#{immune.name.capitalize} won the game for individual immunity!".light_blue
		member_voted_out = @merge_tribe.tribal_council(immune: immune)
		puts "The tribe has spoken! #{member_voted_out.name.capitalize} it is time to go!".light_blue
		@jury.add_member(member_voted_out)
		puts "#{member_voted_out.name.capitalize} joined the jury."
		puts
	end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
#phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
