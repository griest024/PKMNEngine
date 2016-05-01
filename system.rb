module System

	class System

		@@battle_callbacks = []
		@@overworld_callbacks = []
		
		def self.registerCallback(type, obj)
			if type == :battle
				@@battle_callbacks << obj
			elsif type == :overworld
				@@overworld_callbacks << obj
			else
				puts "not recognized callback type"
			end
			
		end


	end


end