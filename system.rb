module System

	class System < JavaFX::Application

		@@battle_callbacks = {}
		@@overworld_callbacks = []
		
		def self.registerCallback(type, obj, battle_phase = nil)
			if type == :battle
				@@battle_callbacks[obj] = battle_phase
			elsif type == :overworld
				@@overworld_callbacks << obj
			else
				puts "not recognized callback type"
			end
			
		end


	end


end