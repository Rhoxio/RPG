require_relative 'controller'

class Person

	attr_accessor :name

	def initialize(name, base_hp, exp = 0, level = 1, skill = 0, money = 0)
		@name = name
		@max_hp = base_hp
		@current_hp = base_hp

		@left_hand = nil
		@right_hand = nil
		
		@exp = exp
		@level = level
		@skill = skill
		
		@bags = []
		@money = 0
	end

	def look
		puts "You see #{@name}."
	end
end

class Player < Person
end

class Enemy
	def initialize
		@name = name
		@max_hp = base_hp
		@current_hp = base_hp
		@exp = exp
		@level = level
		@skill = skill
	end


end

rhoxio = Player.new("Rhoxio", 10)

rhoxio.look

Controller.change_player_name(rhoxio)

rhoxio.look

