module PKMN
	module Item

		class Base

			attr_accessor :id
			attr_accessor :name
			attr_accessor :plural_name
			attr_accessor :price
			attr_accessor :description
			attr_accessor :usability
			attr_accessor :effect
			attr_accessor :permenant

			def initialize(id = nil, name = "", plural_name = "")
				@id = id
				@name = name
				@plural_name = plural_name
				@price = 0
				@description = ""
				@usability = []
				@permenant = false
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
		class Item < Base
			def initialize(id = nil, name = "", plural_name = "")
				super(id, name, plural_name)
			end
					
		end

		class Medicine < Base

			def initialize(id = nil, name = "", plural_name = "")
				super(id, name, plural_name)
				@usability << :battle << :overworld << :pokemon
			end
			
			
		end

		class Ball < Base
			def initialize(id = nil, name = "", plural_name = "")
				super(id, name, plural_name)
				@usability << :battle
			end
			
			
		end

		class TM < Base
			attr_accessor :move # the move that this TM teaches
			def initialize(id = nil, name = "", plural_name = "")
				super(id, name, plural_name)
				@usability << :overworld << :pokemon
			end
					
		end

		class Berry < Base # maybe subclass Medicine?
			def initialize(id = nil, name = "", plural_name = "")
				super(id, name, plural_name)
				@usability << :overworld << :pokemon << :battle
			end
					
		end

		class Mail < Base
			def initialize(id = nil, name = "", plural_name = "")
				super(id, name, plural_name)
				@usability << :overworld
			end
					
		end

		class Battle < Base
			def initialize(id = nil, name = "", plural_name = "")
				super(id, name, plural_name)
				@usability << :battle << :pokemon
			end
					
		end

		class KeyItem < Base
			def initialize(id = nil, name = "", plural_name = "")
				super(id, name, plural_name)
			end
					
		end

		class Bag

			attr_accessor :items
			attr_accessor :categories


			def initialize(*items)
				
			end

			def addItems(*items)
				args = {}
				@items.each { |e| args[e] = Item }
			end

			def add(item)
				addItems(item)
			end
			
			
		end
	end
end