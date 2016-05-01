module PKMN::Util

	module Callback

		def call
			raise NotImplementedError("You must override #call")
		end

		module Battle
			include Callback

			def activate
				System.registerCallback(:battle, self)
			end
			
		end

		module Overworld
			include Callback

			def activate
				System.registerCallback(:overworld, self)
			end
			
		end
		
	end
	
end