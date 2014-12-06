class Controller

	class << self
		def clear_screen!
		  print "\e[2J"
		end

		def move_to_home!
		  print "\e[H"
		end

		def slider_generator
			@guide_array = Array.new(50, "-")
			@guide_array[26] = "]"
			@guide_array[25] = " "
			@guide_array[24] = "["
		end

		def loop_incremented_index
			index = 0
			while index < 50 do
				sleep(0.01)
				slider_generator
				@guide_array[index] = "|"
				pretty_guide
				index += 1
			end
		end

		def loop_decremented_index
			index = 50
			while index >= 0 do
				sleep(0.01)
				slider_generator
				@guide_array[index] = "|"
				pretty_guide
				index -= 1
			end
		end

		def pretty_guide
			move_to_home!
			clear_screen!
			p @guide_array.join('')
		end

		def aim_display_loop
			while true
			  loop_incremented_index
				loop_decremented_index
				pretty_guide
			end
		end

		def aim_loop
			input = nil
			worker_thread = Thread.new do
				while input != /^d$/i
				    aim_display_loop
				end
			end
			input = gets.chomp
			return @guide_array.index('|')
		end
	end

	def self.change_player_name(player)
		puts "What would you like your new name to be?"
		input = gets.chomp
		player.name = input.to_s
		puts "You have changed your name to #{input}"
	end

	def self.attack(attacker, target)
	end

	def self.equip_weapon(player, weapon_name)	
	end

	def self.bag_display(items)
		items.each do |item|
			puts item.name
		end
	end

end

p Controller.aim_loop