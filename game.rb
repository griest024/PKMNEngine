module PKMN

	class Game

		STATUS_DAMAGE_STEPS = 5

		attr_accessor :name # The name of the game - String
		attr_accessor :regions # The regions in the game - Hash(id: Region)
		attr_accessor :species # All the species available - Hash(id: Species)
		attr_accessor :evo_types # All the evolution types available - Hash(id: EvolutionType)
		attr_accessor :items # All the items available - Hash(id: Item)
		attr_accessor :trainers # Contains all trainers and gym leaders - Hash(id: Trainer)
		attr_accessor :types # The pokemon types used in the game - Hash(id: Type)
		attr_accessor :tilesets	# The optional tilesets that maps can use - Hash(id: Tileset)
		attr_accessor :tiles # All the tiles that appear in the game - Array(Tile)
		attr_accessor :music # The soundtrack for the game - Hash(id: Sound)
		attr_accessor :badges # The badges the player can attain - Hash(id: Badge)
		attr_accessor :moves # The moves that Pokemon can learn - Hash(id: Move)
		attr_accessor :hms # List of the HMs in the game - Array(HM)
		attr_accessor :tms # List of the TMs in the game - Array(TM)
		attr_accessor :stats # The stats that are used in the game - Hash(stat: String)
		attr_accessor :abilities # Abilities available - Hash(id: Ability)
		attr_accessor :natures # The natures available in the game - Hash(id: Nature)
		attr_accessor :player # The current (loaded) player - Player
		attr_accessor :statuses

	end

	class Item


		def initialize(args)
			
		end
		
		
	end

	class Bag

		attr_accessor :items
		attr_accessor :categories


		def initialize(*items)
			
		end

		def addItems(*items)
			args = {}
			items.each { |e| args[e] = Item }
		end

		def add(item)
			addItems(item)
		end
		
		
	end

	# Represents the player. This class is slightly bloated so as to allow an instance to
	# function as a save. ***Consider changing this***
	class Player

		attr_accessor :pokedex # The pokedex the game uses - Pokedex
		attr_accessor :bag # The bag that the game uses - Bag
		attr_accessor :name # The player's name
		attr_accessor :pokemon # The pokemon in the player's party - Array(Pokemon)
		attr_accessor :pc


		def initialize(name)
			name= name
			bag= Bag.new
			pokedex= Pokedex.new
		end
		
		
	end

	class Region
		attr_accessor :id # The symbol by which the region is referred to internally - Symbol
		attr_accessor :name # The name that is displayed to the player - String
		attr_accessor :maps # The maps that are used in the region - Hash(id: Map)
		attr_accessor :map # Stores the layout of the maps - RegionMap
	end

	class EncounterList
		attr_accessor :id # The symbol by which the encounters are referred to internally - Symbol

	end

	

	class Battle

		attr_accessor :participants
		attr_accessor :pokemon
		attr_accessor :weather

		def initialize(args)
			
		end
		
		
	end

	# In battle conditional effect that every pokemon has
	class Ability
		attr_accessor :id # The symbol by which the ability is referred to internally - Symbol
		attr_accessor :name # The display name of the ability - String
		attr_accessor :pokemon # The pokemon this ability belongs to - Pokemon

		def initialize(id)
			
		end

		def call(battle)
			
		end

		private :id=
	end

	class Trainer
		attr_accessor :id # The symbol by which the trainer is referred to internally - Symbol
		attr_accessor :name # The name that is displayed to the player
		attr_accessor :sprite # The appearance of the trainer in the overworld
		attr_accessor :battle_sprite # The appearance of the trainer in battle
	end

	
end