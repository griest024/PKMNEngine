module PKMN

	class Item

		attr_accessor :id
		attr_accessor :name
		attr_accessor :plural_name
		attr_accessor :price
		attr_accessor :description
		attr_accessor :usability
		attr_accessor :effect
		attr_accessor :permenant


		def initialize(id_, name_, p_name)
			id= id_
			name= name_
			plural_name= p_name
			price= 0
			description= ""
			usability= []
		end

		# checks if the item can be used in the given context
		def use?(context)
			usability.contains?(context)
		end

		def used(reciever)
			
		end
		
		# called when a pokemon is given this item
		def held(pkmn)
			
		end

		# alias for can_hold?
		def hold?
			can_hold?
		end

		# specifies if this item can be held
		def can_hold?
			true
		end
		
	end

	class Medicine < Item

		def initialize(id_, name_, p_name)
			super(id_, name_, p_name)
			usability << :battle << :overworld << :pokemon
		end
		
		
	end

	class Ball < Item
		def initialize(id_, name_, p_name)
			super(id_, name_, p_name)
			usability << :battle
		end
		
		
	end

	class TM < Item
		def initialize(id_, name_, p_name)
			super(id_, name_, p_name)
			usability << :overworld << :pokemon
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
	
end