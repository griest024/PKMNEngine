module PKMN::Util

	# responsible for storing and notifying classes that want to respond to a certain event
	module Callback
		@callbacks = {}
		# creates a new callback
		# name - the name of the callback
		# system_event - the optional system event this callback will listen for
		# call_method - a block to define a custom callback method
		def self.newCallback(name, system_event = nil, &callback_method)
			name = name.to_sym
			mod = Module.new do
				@receivers = []
				call_method = lambda { raise NotImplementedError.new("You must override ##{name}") } if !call_method
				define_method(name, callback_method)
				def self.trigger
					@receivers.each { |e| e.callback }
				end
				def self.included(klass)
					klass.class_variable_set("@@#{name}_callback_module".to_sym, self)
				end
				def self.addReceiver(receiver)
					@receivers << receiver
				end
				def self.getReceivers
					self.receivers
				end
				def self.receivers
					@receivers
				end
				def activate
					class_variable_get("@@#{name}_callback_module".to_sym).addReceiver(self)
				end
			end
			const_set(name, mod)
			self.callbacks[name] = mod
			mod
		end

		def self.callbacks
			@callbacks
		end
		
		def self.callback(name)
			self.callbacks[name.to_sym]
		end

		def self.getCallbacks
			self.callbacks
		end

		def self.getCallback(name)
			self.callback(name)
		end

		def self.get(name = nil)
			name ? self.callback(name) : self.callbacks
		end
	end
	
end