class Controller
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



test = Controller.new

p test.aim_loop

# @guide_array.index("|")
# @guide_array.join('')
# p @guide_array.index{|x| x=="|"}
# p @guide.index{|x| x=="|"}

# aim_tracker

# Thread.start { aim_tracker }



