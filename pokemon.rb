module PKMN

	class Effect
		attr_accessor :pokemon

		def initialize(pkmn = nil)
			setPokemon(pkmn) if pkmn
		end

		def setPokemon(pkmn)
			pokemon= pkmn
			pkmn.applyEffect(self)
		end
	end

	class BattleEffect < Effect
		include Util::Callback::Battle
	end

	class OverworldEffect < Effect
		include Util::Callback::Overworld
	end

	module Status


		
	end

	class Status

		attr_accessor :pokemon
		attr_accessor :effect

		def initialize(pkmn = nil)
			setPokemon(pkmn) if pkmn
		end

		def setPokemon(pkmn)
			pokemon= pkmn
			effect.setPokemon(pkmn)
		end
			
	end

	class Species
		attr_accessor :id # The symbol by which the species is referred to internally - Symbol
		attr_accessor :stats # The stat weights for the species, keys must match Game.stats - Hash(stat: Number)
		attr_accessor :sprite # The appearance of the pokemon ingame - Sprite
		attr_accessor :battle_sprite # The appearance of the pokemon in battle
		attr_accessor :name # The name of the species displayed ingame - String
		attr_accessor :evolutions # The possible evolutions of this species - Hash(evo_type.id: Species)
		attr_accessor :level_moves # The moves the species learns by leveling up - Array(Move)
		attr_accessor :tm_moves # The moves the species learns by TM - Array(ToF)
		attr_accessor :hm_moves # The moves the species learns by HM - Array(ToF)
		attr_accessor :description # A description of the species (displayed by pokedex) - String
		attr_accessor :cry # The sound that the species makes - Sound
		attr_accessor :habitat # The regions and maps this species can be found - Hash(Region.id: Array(Map))
		attr_accessor :xp_level # The total xp required to reach each level - Array(Number)
		attr_accessor :abilities # The abilities that this species can have - Array(Ability)
	end

	class Pokemon
		attr_accessor :name # The (nick)name of the pokemon, defaults to species.name - String
		attr_accessor :species # The species of the pokemon - Species
		attr_accessor :hp # Current HP of pokemon, defaults to stats[:hp] - Number
		attr_accessor :moves # The moves the pokemon currently knows, defaults to  - Array[4](Move)
		attr_accessor :level # The current level of the pokemon - Number(1-100)
		attr_accessor :xp # The current amount of XP this pokemon has, defaults to species.xp_level[level] - Number
		attr_accessor :ability # The ability the pokemon has - Ability
		attr_accessor :evs # The EVs of the pokemon - Hash(stat: Number(0-31))
		attr_accessor :ivs # The IVs of the pokemon, default to random numbers between 0,31 - Hash(stat: Number(0-31))
		attr_accessor :stats # The current stats of the pokemon - Hash(stat: Number)
		attr_accessor :nature # The nature of the pokemon, defaults to random Game.natures - Nature
		attr_accessor :ot # The name of the trainer that originally captured this pokemon, defaults to player.name - String
		attr_accessor :secret_id # The id of the pokemon, defaults to random - Number(0-65535)
		attr_accessor :last_move # The move last used by the pokemon - Move
		attr_accessor :owner # The current owner of the pokemon - Player
		attr_accessor :status # The current status of the pokemon - Pokemon::Status
		attr_accessor :effects # All the current effects being applied to this pokemon - Array[Effect]

		def initialize(species, level = 1)
			typeCheck(species => Species, level => Number)
			rng = Random.new
			name= species.name
			xp= species.xp_level[level]
			evs= {}
			$game.stats.each { |k,v| evs[k] = 0 }
			ivs= {}
			$game.stats.each { |k,v| ivs[k] = rng.rand(31) }
			calculate_stats
			hp= stats[:hp]
			ot= $player.name
			nature= $game.natures.values.sample
			ability= species.abilities.sample
			secret_id= rng.rand(65535)
		end

		def applyEffect(ef)
			ef.pokemon= self
			effects << ef if !effects.include?(ef)
			ef.activate
		end

		def setStatus(st)
			status= st if !status
		end

		def clearStatus
			effects.delete(status.effect)
			status= nil
		end

		def damage(power)
			
		end

		def reduceHP(amount)
			hp= hp - amount
		end

		def reduceHPPercent(percent)
			hp= hp * (percent / 100)
		end

		private :id=
	end
	
end