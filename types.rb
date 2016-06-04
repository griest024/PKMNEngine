module PKMN::Type

	class Base
		extend PKMN::DataClass

		attr_accessor :id
		attr_accessor :name
		attr_accessor :type_class
		attr_accessor :effects

		def initialize(id, name, type_class, effects = {})
			@id = id
			@name = name
			@type_class = type_class
			@effects = effects
		end
		
		def addEffect(id, effect)
			@effects[id] = effect
		end
	end

	# helper to create new types, mainly used by PKMNEE::Import
	def self.new(id, name, type_class, weaknesses, resistances, immunities)
		type = Base.new(id, name, type_class)
		# take the defensive effectiveness of the type and add it to the type
		{little: resistances, very: weaknesses, no: immunities}.each { |effect, types| types.each { |e| type.addEffect(e.to_id, effect) } }
		type # return type
	end
end