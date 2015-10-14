class Person < ActiveRecord::Base
	has_one :user
	belongs_to :address

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
