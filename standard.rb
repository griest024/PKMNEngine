module PKMN

	class Game

		STATUS_DAMAGE_STEPS = 5
		POISON_PERCENT_DAMAGE = 1
		BURN_PERCENT_DAMAGE = 2
		
	end

	module Move

		module Effect

			# 002 
			def hurtUserQuarter(user)
				user.reduceHPPercent(25)
			end

			def poison(target)
				target
			end


		end
	end

	module Pokemon

		module Effect

			class BattlePoison < BattleEffect
				
				def call
					pokemon.reduceHPPercent($game.POISON_PERCENT_DAMAGE)
				end
			end

			class BattleBadPoison < BattleEffect
				attr_accessor :percent
				def initialize(pkmn = nil)
					super(pkmn)
					percent= POISON_PERCENT_DAMAGE
				end
				
				def call
					pokemon.reduceHPPercent(percent)
					percent= percent + 1
				end
			end

			class OverworldPoison < OverworldEffect
				
				def call
					pokemon.reduceHPPercent($game.POISON_PERCENT_DAMAGE)
				end
			end
			
		end

		module Status


			
		end
		
	end
	
end