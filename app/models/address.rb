class Address < ActiveRecord::Base
	# has_one :person
	belongs_to :person

	def serializable_hash(options = {})
		super({
			only:[
				:id,
				:street,
	      :number,
	      :neighborhood,
	      :city,
	      :state,
	      :zip,
	      :complement
			]
		}.merge(options))
	end

end
