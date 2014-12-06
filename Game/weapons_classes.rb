class Weapon 

	attr_reader :name, :type, :durability, :ranged

	def initialize(name, type, attack = 1, defense = 0, magical = false)
		@name = name
		@type = type
		@durability = 100
		@attack = nil
		@defense = nil
		@magical = false
		@ranged = false
	end
end

class Sword < Weapon
	def initialize(name, type)
		super
		@name = name
		@type = type
	end
end

class Bow < Weapon
	def initialize(name, type)
		super
		@name = name
		@type = type
		@ranged = true
	end
end

excalibur = Sword.new("Excalibur", "Broadsword")
thoridal = Bow.new("Thori'dal", "Longbow")