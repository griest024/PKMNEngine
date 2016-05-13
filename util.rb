module PKMN::Util

	# responsible for storing and notifying classes that want to respond to a certain event
	module Callback

		# creates a new callback
		# name - the name of the callback
		# system_event - the optional system event this callback will listen for
		# call_method - a block to define a custom callback method
		def self.new(name, system_event = nil, &callback_method)
			name = name.to_sym
			mod = Module.new do
				@receivers = []
				call_method = lambda { raise NotImplementedError.new("You must override callback") } if !call_method
				define_method(:callback, callback_method)
				def self.trigger
					receivers.each { |e| e.callback }
				end
				def self.included(klass)
					klass.class_variable_set(:callback_module, self)
				end
				def self.addReceiver(receiver)
					@receivers << receiver
				end
				def activate
					@@callback_module.addReceiver(self)
				end
			end
			const_set(name, mod)
		end
		
	end
	
end