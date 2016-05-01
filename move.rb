
# A catalog of possible effects that a move can have, defined here so as to be resusable
module PKMN

	class Move
		attr_accessor :id # The symbol by which the move is referred to internally - Symbol
		attr_accessor :name # The name that is displayed to player - String
		attr_accessor :type # The type of the move - Type
		attr_accessor :category # The category of the move (physical, special, status) - Symbol
		attr_accessor :pp # The current pp of the move - Number
		attr_accessor :max_pp # The maximum pp of the move - Number
		attr_accessor :power # The power of the move - Number
		attr_accessor :accuracy # The accuracy of the move - Number
		attr_accessor :description # Description of the move - String
		attr_accessor :pokemon # The pokemon this move belongs to - Pokemon

		def initialize(move_name, move_type, move_category, move_max_pp, move_power, move_accuracy)
			name= move_name
			type= move_type
			category= move_category
			max_pp= move_max_pp
			power= move_power
			accuracy= move_accuracy
		end

		def call(target, user, battle)
			target.damage(power)
			effect(target, user, battle)
		end

		def effect(target, user, battle)
			
		end
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

end