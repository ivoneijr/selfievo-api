class Person < ActiveRecord::Base
	# has_one :user
	# belongs_to :address
	belongs_to :user
	has_one :address
	accepts_nested_attributes_for :address, allow_destroy: true

	def serializable_hash(options = {})
    super({
      only:[
				:id,
				:name,
	      :last_name,
	      :birth_date,
	      :registry,
	      :sex,
	      :phone,
	      :type,
        :created_at,
        :updated_at
      ]
    }.merge(options))
  end

end
